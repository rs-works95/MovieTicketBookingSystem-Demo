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
<title>Screen Details</title>
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
		<h4>Screen Details</h4>
		
		<hr/>
		
			<table class="table table-striped table-hover" border="1">
			
			    <thead class="">
			     
			      <tr>
			        
			        <th id="tablehead">Screen Name</th>	
			        <th id="tablehead">Platinum Seat</th>
			        <th id="tablehead">Gold Seat</th>
			        <th id="tablehead">Silver Seat</th>
			        
			      </tr>	
			   
			    </thead>
			
			    <tbody>
			    
			   	  <c:forEach items="${screenDetails}" var="screenDetail">
			    
				      <tr>
				      
				        <td id="table">${screenDetail.name}</td>
				        <td id="table">${screenDetail.platinumSeat}</td>
				        <td id="table">${screenDetail.goldSeat}</td>
				        <td id="table">${screenDetail.silverSeat}</td>
				        
				      </tr>
				      
			      </c:forEach>
			      
			    </tbody>
		    
		    </table>
		
	</div>

</body>
</html>
<%@ include file="Admin/footer.jspf" %>