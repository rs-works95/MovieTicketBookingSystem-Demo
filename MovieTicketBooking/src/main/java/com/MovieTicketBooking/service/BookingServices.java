package com.MovieTicketBooking.service;

import java.sql.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;

import com.MovieTicketBooking.model.BookTicket;
import com.MovieTicketBooking.model.Shows;
import com.MovieTicketBooking.model.User;

@Service
public class BookingServices
{
	@PersistenceContext
	EntityManager entityManager;
	
	public List<Date> getAllBookinDateByMovieId(int id)
	{
		Query query=entityManager.createQuery("select distinct show.showDate from Shows show where show.movie="+id);
		List<Date> show=(List<Date>) query.getResultList();
		return show;
	}
	
	public List<String> getAllScreenByMovieId(int id)
	{
		Query query=entityManager.createQuery("select distinct show.screen.name from Shows show where show.movie="+id);
		List<String> screen=(List<String>) query.getResultList();
		return screen;
	}
	
	public int getScreenIdByScreenName(String screenName)
	{
		Query query=entityManager.createQuery("select screen.id from Screens screen where screen.name="+"'"+screenName+"'");
		int screenId=(int) query.getSingleResult();
		return screenId;
	}
	
	public List<Shows> getShowsByMovieIdAndScreenNameAndDate(Date date, int screenId, int movieId)
	{
		Query query=entityManager.createQuery("select show from Shows show where show.movie="+movieId+" and show.screen="+screenId+" and show.showDate="+"'"+date+"'");
		List<Shows> shows=(List<Shows>) query.getResultList();
		return shows;
	}
	
	public int getTicketTotalPrice(List<String> platinumSeats, List<String> goldSeats, List<String> silverSeats, Shows show)
	{
		return (platinumSeats.size()*show.getPlatinumPrice()) + (goldSeats.size()*show.getGoldPrice()) + (silverSeats.size()*show.getSilverPrice());
	}
	
	public List<BookTicket> getAllBooikngByShowId(int showId)
	{
		Query query=entityManager.createQuery("select bookTicket from BookTicket bookTicket where bookTicket.show.id="+showId);
		List<BookTicket> booking=(List<BookTicket>) query.getResultList();
		return booking;
	}
	
	public Shows getAllSeatsPriceByShowId(int showId)
	{
		Query query=entityManager.createQuery("select show from Shows show where show.id="+showId);
		Shows SeatsPrice= (Shows) query.getSingleResult();
		return SeatsPrice;
	}

}