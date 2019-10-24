<%@page import="java.util.ArrayList"%>
<%@page import="com.MovieTicketBooking.model.BookTicket"%>
<%@page import="java.util.List"%>
<%@page import="com.MovieTicketBooking.model.Screens"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<!DOCTYPE html">
<html>
<head>    

<style type="text/css">

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

#screen1
{
	background-color: #F5F7FA;
	border-radius: 1em;
}
#seats
{
	max-width: 245px;
	display: inline-block;
	padding:5px;
	margin:15px;
	float: left;
}

.row
{
	background-color: #F5F7FA;
	border-radius: 1em;
}
</style>

<script type="text/javascript">

	function TotalSeatsAndFare(totalSeats,platinumPrice,goldPrice,silverPrice)
	{
		var platinumBookedSeats=document.getElementsByName('PlatinumSeats');
		var goldBookedSeats=document.getElementsByName('goldSeats');
		var silverBookedSeats=document.getElementsByName('silverSeats');
		
		var countPlatinumSeats=0;
		var countGoldSeats=0;
		var countSilverSeats=0;
		
		for(var i=0; i<platinumBookedSeats.length; i++)
		{
			if(platinumBookedSeats[i].type=='checkbox' && platinumBookedSeats[i].checked==true)
			   countPlatinumSeats+=1;
		}
		
		for(var i=0; i<goldBookedSeats.length; i++)
		{
			if(goldBookedSeats[i].type=='checkbox' && goldBookedSeats[i].checked==true)
				countGoldSeats+=1;
		}
		
		for(var i=0; i<silverBookedSeats.length; i++)
		{
			if(silverBookedSeats[i].type=='checkbox' && silverBookedSeats[i].checked==true)
				countSilverSeats+=1;
		}
		
		totalSelectedSeats=countPlatinumSeats + countGoldSeats + countSilverSeats;
		totalFare=(countPlatinumSeats * platinumPrice) + (countGoldSeats * goldPrice) + (countSilverSeats * silverPrice);
	}

	function printChecked(totalSeats,platinumPrice,goldPrice,silverPrice)
	{
		
		TotalSeatsAndFare(totalSeats,platinumPrice,goldPrice,silverPrice);
		
		var SelectedSeats=totalSelectedSeats;
		var Fare=totalFare;
		
	   	if(totalSeats==SelectedSeats)
		{
	   		alert("Total Ticket Price Is : "+Fare+" Rupees");
			return true;		
		}
	   	else if(SelectedSeats>totalSeats)
		{
			alert("You have select "+SelectedSeats+" seats."+"\n"+"Please unselect "+(SelectedSeats - totalSeats)+" seats.");
			return false;	
		}
		else
		{
			alert("You have select "+SelectedSeats+" seats."+"\n"+"Please select "+(totalSeats - SelectedSeats)+" more seats.");
			return false;	
		}
	}			
	
	function totalfare(totalSeats,platinumPrice,goldPrice,silverPrice)
	{
		TotalSeatsAndFare(totalSeats,platinumPrice,goldPrice,silverPrice);
		var totalTicketPrice=totalFare;
		document.getElementById("totalFare").innerHTML = totalTicketPrice;
	}
	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Screens</title>
