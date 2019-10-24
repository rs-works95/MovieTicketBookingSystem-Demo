package com.MovieTicketBooking.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.MovieTicketBooking.model.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer>
{

}
