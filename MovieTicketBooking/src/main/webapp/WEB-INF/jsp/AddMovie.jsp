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
<title>Home</title>
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
		<h4>Add Movie</h4>
		<hr/>
		
		<form action="AddMovie" method="post" enctype="multipart/form-data">
		
			<div class="form-group">
				<label>Name:</label>
				<input type="text" name="name" class="form-control" placeholder="Enter Movie Name" required/>
			</div>
			<div class="form-group">
				<label>Cast</label>
				<input type="text" name="cast" class="form-control" placeholder="Enter Cast" required/>
			</div>
			<div class="form-group">
				<label>Release Date</label>
				<input type="date" name="releaseDate" class="form-control" placeholder="Select Release Date" required/>
			</div>
			
			<div class="form-group">
				<label>Image</label>
				<input type="file" name="imageName" placeholder="Upload Image" required/>
			</div>
			
			<hr/>
		
			<input type="submit" class="btn btn-info btn-rounded waves-effect waves-light" value="Add Movie" />
				
		</form>
		
	</div>

</body>
</html>



<%@ include file="Admin/footer.jspf" %>