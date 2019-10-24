package com.MovieTicketBooking.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.MovieTicketBooking.model.Movie;

@Repository
public interface MovieRepository extends CrudRepository<Movie, Integer>
{

}
