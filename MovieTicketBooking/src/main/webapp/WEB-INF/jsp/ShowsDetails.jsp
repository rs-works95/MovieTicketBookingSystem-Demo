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
<title>Shows Details</title>
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
		<h4>MovieShow Details</h4>
		
		<hr/>
		
			<table class="table table-striped table-hover" border="1">
			
			    <thead class="">
			     
			      <tr>
			        
			        <th id="tablehead">Screen Name</th>	
			        <th id="tablehead">Movie Name</th>
			        <th id="tablehead">Show Date</th>
			        <th id="tablehead">Start Time</th>
			        <th id="tablehead">End Time</th>
			        <th id="tablehead">Platinum Seat Price</th>
			        <th id="tablehead">Silver Seat Price</th>
			        <th id="tablehead">Gold Seat Price</th>
			        
			      </tr>
			   
			    </thead>
			
			    <tbody>
			    
			   	  <c:forEach items="${shows}" var="show">
			    
				      <tr>
				      
				        <td id="table">${show.screen.name}</td>
				        <td id="table">${show.movie.name}</td>
				        <td id="table">${show.showDate}</td>
				        <td id="table">${show.startTime}</td>
				        <td id="table">${show.endTime}</td>
				        <td id="table">${show.platinumPrice}</td>
				        <td id="table">${show.silverPrice}</td>
				        <td id="table">${show.goldPrice}</td>
				        
				      </tr>
				      
			      </c:forEach>
			      
			    </tbody>
		    
		    </table>
		
	</div>

</body>
</html>
<%@ include file="Admin/footer.jspf" %>