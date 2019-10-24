package com.MovieTicketBooking.model;


import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Movie
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	private String cast;
	private Date releaseDate;
	private String imageName;
	
	public Movie() 
	{
		super();
	}

	public Movie(int id, String name, String cast, Date releaseDate, String imageName)
	{
		super();
		this.id = id;
		this.name = name;
		this.cast = cast;
		this.releaseDate = releaseDate;
		this.imageName = imageName;
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

	public String getCast() 
	{
		return cast;
	}

	public void setCast(String cast)
	{
		this.cast = cast;
	}

	public Date getReleaseDate()
	{
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) 
	{
		this.releaseDate = releaseDate;
	}

	public String getImageName() 
	{
		return imageName;
	}

	public void setImageName(String imageName)
	{
		this.imageName = imageName;
	}

	@Override
	public String toString() 
	{
		return "Movie [id=" + id + ", name=" + name + ", cast=" + cast + ", releaseDate=" + releaseDate + ", imageName="
				+ imageName + "]";
	}
	
}
