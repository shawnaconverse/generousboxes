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
import org.springframework.web.bind.annotation.RequestParam;

import com.com.generousboxes.models.User;
import com.com.generousboxes.services.UserService;
import com.com.generousboxes.validators.UserValidator;

@Controller
public class UsersController {
	@Autowired
	private UserService api;
	
	@Autowired
	private UserValidator uValidator;
	
	private String[] allStates  = {"AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI","ID", "IL", "IN", "IA", "KS", 
			"KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK",
			"OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"};
	
	@GetMapping("/")
	public String index(HttpSession session) {
		if (session.getAttribute("uuid") == null) {
			return "redirect:/login";
		} else {
			return "redirect:/home";
		}
	}
	
	@GetMapping("/login")
	public String loginPage() {
		return "login/login.jsp";
	}
	
	@GetMapping("/registration")
	public String registrationPage(@ModelAttribute("user") User u, Model model) {
		model.addAttribute("states", this.allStates);
		return "login/registration.jsp";
	}
	
	@PostMapping("/registration")
	public String registerUser(@Valid @ModelAttribute("user") User user, 
								BindingResult result,
								HttpSession session,
								Model model) {
		uValidator.validate(user, result);
		if (result.hasErrors()) {
			model.addAttribute("states", this.allStates);
			return "login/registration.jsp";
		} else {
			User registeredUser = api.registerUser(user);
			session.setAttribute("uuid", registeredUser.getId());
			return "redirect:/home";
		}
	}
	
	@PostMapping("/login")
	public String loginUser(@RequestParam("email") String email, 
			@RequestParam("password") String password,
							Model model,
							HttpSession session) {
		if (!api.authenticateUser(email, password)) {
			model.addAttribute("error", "Invalid login!");
			return "login/login.jsp";
		} else {
			User user = api.findByEmail(email);
			session.setAttribute("uuid", user.getId());
			return "redirect:/home";
		}
		
	}
	
	// Main exit method from UserController to other controllers
	@GetMapping("/home")
	public String home(HttpSession session, Model model) {
		if (session.getAttribute("uuid") == null) {
			return "redirect:/login";
		} else {
			return "redirect:/tasks";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("uuid", null);
		return "redirect:/login";
	}
}
