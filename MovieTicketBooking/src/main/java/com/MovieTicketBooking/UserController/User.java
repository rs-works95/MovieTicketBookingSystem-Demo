package com.MovieTicketBooking.UserController;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.MovieTicketBooking.model.Movie;
import com.MovieTicketBooking.repository.MovieRepository;
import com.MovieTicketBooking.repository.UserRepository;
import com.MovieTicketBooking.services.LoginService;

@RestController
@SessionAttributes({"Username","userId"})
public class User 
{
	@Autowired
	LoginService loginService;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	MovieRepository movieRepository;
	
	@GetMapping("/UserLogin")
	public ModelAndView showAdminLogin()
	{
		ModelAndView adminLogin=new ModelAndView("UserLogin");
		return adminLogin;
	}
	
	@GetMapping("/UserRegistration")
	public ModelAndView showUserRegistrationPage()
	{
		ModelAndView userRegistration=new ModelAndView("UserRegistration");
		return userRegistration;
	}
	
	@PostMapping("/UserRegistration")
	public ModelAndView UserRegistration(@ModelAttribute("User") com.MovieTicketBooking.model.User user)
	{
		ModelAndView userRegistration=new ModelAndView("UserRegistration");
		user.setRole("User");
		userRepository.save(user);
		userRegistration.setViewName("UserLogin");
		return userRegistration;
	}
	
	@PostMapping("/UserLogin")
	public ModelAndView adminLogin(@RequestParam String username, @RequestParam String password, ModelAndView model)
	{
		com.MovieTicketBooking.model.User userData=loginService.validateUser(username, password);
		
		if(userData==null)
		{
			model.addObject("errorMessage", "Invalid Credentials");
			model.setViewName("UserLogin");
			return model;
		}
		
		model.addObject("Username",(userData.getFirstName()+" "+userData.getLastName()));
		model.addObject("userId", userData.getUserId());
		List<Movie> movies = new ArrayList<Movie>();
		movies = (List<Movie>) movieRepository.findAll();
		model.addObject("movies", movies);
		
		if(userData.getRole().equals("Admin"))
		{
			model.setViewName("Home");
		}
		else
		{
			model.setViewName("UserHome");
		}
		return model;
	}
	
	@GetMapping({"/Logout","/BookMovie","/ListShows","/ShowScreens"})
	public ModelAndView logout(@ModelAttribute String Username, ModelAndView model, WebRequest request, SessionStatus status)
	{
		status.setComplete();
		request.removeAttribute("Username",WebRequest.SCOPE_SESSION);
		request.removeAttribute("userId",WebRequest.SCOPE_SESSION);
		model.setViewName("redirect:/UserLogin");
		return model;
	}
	
	@GetMapping("/AdminLogout")
	public ModelAndView adminLogout(@ModelAttribute String Username, ModelAndView model, WebRequest request, SessionStatus status)
	{
		status.setComplete();
		request.removeAttribute("Username",WebRequest.SCOPE_SESSION);
		request.removeAttribute("userId",WebRequest.SCOPE_SESSION);
		model.setViewName("redirect:/UserLogin");
		return model;
	}
}
