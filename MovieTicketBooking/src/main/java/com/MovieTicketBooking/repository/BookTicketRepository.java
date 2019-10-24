package com.MovieTicketBooking.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.MovieTicketBooking.model.BookTicket;

@Repository
public interface BookTicketRepository extends CrudRepository<BookTicket, Integer>
{
	
}
