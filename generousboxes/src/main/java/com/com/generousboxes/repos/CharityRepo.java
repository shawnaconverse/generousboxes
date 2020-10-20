package com.com.generousboxes.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.com.generousboxes.models.Charity;

@Repository
public interface CharityRepo extends CrudRepository<Charity, Long> {
	List<Charity> findAll();
}
