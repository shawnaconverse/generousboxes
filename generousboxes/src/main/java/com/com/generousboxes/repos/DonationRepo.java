package com.com.generousboxes.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.com.generousboxes.models.Donation;

@Repository
public interface DonationRepo extends CrudRepository<Donation, Long> {
	List<Donation> findAll();
}
