package com.MovieTicketBooking.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.MovieTicketBooking.model.Screens;

@Repository
public interface ScreensRepository extends CrudRepository<Screens, Integer>
{
	
}
