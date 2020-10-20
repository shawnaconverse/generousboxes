package com.com.generousboxes.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.com.generousboxes.models.Order;

@Repository
public interface OrderRepo extends CrudRepository<Order, Long> {
	List<Order> findAll();
}
