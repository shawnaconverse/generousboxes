package com.com.generousboxes.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com.generousboxes.models.Charity;
import com.com.generousboxes.repos.CharityRepo;

@Service
public class MiscService {
	@Autowired
	private CharityRepo charityRepo;
	
	public List<Charity> findAllCharities() {
		return charityRepo.findAll();
	}
	
	public Charity findCharityById(Long id) {
		Optional<Charity> c = charityRepo.findById(id);
		
		if (c.isPresent()) {
			return c.get();
		} else {
			return null;
		}
	}
	
	public Charity createCharity(Charity c) {
		return charityRepo.save(c);
	}
	
	public Charity updateCharity(Long id, Charity c) {
		Charity charity = findCharityById(id);
		charity.setName(c.getName());
		return charityRepo.save(charity);
	}
	
	public void deleteCharity(Long id) {
		charityRepo.deleteById(id);
	}
}


