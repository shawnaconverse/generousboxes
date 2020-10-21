package com.com.generousboxes.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.com.generousboxes.models.Donation;
import com.com.generousboxes.models.Partner;
import com.com.generousboxes.services.PartnerService;
import com.com.generousboxes.validators.PartnerValidator;

@Controller
@RequestMapping("/partners")
public class PartnersController {
	@Autowired
	private PartnerService partnerService;
	
	@Autowired
	private PartnerValidator pValidator;

	@GetMapping("/login")
	public String loginPage() {
		return "partner_login.jsp";
	}
	
	@GetMapping("/registration")
	public String registrationPage(@ModelAttribute("partner") Partner u, Model model) {
		return "partner_registration.jsp";
	}
	
	@PostMapping("/registration")
	public String registerPartner(@Valid @ModelAttribute("partner") Partner partner, 
								BindingResult result,
								HttpSession session,
								Model model) {
		pValidator.validate(partner, result);
		if (result.hasErrors()) {
			return "partner_registration.jsp";
		} else {
			Partner registeredPartner = partnerService.registerPartner(partner);
			session.setAttribute("upid", registeredPartner.getId());
			return "redirect:/partners/donate";
		}
	}
	
	@PostMapping("/login")
	public String loginPartner(@RequestParam("email") String email, 
			@RequestParam("password") String password,
							Model model,
							HttpSession session) {
		if (!partnerService.authenticatePartner(email, password)) {
			model.addAttribute("error", "Invalid login!");
			return "partner_login.jsp";
		} else {
			Partner partner = partnerService.findByEmail(email);
			session.setAttribute("upid", partner.getId());
			return "redirect:/partners/donate";
		}
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("upid", null);
		return "redirect:/home";
	}
	
	@GetMapping("/donate")
	public String donate(HttpSession session, Model model) {
		if (session.getAttribute("upid") != null) {
			Long upid = (Long) session.getAttribute("upid");
			Partner p = partnerService.findPartnerById(upid);
			model.addAttribute("partner", p);
			return "donations.jsp";			
		} else {
			return "redirect:/partners/login";
		}
	}
	
	@PostMapping("/donate")
	public String donate(@Valid @ModelAttribute("donation") Donation d, BindingResult result, HttpSession session, Model model) {
		Long upid = (Long) session.getAttribute("upid");
		Partner p = partnerService.findPartnerById(upid);
		if (result.hasErrors()) {
			model.addAttribute("partner", p);
			return "redirect:new_donation.jsp";
		} else {
			p = partnerService.addDonation(upid, d);
			return "redirect:/partners/donate";
		}
	}
	
	@GetMapping("/donate/new")
	public String newDonation(@ModelAttribute("donation") Donation d, HttpSession session, Model model) {
		Long upid = (Long) session.getAttribute("upid");
		Partner p = partnerService.findPartnerById(upid);
		model.addAttribute("partner", p);
		return "new_donation.jsp";
	}
	
}
