<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UserLogin</title>

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

.space
{
	margin-top: 25px;
}
.card-container.card 
{
    max-width: 350px;
    padding: 40px 40px 0px 40px;
}

.profile-img-card
{
	width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}

.card {
    background-color: #F7F7F7;
   
    padding: 20px 25px 30px;
    margin: 0 auto 25px;
    margin-top: 10px;
    
    border-radius: 2px;
 
}

.registration
{
    color: rgb(104, 145, 162);
    margin-top: 14px;
}

.registration:hover,
.registration:active,
.registration:focus
{
    color: rgb(12, 97, 33);
}

.forgot-password
 {
    color: rgb(104, 145, 162);
    margin-top: 14px;
}

.forgot-password:hover,
.forgot-password:active,
.forgot-password:focus
{
    color: rgb(12, 97, 33);
}

.forgot-pass
{
	padding: 10px 0px 10px 0px;
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
	margin-left: 515px;
	color: black !important;
}

#alert
{
	max-width: 350px;
    margin: 0 auto 25px;
    margin-top: 50px;
    color: red;
}

</style>	

<script>
<!--
#$(document).ready(function(){
  
    $("#alert").hide(0);
  
});-->

</script>
	
<script type="text/javascript">
window.history.forward();
function noBack()
{
	window.history.forward();
}
</script>	
	
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
	
	<div class="container">
		
		<p id="title" class="h4 mb-4">Sign In</p>
		
		<div id="alert">
  			 <center>${errorMessage}</center>
		</div>
		
		<div class="card card-container"> 
		
			<form action="/UserLogin" method="post">
				
				<img class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png"  />	
								
				<div class="space"></div>
				<div class="form-group">
					<input type="text" name="username" placeholder="Enter Email Id" class="form-control" required autofocus />
				</div>
				
				<div class="form-group">
					<input type="password" name="password" placeholder="Enter password" class="form-control" required=""/>
				</div>
				
				<div class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember Me
                    </label>
                </div>
				
				<input type="submit" class="btn btn-primary btn-block btn-signin"  name="Sign in" value="Sign in" />
				
			</form>
			
			<div class="forgot-pass">
				<a href="#" class="forgot-password"> Forgot the password? </a>
			</div>
			
			<div class="border-top card-body text-center">
				New User? <a href="/UserRegistration" class="registration">Sign Up</a>
			</div>
			
		</div>
		
	</div>		
	
</body>
</html>