</head>
<body>

	<%
		String userName=(String)session.getAttribute("Username");
		if(userName==null)
		{
			response.sendRedirect("UserLogin");
		}
	%>

	<% 
	   List<BookTicket> booking=(List<BookTicket>)request.getAttribute("booking");
	   Screens screen=(Screens)request.getAttribute("screens"); 
	   int showId=(int)request.getAttribute("showId");
	   int totalSeats=(int)request.getAttribute("totalSeats");
	%>
	
	<div class="container" id="screen1">
		<p><h4 align="center"><%=screen.getName()%></h4></p>
	</div>
	<div><br/></div>
	<div class="container">
			
			<% 
				List<String> platinumBookedSeats=new ArrayList<String>();
				List<String> goldBookedSeats=new ArrayList<String>();
				List<String> silverBookedSeats=new ArrayList<String>();
				int platinumSeat=screen.getPlatinumSeat();
				int goldSeat=screen.getGoldSeat();
				int silverSeat=screen.getSilverSeat();
			%>
			
			<%
				if(booking.size()!=0)
				{	
					for(BookTicket bookTicket : booking)
					{
						for(int i=0;i<bookTicket.getPlatinumSeats().size();i++)
						{
							platinumBookedSeats.add(bookTicket.getPlatinumSeats().get(i));
						}
						
						for(int i=0;i<bookTicket.getGoldSeats().size();i++)
						{
							goldBookedSeats.add(bookTicket.getGoldSeats().get(i));
						}
						
						for(int i=0;i<bookTicket.getSilverSeats().size();i++)
						{
							silverBookedSeats.add(bookTicket.getSilverSeats().get(i));
						}
					}
				}
			%>
			
			<%
				int platinumPrice=(int)request.getAttribute("platinumPrice");
				int goldPrice=(int)request.getAttribute("goldPrice");
				int silverPrice=(int)request.getAttribute("silverPrice");
			%>
			
			<form action="/BookSeats" onsubmit="return printChecked(<%=totalSeats %>,<%=platinumPrice %>,<%=goldPrice %>,<%=silverPrice %>)" method="post">
	
			<div class="row">
			
			<%  
				int platinumSeatFlag=0;
				for(int i=1;i<=platinumSeat;i++)
				{
			%>
				<div id="seats">
				 	<p>P<%=i%></p>
				 	<% for(int j=0;j<platinumBookedSeats.size();j++) 
				 	   {
				 			if(platinumBookedSeats.get(j).equals("P"+i))
				 			{				 	   
				 	%>
				 				<input type="checkbox" name="PlatinumBookedSeats" value="P<%=i%>" disabled="disabled" checked="checked"/>
				 	<%
				 				platinumSeatFlag=1;
				 			}
				 		}
				 	%>
				 	<% if(platinumSeatFlag==0){ %>
				 		<input type="checkbox" title="Platinum Seat Price : &#x20B9;&nbsp;<%=platinumPrice %>" onchange="totalfare(<%=totalSeats %>,<%=platinumPrice %>,<%=goldPrice %>,<%=silverPrice %>)" name="PlatinumSeats" value="P<%=i%>" />
				 	<%} platinumSeatFlag=0;%>
				</div>
			<%
			 	}
			%>
			</div>
			
			<hr>
			
			<div class="row"> 
			<%  
				int goldSeatFalg=0;
				for(int i=1;i<=goldSeat;i++)
				{
			%>
				<div id="seats">
				 	<p>G<%=i%></p>
				 	<% for(int j=0;j<goldBookedSeats.size();j++) 
				 	   {
				 			if(goldBookedSeats.get(j).equals("G"+i))
				 			{				 	   
				 	%>
				 				<input type="checkbox" name="goldBookedSeats" value="G<%=i%>" disabled="disabled" checked="checked" />
				 	<%
				 				goldSeatFalg=1;
				 			}
				 		}
				 	%>
				 	<% if(goldSeatFalg==0){ %>
				 		<input type="checkbox" title="Gold Seat Price : &#x20B9;&nbsp;<%=goldPrice %>" onchange="totalfare(<%=totalSeats %>,<%=platinumPrice %>,<%=goldPrice %>,<%=silverPrice %>)" name="goldSeats" value="G<%=i%>" />
				 	<%} goldSeatFalg=0;%>
				</div>
			<%
			 	}
			%>
			</div>
			
			<hr>
			
			<div class="row">
			<% 
				int silverSeatFalg=0;
				for(int i=1;i<=silverSeat;i++)
				{
			%>
				<div id="seats">
				 	<p>S<%=i%></p>
				 	<% for(int j=0;j<silverBookedSeats.size();j++) 
				 	   {
				 			if(silverBookedSeats.get(j).equals("S"+i))
				 			{				 	   
				 	%>
				 				<input type="checkbox" name="silverBookedSeats" value="S<%=i%>" disabled="disabled" checked="checked" />
				 	<%
				 				silverSeatFalg=1;
				 			}
				 		}
				 	%>
				 	<% if(silverSeatFalg==0){ %>
				 		<input type="checkbox" title="Silver Seat Price : &#x20B9;&nbsp;<%=silverPrice %>" onchange="totalfare(<%=totalSeats %>,<%=platinumPrice %>,<%=goldPrice %>,<%=silverPrice %>)" name="silverSeats" value="S<%=i%>" />
				 	<%} silverSeatFalg=0;%>
				</div>
			<%
			 	}
			%>
			</div>
			
			<input type="hidden" name="show" value="<%=showId %>" />
			<input type="hidden" name="totalBookedSeats" value="<%=totalSeats %>" />
			<input type="hidden" name="user" value="${userId}" />
			
			<hr>
			<div class="" align="center">
				
					<input type="checkbox" checked="checked" disabled="disabled"/> BookedSeat
				
				
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
				
					<input type="checkbox" disabled="disabled"/> AvailableSeat
				
				
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
					TotalTicketPrice : &#x20B9;&nbsp;<span id="totalFare">0</span>
				
			</div>
			<hr/>
				
				<div class="" align="center">
					<input type="submit" class="btn btn-info btn-rounded waves-effect waves-light" value="Book Seats" />
				</div>
			</form>
		</div>
</body>
</html>
<%@ include file="common/footer.jspf" %>