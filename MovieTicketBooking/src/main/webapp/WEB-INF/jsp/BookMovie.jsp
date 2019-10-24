<%@page import="java.sql.Date"%>
<%@page import="com.MovieTicketBooking.model.Shows"%>
<%@page import="java.util.List"%>
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
    width:80px;
    border-radius: 3px;
}
.btn-rounded {
    -webkit-border-radius: 10em;
    border-radius: 10em;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Seats</title>
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
		<h4>Book Seats</h4>
		<hr/>
		
		<%
			List<Date> showDates=(List<Date>)request.getAttribute("showdate");
			List<String> screens=(List<String>)request.getAttribute("screens");
		%>

		<form action="/ListShows" method="post">
			
			<div class="form-group">
				<label>Screen:</label>
				<select name="screen" class="form-control" placeholder="Select Screen" required>
					<% for(String screen:screens) 
					   {
					%>
							<option value="<%=screen %>"><%=screen %></option>
					<%
						}
					%>
				</select>
			</div>
			
			<div class="form-group">
				<label>Date:</label>
				<select name="date" class="form-control" placeholder="Select Date" required>
					<% for(Date showDate:showDates) 
					   {
					%>
							<option value="<%=showDate%>"><%=showDate %></option>
					<%
						}
					%>
				</select>
			</div>
			
			<div class="form-group">
				<label>Seat:</label>
				<input type="number" name="seats" class="form-control" placeholder="Enter Book Seat" required/>
			</div>
			
			<input type="hidden" name="movieId" value="${movieId}" />
			
			<hr/>
		
			<input type="submit" class="btn btn-info btn-rounded waves-effect waves-light" value="Book" />
		</form>
		
	</div>

</body>
</html>
<%@ include file="common/footer.jspf" %>