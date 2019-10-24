package com.MovieTicketBooking.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Screens 
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	private int platinumSeat;
	private int silverSeat;
	private int goldSeat;
	
	public Screens() 
	{
		super();
	}

	public Screens(int id, String name, int platinumSeat, int silverSeat, int goldSeat) 
	{
		super();
		this.id = id;
		this.name = name;
		this.platinumSeat = platinumSeat;
		this.silverSeat = silverSeat;
		this.goldSeat = goldSeat;
	}

	public int getId() 
	{
		return id;
	}

	public void setId(int id) 
	{
		this.id = id;
	}

	public String getName() 
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public int getPlatinumSeat() 
	{
		return platinumSeat;
	}

	public void setPlatinumSeat(int platinumSeat) 
	{
		this.platinumSeat = platinumSeat;
	}

	public int getSilverSeat() 
	{
		return silverSeat;
	}

	public void setSilverSeat(int silverSeat)
	{
		this.silverSeat = silverSeat;
	}

	public int getGoldSeat() 
	{
		return goldSeat;
	}

	public void setGoldSeat(int goldSeat) 
	{
		this.goldSeat = goldSeat;
	}

	@Override
	public String toString() 
	{
		return "Screens [id=" + id + ", name=" + name + ", platinumSeat=" + platinumSeat + ", silverSeat=" + silverSeat
				+ ", goldSeat=" + goldSeat + "]";
	}
		
}
