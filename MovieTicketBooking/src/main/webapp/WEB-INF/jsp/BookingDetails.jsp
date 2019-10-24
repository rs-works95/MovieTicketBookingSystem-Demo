<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Admin/header.jspf" %>
<%@ include file="Admin/navigation.jspf" %>
<!DOCTYPE html">
<html>
<head>

<style type="text/css">

#table
{
	font-size: 13px;
}

#tablehead
{
	font-size: 14px;
}

.btn
{
	padding: 0px;
   
    font-size: 14px;
    height: 40px;
    border-radius: 3px;
}
.btn-rounded {
    -webkit-border-radius: 10em;
    border-radius: 10em;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ticket Booking Details</title>
</head>
<body>

	<%
		String userName=(String)session.getAttribute("Username");
		if(userName==null)
		{
			response.sendRedirect("UserLogin");
		}
	%>
	
	<div class="container">
		<h4>Ticket Booking Details</h4>
		
		<hr/>
		<div class="table-responsive" style="overflow-x:scroll; ">
			<table class="table table-striped table-hover" border="1">
			
			    <thead class="">
			     
			      <tr>
			        
			        <th id="tablehead">User Name</th>	
			        <th id="tablehead">Screen Name</th>
			        <th id="tablehead">Movie Name</th>		
			        <th id="tablehead">Show Date</th>		
			        <th id="tablehead">Start Time</th>
			        <th id="tablehead">End Time</th>
			        <th id="tablehead">Platinum Booked Seats</th>	
			        <th id="tablehead">Silver Booked Seats</th>
			        <th id="tablehead">Gold Booked Seats</th>
			        <th id="tablehead">Total Booked Seats</th>
			        <th id="tablehead">Total Ticket Price(&#x20B9;)</th>
			       
			      </tr>
			   
			    </thead>
			
			    <tbody>
			    
			   	  <c:forEach items="${bookingDetails}" var="ticketBooking">
			   	  
					      <tr>
					      
					      	<td id="table">${ticketBooking.user.firstName} ${ticketBooking.user.lastName}</td>
					      	<td id="table">${ticketBooking.show.screen.name}</td>
					      	<td id="table">${ticketBooking.show.movie.name}</td>
					      	<td id="table">${ticketBooking.show.showDate}</td>
					      	<td id="table">${ticketBooking.show.startTime}</td>
					      	<td id="table">${ticketBooking.show.endTime}</td>
					        <td id="table">${ticketBooking.platinumSeats}</td>
					        <td id="table">${ticketBooking.silverSeats}</td>
					        <td id="table">${ticketBooking.goldSeats}</td>
					        <td id="table">${ticketBooking.totalBookedSeats}</td>
					        <td id="table"> &#x20B9;&nbsp;${ticketBooking.totalPrice}</td>
					        
					      </tr>
					
			      </c:forEach>
			      
			    </tbody>
		    
		    </table>
		</div>
	</div>

</body>
</html>
<%@ include file="Admin/footer.jspf" %>