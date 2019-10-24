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

import com.MovieTicketBooking.model.BookTicket;
import com.MovieTicketBooking.repository.BookTicketRepository;
import com.MovieTicketBooking.repository.ScreensRepository;
import com.MovieTicketBooking.service.BookingServices;

@RestController
@SessionAttributes({"Username","userId"})
public class BookingController 
{
	@Autowired
	ScreensRepository screenRepository;
	
	@Autowired
	BookingServices bookingServices;
	
	@Autowired
	BookTicketRepository bookTicketRepository;
	
	@PostMapping("/BookMovie")
	public ModelAndView showBookMoviePage(ModelAndView model, @RequestParam("movieId") int movieId)
	{
		List<Date> showdate=bookingServices.getAllBookinDateByMovieId(movieId);
		model.addObject("showdate", showdate);
		
		List<String> screens=bookingServices.getAllScreenByMovieId(movieId);
		model.addObject("screens", screens);
		
		model.addObject("movieId", movieId);
		
		model.setViewName("BookMovie");
		return model;
	}
	
	@PostMapping("/BookSeats")
	public ModelAndView bookSeats(@ModelAttribute("BookTicket") BookTicket bookTicket, ModelAndView model)
	{
		int totalBookedSeatPrice=bookingServices.getTicketTotalPrice(bookTicket.getPlatinumSeats(), bookTicket.getGoldSeats(), bookTicket.getSilverSeats(), bookTicket.getShow());
		bookTicket.setTotalPrice(totalBookedSeatPrice);
		bookTicketRepository.save(bookTicket);
		model.setViewName("redirect:/UserBookingDetails");
		return model;
	}
	
	@GetMapping("/UserBookingDetails")
	public ModelAndView ticketBookingDetails(ModelAndView model)
	{
		List<BookTicket> bookingDetails=(List<BookTicket>) bookTicketRepository.findAll();
		model.addObject("bookingDetails", bookingDetails);
		model.setViewName("UserBookingDetails");
		return model;
	}
	
	@GetMapping("/BookingDetails")
	public ModelAndView ticketBookingDetailsAdmin(ModelAndView model)
	{
		List<BookTicket> bookingDetails=(List<BookTicket>) bookTicketRepository.findAll();
		model.addObject("bookingDetails", bookingDetails);
		model.setViewName("BookingDetails");
		return model;
	}
}
