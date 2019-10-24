package com.MovieTicketBooking.Exception;

public class ShowsNotFoundException extends RuntimeException
{
	private static final long serialVersionUID = 1L;	
	
	public ShowsNotFoundException(String exception)
	{
		super(exception);
	}
}
