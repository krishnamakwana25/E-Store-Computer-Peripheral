<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Userbean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Userdao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="Icon" type="image/jpg" href="resources/images/logo1.jpg">
<head>
<title>About Us</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style type="text/css">
  	.banner
  	{
  		
  		height: auto;
  		padding-left: 0px;
  		padding-right: 0px;	
  	}
  	.my_border
  	{
  		border-image-slice:40 27 27 26;
  		border-image-width:0px 0px 8px 0px;
  		border-image-outset:0px 0px 0px 0px;
  		border-image-repeat:round round;
  		border-image-source:url("resources/images/my_border_img.png");
  		border-bottom:8px solid black;
  	} 
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
<% 
Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
%> 
</head>
<body onload="preloader1()">
<div id="loading"></div>

<jsp:include page="header1_user.jsp"></jsp:include>

<div class="container-fluid ">
		<img src="resources/images/about-us.jpg" class="img-fluid" style="height: 375px;width: 100%;">

		<div class="container mt-5 font-weight-bold text-center pb-3">
			<p class="text-center mt-2" style="font-size: 20px;font-style: normal;line-height: 1.6;font-family: 'Noto Sans', sans-serif;">
			Welcome to <a style="font-weight: bolder; ">E-Store</a>, your number one source for all things Laptop, CCTV Camera, Keyboard & Mouse, Printer, PC or Laptop on Rent,and make build your own choice PC.
					We're dedicated to providing you the very best of Computer and Laptop Peripheral, with an emphasis on Surety, 100% original product, privacy & security.</p>
		</div>
		
		<hr>
		<div class="container">
			<h1 class="text-center text-info">Our Products Brands</h1>
		</div>
		<hr class="my_border">
	</div>
	<!------------------->

<div class="container">
		<h2 class="text-center font-weight-bold">Laptops</h2>
		<hr>

		<div class="row p-3 pb-5">
			<div class="col-4 col-sm-4 col-md-4 col-lg-2">
				<div class="card rounded">
					<img src="resources/images/Acer.png" class="card-img" height="150px" width="150px">
				</div>
			</div>
			<div class="col-4 col-sm-4 col-md-4 col-lg-2">
				<div class="card rounded">
					<img src="resources/images/Asus.png" class="card-img" height="150px" width="150px">
				</div>
			</div>
			<div class="col-4 col-sm-4 col-md-4 col-lg-2">
				<div class="card rounded">
					<img src="resources/images/Dell.png" class="card-img" height="150px" width="150px">
				</div>
			</div>
			<div class="col-4 col-sm-4 col-md-4 col-lg-2">
				<div class="card rounded">
					<img src="resources/images/Lenovo.png" class="card-img" height="150px" width="150px">
			
				</div>
			</div>
			<div class="col-4 col-sm-4 col-md-4 col-lg-2">
				<div class="card rounded">
					<img src="resources/images/HP.png" class="card-img" height="150px" width="150px">
				</div>
			</div>
			<div class="col-4 col-sm-4 col-md-4 col-lg-2">
			</div>
		</div>
		<hr class="my_border">
</div>
<!----------------------->

<div class="container pb-5">
	<div class="row">
		<div class="col-lg-6 border-right">
			<h2 class="text-center font-weight-bold">CCTV</h2>
			<hr>
			<div class="row p-3">
			<div class="col-6 col-sm-6 col-md-3 col-lg-3">
				<div class="card rounded">
					<img src="resources/images/CP_Plus.png" class="card-img" height="150px" width="150px">
				</div>
			</div>
			<div class="col-6 col-sm-6 col-md-3 col-lg-3">
				<div class="card rounded">
					<img src="resources/images/Dahua.png" class="card-img" height="150px" width="150px">
				</div>
			</div>
			<div class="col-6 col-sm-6 col-md-3 col-lg-3">
				<div class="card rounded">
					<img src="resources/images/Hikvision.png" class="card-img" height="150px" width="150px">
				</div>
			</div>
			<div class="col-6 col-sm-6 col-md-3 col-lg-3">
				<div class="card rounded">
					<img src="resources/images/MI.png" class="card-img" height="150px" width="150px">
			
				</div>
			</div>
			</div>
		</div>
		<div class="col-lg-6">
			<h2 class="text-center font-weight-bold">Printer</h2>
			<hr>

			<div class="row p-3">
			<div class="col-4 col-sm-4 col-md-4 col-lg-4">
				<div class="card rounded">
					<img src="resources/images/Epson.png" class="card-img" height="150px" width="150px">
				</div>
			</div>
			<div class="col-4 col-sm-4 col-md-4 col-lg-4">
				<div class="card rounded">
					<img src="resources/images/Canon.png" class="card-img" height="150px" width="150px">
				</div>
			</div>
			<div class="col-4 col-sm-4 col-md-4 col-lg-4">
				<div class="card rounded">
					<img src="resources/images/HP.png" class="card-img" height="150px" width="150px">
				</div>
			</div>
			
			</div>
		</div>
	</div>
			
</div>
<!-------------------->
<div class="container-fluid">
	<hr class="my_border">
</div>

<div class="container mt-2 font-weight-bold text-center text-muted pb-3">
			<br><p>We hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don't hesitate to contact us.</p>
</div>

	
<jsp:include page="footer_user.jsp"></jsp:include>
</body>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

</html>