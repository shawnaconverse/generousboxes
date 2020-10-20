package com.com.generousboxes.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.com.generousboxes.models.Partner;


@Repository
public interface PartnerRepo extends CrudRepository<Partner, Long> {
	Partner findByEmail(String email);
	
	List<Partner> findAll();
}
