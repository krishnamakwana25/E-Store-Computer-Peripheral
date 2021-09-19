<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="connection.Connect"%>
<%@page import="bean.Userbean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Userdao" %>
<%@page import ="connection.Connect"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
	<title>Login Page</title>
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
<body onload="preloader1()">
<div id="loading"></div>
 
<!-- header -->
 <jsp:include page="script.jsp"></jsp:include>
	<jsp:include page="header.jsp"></jsp:include>
<!-- //header -->
<!-- banner -->
<% if(request.getParameter("msg") != null){
		   	 if(request.getParameter("msg").equals("logAgain")){%>
			<div class="alert alert-danger alert-dismissible fade show text-center h5" role="alert" style="font-size: 1vw;"><strong>Login Again ...!</strong> Please Login to access that page.<button type="button" class="close p-0" data-dismiss="alert" onclick='location.href="user_login.jsp";' aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
		<% } else if(request.getParameter("msg").equals("blocked")){%>
		<div class="alert alert-danger alert-dismissible fade show text-center h5" role="alert"style="font-size: 1vw;"><strong>Blocked ...!</strong> You are temporarily blocked for short time. To know more contact us <a href="mailto:theestore2020@gmail.com">theestore2020@gmail.com</a><button type="button" class="close p-0" data-dismiss="alert" onclick='location.href="user_login.jsp";' aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
		<% } else if(request.getParameter("msg").equals("failed")){%>
			<div class="alert alert-danger alert-dismissible fade show text-center h5" role="alert"style="font-size: 1vw;"><strong>Login Failed ...!</strong> Email or Password incorrect.<button type="button" class="close p-0" data-dismiss="alert"  aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
		<% } else if(request.getParameter("msg").equals(" regSuc")){%>
			<div class="alert alert-success alert-dismissible fade show text-center h5" role="alert"style="font-size: 1vw;"><strong>Registered Successfully ...!</strong><button type="button" class="close" data-dismiss="alert p-0" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
		<% } else if(request.getParameter("msg").equals("alReg")){%>
			<div class="alert alert-success alert-dismissible fade show text-center h5" role="alert"style="font-size: 1vw;"><strong>E-mail is Already Registered ...!</strong><button type="button" class="close" data-dismiss="alert p-0" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
		<% }}
%>	
<!-- //banner -->
<!-- banner-bottom -->
<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Login Page</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- login -->
<div class="container">
	<div class="login">
			<h3 class="animated">Login Form</h3>
			<div class="login-form-grids animated wow slideInUp" data-wow-delay=".5s">
				<form action="<%=application.getContextPath()%>/LoginController" method="post" data-parsley-validate>
					<input  type="email" name="email" id="email" placeholder="Email Address" required autofocus data-parsley-trigger="change" data-parsley-error-message="Please Enter Valid E-mail" data-parsley-pattern="^[a-z0-9@.]+$"><br>
					<input type="password" name="pass" id="pass" class="content-input-field" placeholder="Password" required data-parsley-minlength="6" data-parsley-maxlength="20" data-parsley-pattern="^[a-zA-Z0-9!@#$%&*]+$" data-parsley-error-message="Please Enter Valid Password" style="margin: 1em 0 !important;" autocomplete="off">
					<input type="checkbox" onclick="myFunction()">Show Password
					<a class="forgot pull-right mb-3" style="margin-top: 0px;" href="#" data-toggle="modal" data-target="#test2">Forgot Password?</a><br>
					<select class="form-control" id="designation" name="designation" required="required"  data-parsley-error-message="Login type is required">       
                   	  	<option value=" ">Login Type</option> 
                       	<option value="Login As User">Login As User</option>
                       	<option value="Login As Dealer">Login As Dealer</option>
                       	<!-- <option value="Login As Admin">Login As Admin</option> -->
           	        </select><br>       
					<input type="submit" name="action" value="Login">
				</form>
			</div>
			<h4 class="animated wow slideInUp" data-wow-delay=".5s">For New People</h4>
			<!-- ../dealer/dealer_register.jsp -->
			<p class="animated wow slideInUp" data-wow-delay=".5s"><a href="dealer_register.jsp">Register As Dealer</a><br><a href="user_register.jsp">Register As User</a> <br>(Or) go back to <a href="index.jsp">Home<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
		</div>
	</div>
<!-- //login -->
<!--modal---->
<div id="test2" class="modal fade" role="dialog" style="margin-top:200px !important">
	<div class="modal-dialog">	
		<div class="modal-content">
			<form action="<%=application.getContextPath()%>/Usercontroller" method="post" data-parsley-validate>
				<div class="modal-header mb-3 bg-danger">
					<h4 class="text-white" style="font-size:2vw ! important;">Password assistance</h4>
					<button type="button" class="close text-white" data-dismiss="modal">&times;</button>
				</div>		
					<div class="modal-body">   				
					 <p style="font-size: 1.2vw ! important">Enter your e-mail address below to reset your password.</p><br>
			           <input data-parsley-type="email" name="Email" placeholder="Email" autofocus autocomplete="off" class="form-control placeholder-no-fix" required data-parsley-trigger="change" data-parsley-error-message="Please Enter Valid E-mail" data-parsley-pattern="^[a-z0-9@.]+$"><br>
			           <p class="font-weight-bold" style="font-size:15px ! important;">Enter the email address associated with your E-Store account.</p>				
			      </div>
				<div class="modal-footer">
					<input type="submit" name="action" class="btn btn-danger" value="Submit">
				</div>
			</form>
		</div>	
	</div>
</div>
<!----modal done--------->	

<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
function myFunction() {
	  var x = document.getElementById("pass");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
</script>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>
</body>
</html>