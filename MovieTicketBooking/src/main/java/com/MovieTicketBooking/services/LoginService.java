package com.MovieTicketBooking.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.MovieTicketBooking.model.User;
import com.MovieTicketBooking.repository.UserRepository;

@Component
public class LoginService 
{
	@Autowired
	UserRepository userRepository;
	
	public User validateUser(String username, String password)
	{
		User userData=null;
		
		List<User> allUser=(List<User>) userRepository.findAll();

		for(User user : allUser)
		{
			if(username.equals(user.getEmailId()) && password.equals(user.getPassword()))
			{
				return userData=user;
			}
		}
		return userData;
	}
}
