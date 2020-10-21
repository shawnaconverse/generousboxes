package com.com.generousboxes.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com.generousboxes.models.Order;
import com.com.generousboxes.models.User;
import com.com.generousboxes.repos.OrderRepo;
import com.com.generousboxes.repos.UserRepo;

@Service
public class UserService {
	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private OrderRepo orderRepo;
	
	public User registerUser(User user) {
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		return userRepo.save(user);
	}
	
	public List<User> findAllUsers() {
		return userRepo.findAll();
	}
	
	public User findByEmail(String email) {
		return userRepo.findByEmail(email);
	}
	
	public User findUserById(Long id) {
		Optional<User> u = userRepo.findById(id);
		
		if (u.isPresent()) {
			return u.get();
		} else {
			return null;
		}
	}
	
	public boolean authenticateUser(String email, String password) {
		User user = userRepo.findByEmail(email);
		if (user == null) {
			return false;
		} else {
			if (BCrypt.checkpw(password, user.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	public User addOrder(Long id, Order o) {
		User u = findUserById(id);
		List<Order> orders = u.getOrders();
		orders.add(o);
		u.setOrders(orders);
		orders = u.getOrders();
		for (int i = 0; i < orders.size(); i++) {
			System.out.println(orders.get(i).getBoxType());
		}
		return userRepo.save(u);
	}
	
	public User subscribe(Long id) {
		User u = findUserById(id);
		u.setSubscription(true);
		return userRepo.save(u);
	}
	
	public User unsubscribe(Long id) {
		User u = findUserById(id);
		u.setSubscription(false);
		return userRepo.save(u);
	}
	
	public List<Order> findAllOrders() {
		return orderRepo.findAll();
	}
	
	public Order findOrderById(Long id) {
		Optional<Order> o = orderRepo.findById(id);
		
		if (o.isPresent()) {
			return o.get();
		} else {
			return null;
		}
	}
	
	public Order createOrder(Order o) {
		return orderRepo.save(o);
	}
	
	public Order updateOrder(Long id, Order o) {
		Order order = findOrderById(id);
		order.setBoxType(o.getBoxType());
		order.setBoxCount(o.getBoxCount());
		return orderRepo.save(order);
	}
	
	public void deleteOrder(Long id) {
		orderRepo.deleteById(id);
	}
}
