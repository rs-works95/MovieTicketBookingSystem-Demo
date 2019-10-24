<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<!DOCTYPE html">
<html>
<head>
<style type="text/css">

.card
{
	max-width: 245px;
	display: inline-block;
	padding:5px;
	margin:15px;
	float: left;
}

.card:hover
{
	 box-shadow: 1px 8px 20px grey;
    -webkit-transition:  box-shadow .6s ease-in;
}

.card-img-top
{
	height: 180px;
	width: 245px;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UserHome</title>
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
		<h3 align="center">Movies</h3>
	</div>
	<hr/>
	
	<div class="container">
		
		<c:forEach items="${movies}" var="movie">
			
				<div class="card">
				
					  <div class="view overlay">
					  	<c:set var="imageName" value="${movie.imageName}" />
					  	<%
					  		String imageName=(String) pageContext.getAttribute("imageName");
					  		String imagePath="D:/Ram-CD/CD-Work/Ramkumar/MovieTicketBooking/src/main/webapp/WEB-INF/MovieImages/"+imageName;
					  		File file=new File(imagePath);
					  		byte[] byteImg = Files.readAllBytes(file.toPath());
							String imgString = Base64.encodeBase64String(byteImg);
					  	%>
					    <img class="card-img-top" src="data:image/jpg;base64,<%=imgString %>" alt="${movie.imageName}">
					    <a href="#!">
					      <div class="mask rgba-white-slight"></div>
					    </a>
					  </div>
					
					  <div class="card-body">
					
					    <h4 class="card-title" align="center">${movie.name}</h4>
					    <!-- Text -->
					    <p class="card-text"> <h5>Cast : ${movie.cast}</h5></p>
					   	<p class="card-text"><h5>Release Date : ${movie.releaseDate}</h5></p>
					   	
					   	<form action="/BookMovie" method="post">
					   	
					   		<input type="hidden" value="${movie.id}" name="movieId" />
					    	<button type="submit" class="btn btn-info btn-block">Book</button>
						
						</form>
						
					  </div>
				
				</div>
		
		</c:forEach>
		
	</div>
	
</body>
</html>
<%@ include file="common/footer.jspf" %>