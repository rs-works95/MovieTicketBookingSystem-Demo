package com.MovieTicketBooking.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.MovieTicketBooking.model.Shows;

@Repository
public interface ShowsRepository extends CrudRepository<Shows, Integer>
{

}
