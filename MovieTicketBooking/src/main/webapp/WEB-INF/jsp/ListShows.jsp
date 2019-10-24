<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="com.MovieTicketBooking.model.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<!DOCTYPE html">
<html>
<head>

<style type="text/css">

#shows
{
	max-width: 245px;
	display: inline-block;
	padding:3px;
	margin:3px;
	float: left;
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
<title>Display List Of Shows</title>
</head>
<body>

	<%
		String userName=(String)session.getAttribute("Username");
		if(userName==null)
		{
			response.sendRedirect("UserLogin");
		}
	%>
	
	<% int totalSeats=(int)request.getAttribute("totalSeats"); %>
	
	<div class="container">
		<h4>List Shows</h4>
		
		<hr/>
		
		<div class="row">
			
			<c:forEach items="${shows}" var="show">	
		
				<div id="shows">
				
					<form action="/ShowScreens" method="post">
					
						<input type="hidden" name="showId" value="${show.id}" />
						<input type="hidden" name="screenId" value="${show.screen.id}" />
						<input type="hidden" name="totalSeats" value="<%=totalSeats%>" />
						
						<input type="submit" class="btn btn-info btn-rounded waves-effect waves-light" value="${show.startTime} - ${show.endTime}" />
					
					</form>
					
				</div>
				
			</c:forEach>
		</div>

	</div>

</body>
</html>
<%@ include file="common/footer.jspf" %>