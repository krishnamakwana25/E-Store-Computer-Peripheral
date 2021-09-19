<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<title>Contact Us</title>

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

<div class="container">	
	<div class = "contact_img">
		<h2 style="font-size:xx-large;padding-bottom:10px;" class="mt-4 font-weight-bold mb-1">We'd love to hear from you</h2>
		<p>Whether you have a question about features, trials, pricing, need a demo, or anything else, our team is ready to
		    	 answer all your questions</p>							
	</div>

	<div class = "row mt-3">
		<div class="col-sm-4 col-md-4 col-lg-4  animated wow slideInLeft">
			<div class="contactimg_1">
				<center><i class="glyphicon glyphicon-map-marker mt-4 " style="color:white;font-size:30px;color:orange;"></i></center>
				<h2 class="mt-3" style="font-size:xx-large;color:orange;font-weight: bolder;"><center>Address</center></h2>					
				<center><p class="mt-3 " style="color:white;font-family: 'Lato', sans-serif;font-weight: bolder;">
					12K Street, 45 Building Road,<br> Ahmedabad
				</p></center>
			</div>			
		</div>
			
		<div class="col-sm-4 col-md-4 col-lg-4  animated wow slideInLeft ">
			<div class="contact_img2">
				<center><i class="glyphicon glyphicon-earphone mt-4 " style="color:white;font-size:30px;color:orange;"></i></center>
				<h2 class="mt-3" style="font-size:xx-large;color:orange;font-weight: bolder;"><center>Call Us</center></h2>					
				<center><p class="mt-3" style="color:orange;font-family: 'Lato', sans-serif;font-weight: bolder;">
					+917383736870
				</p></center>
			</div>			
		</div>
		
		<div class="col-sm-4 col-md-4 col-lg-4  animated wow slideInLeft">
			<div class="contactimg_1">
				<center><i class="glyphicon glyphicon-envelope  mt-4 " style="color:white;font-size:30px;color:orange;"></i></center>
				<h2 class="mt-3" style="font-size:xx-large;color:orange;font-weight: bolder;"><center>Email</center></h2>					
				<center><p class="mt-3 " style="color:white;font-family: 'Lato', sans-serif;font-weight: bolder;">
		 			<a style="color:white !important;" href="mailto:theestore2020@gmail.com"> theestore2020@gmail.com</a>
				</p></center>
			</div>			
		</div>
	</div>
</div>
<div class="container">
		<div class=" row mt-4 p-3 bg-light">
			<div class="col-sm-3"></div>
			<div class="col-sm-6 card text-center p-3">
				<h3 class="card-header">Contact Us</h3>
				<p class="text-danger text-left m-2">* Fill the form to reach us *</p>
				<div class="card-body">
					<form action="<%=application.getContextPath()%>/ContactusController" class="animated wow " data-wow-delay=".5s" method="post" action="#" data-parsley-validate refresh()>
						<input type="text" class="form-control" name="name" id="name" placeholder="Your Name"  onkeypress="return !onlyNumbers(event)" required data-parsley-length="[3,20]"><br>
						<input type="email" class="form-control" placeholder="Email Address"  name="email" id="email" maxlength="50" required="required" data-parsley-error-message="Please Enter Valid E-mail" data-parsley-pattern="^[a-z0-9@.]+$" ><br>
						<input type="text" class="form-control" name="mobile_no" id="mobile_no" placeholder=" Mobile Number" required data-parsley-maxlength="10" data-parsley-minlength="10" data-parsley-type="integer" data-parsley-error-message="Mobile Number must be 10 digit"><br>
						<textarea type="text" class="form-control" placeholder="Your Message"name ="message" id="message" rows="5" required></textarea><br>
						<input type="submit" value="Send Your Message!" name="action" id="btnregister" class="btn btn-success"><br>
					</form>
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
		var preloader = document.getElementById("loading");
		function preloader1()
		{
			preloader.style.display = 'none';
		};
	</script>
</body>
</html>