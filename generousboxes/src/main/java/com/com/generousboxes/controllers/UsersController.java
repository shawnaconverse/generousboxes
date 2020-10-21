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

import com.com.generousboxes.models.Order;
import com.com.generousboxes.models.User;
import com.com.generousboxes.services.UserService;
import com.com.generousboxes.validators.UserValidator;

@Controller
public class UsersController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserValidator uValidator;
	
	@GetMapping("/login")
	public String loginPage() {
		return "user_login.jsp";
	}
	
	@GetMapping("/registration")
	public String registrationPage(@ModelAttribute("user") User u, Model model) {
		return "user_registration.jsp";
	}
	
	@PostMapping("/registration")
	public String registerUser(@Valid @ModelAttribute("user") User user, 
								BindingResult result,
								HttpSession session,
								Model model) {
		uValidator.validate(user, result);
		if (result.hasErrors()) {
			return "user_registration.jsp";
		} else {
			User registeredUser = userService.registerUser(user);
			session.setAttribute("uuid", registeredUser.getId());
			return "redirect:/home";
		}
	}
	
	@PostMapping("/login")
	public String loginUser(@RequestParam("email") String email, 
			@RequestParam("password") String password,
							Model model,
							HttpSession session) {
		if (!userService.authenticateUser(email, password)) {
			model.addAttribute("error", "Invalid login!");
			return "user_login.jsp";
		} else {
			User user = userService.findByEmail(email);
			session.setAttribute("uuid", user.getId());
			return "redirect:/home";
		}
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("uuid", null);
		return "redirect:/home";
	}
	
	
	@GetMapping("/orders")
	public String orders(HttpSession session, Model model) {
		if (session.getAttribute("uuid") == null) {
			return "redirect:/home";
		} else {
			Long uuid = (Long) session.getAttribute("uuid");
			User u = userService.findUserById(uuid);
			model.addAttribute("user", u);
			return "orders.jsp";
		}		
	}
	
	@PostMapping("/orders")
	public String orders(@Valid @ModelAttribute("order") Order o, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			return "new_order.jsp";
		} else {
			Long uuid = (Long) session.getAttribute("uuid");
			o.setUser(userService.findUserById(uuid));
			Order order = userService.createOrder(o);
//			userService.addOrder(uuid, order);
			userService.subscribe(uuid);
			return "redirect:/orders";
		}
	}
	
	@GetMapping("/orders/new")
	public String newOrder(@ModelAttribute("order") Order o, HttpSession session, Model model) {
		if (session.getAttribute("uuid") == null) {
			return "redirect:/home";
		} else {
			Long uuid = (Long) session.getAttribute("uuid");
			User u = userService.findUserById(uuid);
			model.addAttribute("user", u);
			return "new_order.jsp";
		}
	}
	
	@GetMapping("/orders/cancel")
	public String cancelSub(HttpSession session) {
		if (session.getAttribute("uuid") == null) {
			return "redirect:/home";
		} else {
			Long uuid = (Long) session.getAttribute("uuid");
			userService.unsubscribe(uuid);
			return "redirect:/orders";
		}
	}
}
