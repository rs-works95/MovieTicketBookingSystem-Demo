<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="com.MovieTicketBooking.model.Movie"%>
<%@page import="java.util.List"%>
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

.requerido
{
	color: red;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Show</title>
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
	
		<h4>Add Show</h4>
		
		<hr/>
		
		<form action="CreateShow" method="post">
		
		
			<div class="form-group row ">
				<div class="column col-sm-6">
					<div class="col-sm-12 col-form-label">
						<label>Screen<span class="requerido"> *</span></label>
					</div>
					<div class="col-sm-12">
						<select name="screen" class="form-control" placeholder="Select Screen" required>
							<c:forEach items="${screen}" var="screenName">
								<option value="${screenName.id}">${screenName.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				
				<div class="column col-sm-6">
					<div class="col-sm-12 col-form-label">
						<label>Movie Name<span class="requerido"> *</span></label>
					</div>
					<div class="col-sm-12">
						<select name="movie" class="form-control" placeholder="Select Movie" required>
							<c:forEach items="${movie}" var="movieName">
								<option value="${movieName.id}">${movieName.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="column col-sm-4">
					<div class="col-sm-12 col-form-label">
						<label>Show Date<span class="requerido"> *</span></label>
					</div>
					<div class="col-sm-12">
						<input type="date" name="showDate" class="form-control" placeholder="Select Show Date" required/>
					</div>
				</div>
				
				<div class="column col-sm-4">
					<div class="col-sm-12 col-form-label">
						<label>Start Time<span class="requerido"> *</span></label>
					</div>
					<div class="col-sm-12">
						<input type="time" name="startTime" class="form-control" placeholder="Enter Show Start Time" required/>
					</div>
				</div>
				
				<div class="column col-sm-4">
					<div class="col-sm-12 col-form-label">
						<label>End Time<span class="requerido"> *</span></label>
					</div>
					<div class="col-sm-12">
						<input type="time" name="endTime" class="form-control" placeholder="Enter Show End Time" required/>
					</div>
				</div>
			</div>
			
			
			<div class="form-group row">
				<div class="column col-sm-4">
					<div class="col-sm-12 col-form-label">
						<label>Platinum Seat Price<span class="requerido"> *</span></label>
					</div>
					<div class="col-sm-12">
						<input type="number" name="platinumPrice" class="form-control" placeholder="Enter Platinum Seat Price" required/>
					</div>
				</div>
				
				<div class="column col-sm-4">
					<div class="col-sm-12 col-form-label">
						<label>Silver Seat Price<span class="requerido"> *</span></label>
					</div>
					<div class="col-sm-12">
						<input type="number" name="silverPrice" class="form-control" placeholder="Enter Silver Seat Price" required/>
					</div>
				</div>
				
				<div class="column col-sm-4">
					<div class="col-sm-12 col-form-label">
						<label>Gold Seat Price<span class="requerido"> *</span></label>
					</div>
					<div class="col-sm-12">
						<input type="number" name="goldPrice" class="form-control" placeholder="Enter Gold Seat Price" required/>
					</div>
				</div>
			</div>
			
			<hr/>
		
			<input type="submit" class="btn btn-info btn-rounded waves-effect waves-light" value="Add Show" />
				
		</form>
		
	</div>

</body>
</html>
<%@ include file="Admin/footer.jspf" %>