package com.com.generousboxes.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.com.generousboxes.models.Partner;
import com.com.generousboxes.models.User;

@Component
public class PartnerValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return User.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		Partner partner = (Partner) target;
		
		if (!partner.getPasswordConfirmation().equals(partner.getPassword())) {
			errors.rejectValue("passwordConfirmation", "Match");
		}
	}
	
}
