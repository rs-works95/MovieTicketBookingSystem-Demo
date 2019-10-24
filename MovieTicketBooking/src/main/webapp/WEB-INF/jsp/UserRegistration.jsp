<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Registration</title>

	<!-- Font Awesome -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- Bootstrap core CSS -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
	<!-- Material Design Bootstrap -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/css/mdb.min.css" rel="stylesheet">
	
	<!-- JQuery -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Bootstrap tooltips -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.13.0/umd/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/js/mdb.min.js"></script>
	
<style type="text/css">

.card-container.card 
{
    max-width: 520px;
    padding: 40px 40px 10px 40px;
}

.card {
    background-color: #F7F7F7;
   
    padding: 20px 25px 30px;
    margin: 0 auto 25px;
    margin-top: 10px;
    
    border-radius: 2px;
 
}

.login
 {
    color: rgb(104, 145, 162);
    margin-top: 14px;
}

.login:hover,
.login:active,
.login:focus
{
    color: rgb(12, 97, 33);
}

.btn.btn-signin 
{
    padding: 0px;
    font-weight: 700;
    font-size: 14px;
    height: 36px;
    border-radius: 3px;
}

#title
{
	margin-top:140px;
	margin-left: 500px;
	color: black !important;
}

#alert
{
	max-width: 350px;
    margin: 0 auto 25px;
    margin-top: 50px;
    color: red;
}

.requerido
{
	color: red;
}

</style>
	
<script>
$('#dateOfBirth').datepicker({
	format : 'dd/mm/yyyy'
});
</script>

<script src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>

<script>
<!--
#$(document).ready(function(){
  
    $("#alert").hide(0);
  
});-->

</script>
	
</head>
<body>
	
	<div class="container">
		
		<p id="title" class="h4 mb-4">Sign Up</p>
		
		<div id="alert">
  			 <center>${errorMessage}</center>
		</div>
		
		<div class="card card-container"> 
		
			<form action="/UserRegistration" method="post">
								
					
			<div class="form-row">
				<div class="col form-group">
						<label>First Name<span class="requerido"> *</span></label>
						<input type="text" name="firstName" placeholder="Enter First Name" class="form-control" required autofocus />
				</div>
				
				<div class="col form-group">
						<label>Last Name<span class="requerido"> *</span></label>
						<input type="text" name="lastName" placeholder="Enter Last Name" class="form-control" required />
				</div>
			</div>
			
			
			<div class="form-row">
				<div class="col form-group">
						<label>Date of Birth<span class="requerido"> *</span></label>
						<input type="date" id="dateOfBirth" name="dateOfBirth" placeholder="Enter Date of Birth" class="form-control" required />
				</div>
				
				<div class="col form-group">
						<label>Mobile No<span class="requerido"> *</span></label>
						<input type="text" name="mobileNo" placeholder="Enter Mobile No" class="form-control" required />
				</div>
			</div>
			
			<div class="form-group">
				<label class="form-check form-check-inline">
						<input type="radio" name="gender" value="Male" class="form-check-input" required=""/>
						<span class="form-check-label">Male</span>
				</label>
				<label class="form-check form-check-inline">
					<input type="radio" name="gender" value="Female" class="form-check-input" required=""/>
					<span class="form-check-label">Female</span>
				</label>
			</div>
			
			<div class="form-group">
				<label>Email Id<span class="requerido"> *</span></label>
				<input type="email" name="emailId" placeholder="Enter EmailId" class="form-control" required=""/>
			</div>
			
			<div class="form-group">
				<label>Password<span class="requerido"> *</span></label>
				<input type="password" name="password" placeholder="Enter password" class="form-control" required=""/>
			</div>
				
				
			<input type="submit" class="btn btn-primary btn-block btn-signin"  name="Register" value="Register"/>
				
			</form>
			
			<div class="border-top card-body text-center">
				Have an account? <a href="/UserLogin" class="login">Login</a>
			</div>
		</div>
		
	</div>		
	
</body>
</html>