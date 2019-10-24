package com.MovieTicketBooking.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.MovieTicketBooking.model.BookTicket;
import com.MovieTicketBooking.model.Screens;
import com.MovieTicketBooking.model.Shows;
import com.MovieTicketBooking.repository.ScreensRepository;
import com.MovieTicketBooking.service.BookingServices;

@RestController
@SessionAttributes({"Username","userId"})
public class ScreenController 
{
	@Autowired
	ScreensRepository screenRepository;
	
	@Autowired
	BookingServices bookingServices;
	
	@GetMapping("/AddScreens")
	public ModelAndView showAddScreenPage()
	{
		ModelAndView model=new ModelAndView("AddScreens");
		return model;
	}
	
	@PostMapping("/AddScreens")
	public ModelAndView addScreens(@ModelAttribute("Screens") Screens screen, ModelAndView model)
	{
		screenRepository.save(screen);
		model.setViewName("redirect:/ScreenDetails");
		return model;
	}
	
	@GetMapping("/ScreenDetails")
	public ModelAndView showScreenPage(ModelAndView model)
	{
		List<Screens> screenDetails=(List<Screens>) screenRepository.findAll();
		model.addObject("screenDetails", screenDetails);
		model.setViewName("ScreenDetails");
		return model;
	}
	
	@PostMapping("/ShowScreens")
	public ModelAndView showScreenBookingPage(@RequestParam("showId") int showId, @RequestParam("screenId") int screenId, @RequestParam("totalSeats") int totalSeats, ModelAndView model)
	{
		List<BookTicket> booking=bookingServices.getAllBooikngByShowId(showId);
		model.addObject("booking", booking);
		
		Screens screens=screenRepository.findById(screenId).get();
		model.addObject("screens", screens);
		
		model.addObject("totalSeats", totalSeats);
		model.addObject("showId", showId);
		
		Shows allSeatPrice=bookingServices.getAllSeatsPriceByShowId(showId);
		
		model.addObject("platinumPrice", allSeatPrice.getPlatinumPrice());
		model.addObject("goldPrice", allSeatPrice.getGoldPrice());
		model.addObject("silverPrice", allSeatPrice.getSilverPrice());
		
		model.setViewName("ShowScreens");
		return model;
	}
	
}
