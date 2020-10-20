package com.com.generousboxes.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.com.generousboxes.models.Charity;
import com.com.generousboxes.models.Partner;
import com.com.generousboxes.models.User;
import com.com.generousboxes.services.MiscService;
import com.com.generousboxes.services.PartnerService;
import com.com.generousboxes.services.UserService;

@Controller
public class MainController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private PartnerService partnerService;
	
	@Autowired
	private MiscService miscService;
	
	

	@GetMapping("/")
	public String index(HttpSession session) {
		return "redirect:/home";
	}
	
	// Main exit method from UserController to other controllers
	@GetMapping("/home")
	public String home(HttpSession session, Model model) {
		if (session.getAttribute("upid") != null) {
			Long upid = (Long) session.getAttribute("upid");
			Partner p = partnerService.findPartnerById(upid);
			model.addAttribute("partner", p);
		}
		if (session.getAttribute("uuid") != null) {
			Long uuid = (Long) session.getAttribute("uuid");
			User u = userService.findUserById(uuid);
			model.addAttribute("user", u);
		}
		
		return "home.jsp";
	}
	
	@GetMapping("/charity")
	public String charity(HttpSession session, Model model) {
		if (session.getAttribute("upid") != null) {
			Long upid = (Long) session.getAttribute("upid");
			Partner p = partnerService.findPartnerById(upid);
			model.addAttribute("partner", p);
		}
		if (session.getAttribute("uuid") != null) {
			Long uuid = (Long) session.getAttribute("uuid");
			User u = userService.findUserById(uuid);
			model.addAttribute("user", u);
		}
		List<Charity> c = miscService.findAllCharities();
		model.addAttribute("charities", c);
		
		return "charity.jsp";
	}
	
	@GetMapping("/aboutus")
	public String aboutUs(HttpSession session, Model model) {
		if (session.getAttribute("upid") != null) {
			Long upid = (Long) session.getAttribute("upid");
			Partner p = partnerService.findPartnerById(upid);
			model.addAttribute("partner", p);
		}
		if (session.getAttribute("uuid") != null) {
			Long uuid = (Long) session.getAttribute("uuid");
			User u = userService.findUserById(uuid);
			model.addAttribute("user", u);
		}
		
		return "aboutus.jsp";
	}
	
}
