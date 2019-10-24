<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Admin/header.jspf" %>
<%@ include file="Admin/navigation.jspf" %>
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
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Screens</title>
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
		<h4>Add Screen</h4>
		<hr/>
		
		<form action="AddScreens" method="post">
		
			<div class="form-group">
				<label>Screen Name:</label>
				<input type="text" name="name" class="form-control" placeholder="Enter Screen Name" required/>
			</div>
			<div class="form-group">
				<label>Platinum Seat:</label>
				<input type="number" name="platinumSeat" class="form-control" placeholder="Enter Platinum Seat" required/>
			</div>
			<div class="form-group">
				<label>Gold Seat:</label>
				<input type="number" name="goldSeat" class="form-control" placeholder="Enter Gold Seat" required/>
			</div>
			
			<div class="form-group">
				<label>Silver Seat:</label>
				<input type="number" name="silverSeat" class="form-control" placeholder="Enter Silver Seat" required/>
			</div>
			
			<hr/>
		
			<input type="submit" class="btn btn-info btn-rounded waves-effect waves-light" value="Add Screen" />
				
		</form>
		
	</div>

</body>
</html>
<%@ include file="Admin/footer.jspf" %>