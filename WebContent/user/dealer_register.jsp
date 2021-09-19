<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dealer Registration</title>
<style type="text/css">
#loading{
	position: fixed;
	width: 100%;
	height: 100vh;
	background: #fff
	url('resources/images/loader.gif')
	 no-repeat center center;	
	z-index: 99999;
	}
</style>

</head>
<jsp:include page="header.jsp"></jsp:include>
<body onload="preloader1()">
<div id="loading"></div>

<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Register Page</li>
			</ol>
		</div>
	</div>
		
	<div class="container">
	<div class="register">
		<div class="container">
			<h3 class="animated wow " >Register Here</h3> 
			<div class="login-form-grids">
				<form class="animated wow" data-wow-delay=".5s" method="post" action="<%=application.getContextPath()%>/DealerRegisterController" data-parsley-validate="true" refresh() enctype = "multipart/form-data">
				 	<input type="text" name="dealernm" id="dealernm" placeholder="Dealer Name" required=" " autofocus  data-parsley-length="[3,20]"><br>				 
					<input type="email" placeholder="Email Address"  name="email" id="email" required="required"  data-parsley-error-message="Please Enter Valid E-mail" data-parsley-pattern="^[a-z0-9@.]+$"><br>
					<input type="text" name="contactno" id="contactno" placeholder="Contact Number" required  data-parsley-type="integer" data-parsley-maxlength="10" data-parsley-error-message="Mobile Number must be 10 digit"><br>
					<textarea type="text" placeholder="Address"name ="address" id="address" rows="5" required=" "  data-parsley-minlength="3" data-parsley-maxlength="50" style="width:100%;"></textarea><br><br>
					<input type="file" name="photo" id="photo" required data-parsley-min-file-size="50" data-parsley-max-file-size="250"><br>					
					<input type="password" placeholder="Password" name="password" id="password" class="content-input-field"  required="required" data-parsley-type="alphanum" data-parsley-minlength="6" data-parsley-maxlength="20" data-parsley-error-message="Passwords must be at least 6 characters"data-parsley-pattern="^[a-zA-Z0-9!@#$%&*]+$"><br>
					<input type="password" placeholder="Password Confirmation" name="cofirmpassword" id="cofirmpassword" class="content-input-field"  required="required" data-parsley-type="alphanum" data-parsley-minlength="6" data-parsley-maxlength="20" data-parsley-error-message="Passwords must be at least 6 characters" data-parsley-pattern="^[a-zA-Z0-9!@#$%&*]+$" >
					<input type="checkbox" onclick="myFunction()">Show Password
					<span class="font_clr" id="error_pwd_msg"></span><br>
					<div>
						<input type="submit" value="Register As Dealer" name="action" name="btnregister" id="btnregister"><br>
					</div>
					<div class="pull-right">
						<a class ="ml-5" href="../user/user_login.jsp">Already registered ? </a>					
					</div>
				</form>
			</div>
				<div class="register-home animated wow " data-wow-delay=".5s">
					<a href="index.jsp">Home</a>				
				</div>
		</div>
	</div>
</div>
	
</body>
<script type="text/javascript">
    $(function () {
        $("#btnregister").click(function () {
            var password1 = $("#password").val();
            var confirmPassword1 = $("#cofirmpassword").val();
            if(password1==" " && confirmPassword1==" ")
            {
                document.getElementById('error_pwd_msg').innerHTML="*Enter Confirm Password Same as Password";
                return false;
           	}
            if (password1 != confirmPassword1) {
                document.getElementById('error_pwd_msg').innerHTML="*Enter Confirm Password Same as Password";
                return false;
            }
            else
           	{
           	document.getElementById('error_pwd_msg').innerHTML="*Macthed";
               return true;
           	}
        });
    });
    
    function myFunction() {
  	  var x = document.getElementById("password");
  	  var x1 = document.getElementById("cofirmpassword");
  	  if ((x.type === "password") ||  (x1.type === "password"))
  	  {
  	    x.type = "text";
  	  x1.type = "text";
  	  } 
  	  else 
  	  {
  	    x.type = "password";
  	  x1.type = "password";
  	  }
  	 }

</script>
<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> -->
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

<jsp:include page="footer.jsp"></jsp:include>
<jsp:include page="script.jsp"></jsp:include>
</html>