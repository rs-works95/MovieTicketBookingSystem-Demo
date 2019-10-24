package com.MovieTicketBooking.model;


import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Shows 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String startTime;
	private String endTime;
	private Date showDate;
	private int platinumPrice;
	private int goldPrice;
	private int silverPrice;
	
	@ManyToOne
	private Movie movie;
	
	@ManyToOne
	private Screens screen;

	public Shows() 
	{
		super();
	}

	public Shows(int id, String startTime, String endTime, Date showDate, int platinumPrice, int goldPrice,
			int silverPrice, Movie movie, Screens screen) 
	{
		super();
		this.id = id;
		this.startTime = startTime;
		this.endTime = endTime;
		this.showDate = showDate;
		this.platinumPrice = platinumPrice;
		this.goldPrice = goldPrice;
		this.silverPrice = silverPrice;
		this.movie = movie;
		this.screen = screen;
	}

	public int getId() 
	{
		return id;
	}

	public void setId(int id) 
	{
		this.id = id;
	}

	public String getStartTime()
	{
		return startTime;
	}

	public void setStartTime(String startTime) 
	{
		this.startTime = startTime;
	}

	public String getEndTime() 
	{
		return endTime;
	}

	public void setEndTime(String endTime) 
	{
		this.endTime = endTime;
	}

	public Date getShowDate() 
	{
		return showDate;
	}

	public void setShowDate(Date showDate) 
	{
		this.showDate = showDate;
	}

	public int getPlatinumPrice() 
	{
		return platinumPrice;
	}

	public void setPlatinumPrice(int platinumPrice) 
	{
		this.platinumPrice = platinumPrice;
	}

	public int getGoldPrice() 
	{
		return goldPrice;
	}

	public void setGoldPrice(int goldPrice) 
	{
		this.goldPrice = goldPrice;
	}

	public int getSilverPrice() 
	{
		return silverPrice;
	}

	public void setSilverPrice(int silverPrice) 
	{
		this.silverPrice = silverPrice;
	}

	public Movie getMovie() 
	{
		return movie;
	}

	public void setMovie(Movie movie) 
	{
		this.movie = movie;
	}

	public Screens getScreen() 
	{
		return screen;
	}

	public void setScreen(Screens screen) 
	{
		this.screen = screen;
	}

	@Override
	public String toString() 
	{
		return "Shows [id=" + id + ", startTime=" + startTime + ", endTime=" + endTime + ", showDate=" + showDate
				+ ", platinumPrice=" + platinumPrice + ", goldPrice=" + goldPrice + ", silverPrice=" + silverPrice
				+ ", movie=" + movie + ", screen=" + screen + "]";
	}
}
