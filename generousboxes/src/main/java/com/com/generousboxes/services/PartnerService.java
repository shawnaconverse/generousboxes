package com.com.generousboxes.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com.generousboxes.models.Donation;
import com.com.generousboxes.models.Partner;
import com.com.generousboxes.repos.DonationRepo;
import com.com.generousboxes.repos.PartnerRepo;

@Service
public class PartnerService {
	@Autowired
	private PartnerRepo partnerRepo;
	
	@Autowired
	private DonationRepo donationRepo;
	
	public Partner registerPartner(Partner partner) {
		String hashed = BCrypt.hashpw(partner.getPassword(), BCrypt.gensalt());
		partner.setPassword(hashed);
		return partnerRepo.save(partner);
	}
	
	public List<Partner> findAllPartners() {
		return partnerRepo.findAll();
	}
	
	public Partner findByEmail(String email) {
		return partnerRepo.findByEmail(email);
	}
	
	public Partner findPartnerById(Long id) {
		Optional<Partner> u = partnerRepo.findById(id);
		
		if (u.isPresent()) {
			return u.get();
		} else {
			return null;
		}
	}
	
	public boolean authenticatePartner(String email, String password) {
		Partner partner = partnerRepo.findByEmail(email);
		if (partner == null) {
			return false;
		} else {
			if (BCrypt.checkpw(password, partner.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	public Partner addDonation(Long id, Donation d) {
		Partner p = findPartnerById(id);
		List<Donation> donations = p.getDonations();
		donations.add(d);
		p.setDonations(donations);
		return partnerRepo.save(p);
	}
	
	public List<Donation> findAlldonations() {
		return donationRepo.findAll();
	}
	
	public Donation findDonationById(Long id) {
		Optional<Donation> o = donationRepo.findById(id);
		
		if (o.isPresent()) {
			return o.get();
		} else {
			return null;
		}
	}
	
	public Donation updateDonation(Long id, Donation d) {
		Donation donation = findDonationById(id);
		donation.setDonation(d.getDonation());
		return donationRepo.save(donation);
	}
	
	public void deleteDonation(Long id) {
		donationRepo.deleteById(id);
	}
}
