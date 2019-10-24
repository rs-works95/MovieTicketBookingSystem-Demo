package com.MovieTicketBooking.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class BookTicket 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@ElementCollection
	private List<String> platinumSeats=new ArrayList<String>();
	
	@ElementCollection
	private List<String> goldSeats=new ArrayList<String>();
	
	@ElementCollection
	private List<String> silverSeats=new ArrayList<String>();
	
	private int totalBookedSeats;
	private int totalPrice;
	
	@ManyToOne
	private Shows show;
	
	@ManyToOne
	private User user;

	public BookTicket()
	{
		super();
	}

	public BookTicket(int id, List<String> platinumSeats, List<String> goldSeats, List<String> silverSeats,
			int totalBookedSeats, int totalPrice, Shows show, User user) 
	{
		super();
		this.id = id;
		this.platinumSeats = platinumSeats;
		this.goldSeats = goldSeats;
		this.silverSeats = silverSeats;
		this.totalBookedSeats = totalBookedSeats;
		this.totalPrice = totalPrice;
		this.show = show;
		this.user = user;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public List<String> getPlatinumSeats() 
	{
		return platinumSeats;
	}

	public void setPlatinumSeats(List<String> platinumSeats)
	{
		this.platinumSeats = platinumSeats;
	}

	public List<String> getGoldSeats() 
	{
		return goldSeats;
	}

	public void setGoldSeats(List<String> goldSeats) 
	{
		this.goldSeats = goldSeats;
	}

	public List<String> getSilverSeats() 
	{
		return silverSeats;
	}

	public void setSilverSeats(List<String> silverSeats) 
	{
		this.silverSeats = silverSeats;
	}

	public int getTotalBookedSeats() 
	{
		return totalBookedSeats;
	}

	public void setTotalBookedSeats(int totalBookedSeats) 
	{
		this.totalBookedSeats = totalBookedSeats;
	}

	public int getTotalPrice() 
	{
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) 
	{
		this.totalPrice = totalPrice;
	}

	public Shows getShow() 
	{
		return show;
	}

	public void setShow(Shows show) 
	{
		this.show = show;
	}

	public User getUser() 
	{
		return user;
	}

	public void setUser(User user) 
	{
		this.user = user;
	}

	@Override
	public String toString() 
	{
		return "BookTicket [id=" + id + ", platinumSeats=" + platinumSeats + ", goldSeats=" + goldSeats
				+ ", silverSeats=" + silverSeats + ", totalBookedSeats=" + totalBookedSeats + ", totalPrice="
				+ totalPrice + ", show=" + show + ", user=" + user + "]";
	}

}
