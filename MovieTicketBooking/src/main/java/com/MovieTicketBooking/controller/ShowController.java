package com.MovieTicketBooking.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.MovieTicketBooking.model.Movie;
import com.MovieTicketBooking.model.Screens;
import com.MovieTicketBooking.model.Shows;
import com.MovieTicketBooking.repository.MovieRepository;
import com.MovieTicketBooking.repository.ScreensRepository;
import com.MovieTicketBooking.repository.ShowsRepository;
import com.MovieTicketBooking.service.BookingServices;

@RestController
@SessionAttributes({"Username","userId"})
public class ShowController 
{
	@Autowired
	ShowsRepository showRepository;
	
	@Autowired
	MovieRepository movieRepository;
	
	@Autowired
	ScreensRepository screenRepository;
	
	@Autowired
	BookingServices bookingServices;
	
	@GetMapping("/CreateShow")
	public ModelAndView showCreateShowPage()
	{
		ModelAndView model=new ModelAndView("CreateShow");
		List<Movie> movie=(List<Movie>) movieRepository.findAll();
		List<Screens> screen=(List<Screens>) screenRepository.findAll();
		model.addObject("movie", movie);
		model.addObject("screen", screen);
		return model;
	}
	
	@PostMapping("/CreateShow")
	public ModelAndView addCreateShow(@ModelAttribute("Shows") Shows show, ModelAndView model)
	{
		showRepository.save(show);
		model.setViewName("redirect:/ShowDetails");
		return model;
	}
	
	@GetMapping("/ShowDetails")
	public ModelAndView showListShowPage(ModelAndView model)
	{
		List<Shows> show=(List<Shows>) showRepository.findAll();
		model.addObject("shows", show);
		model.setViewName("ShowsDetails");
		return model;
	}
	
	@PostMapping("/ListShows")
	public ModelAndView showListShowbookPage(@RequestParam("movieId") int movieId, @RequestParam("screen") String screen,
			@RequestParam("date") Date date, @RequestParam("seats") int seats, ModelAndView model)
	{
		int screenId=bookingServices.getScreenIdByScreenName(screen);
		List<Shows> show=(List<Shows>) bookingServices.getShowsByMovieIdAndScreenNameAndDate(date, screenId, movieId);
		model.addObject("shows", show);
		model.addObject("totalSeats", seats);
		model.setViewName("ListShows");
		return model;
	}
}
