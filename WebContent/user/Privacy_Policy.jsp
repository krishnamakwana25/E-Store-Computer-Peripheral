<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<title>Privacy Policy</title>
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

<jsp:include page="script.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<div>
	<img src="resources/images/privacy_policy.jpg" width="100%" height="300px">
</div>
<div class="container">
	<h1 class="mb-1" style="font-size:36px;font-weight: bold;font-family: cursive;">E-Store PRIVACY POLICYs</h1>
	<hr style="border: 1px solid black;margin-top: 0px;"><br>
	
	<p>
	Thank you for choosing to be part of our community at <a style="font-weight: bold;">E-Store</a>. We are committed to protecting your personal information and your right to privacy. If you have any questions or concerns about our policy, or our practices with regards to your personal information, please <a href="contact_us.jsp">Contact Us</a>	<br>
	<ul class="ml-5 mt-3" style="list-style-type: disc;">
			<li>When you visit our and use our services, you trust us with your personal information. We take your privacy very seriously. In this privacy policy, we seek to explain to you in the clearest way possible what information we collect, how we use it and what rights you have in relation to it. We hope you take some time to read through it carefully, as it is important. If there are any terms in this privacy policy that you do not agree with, please discontinue use of our and our services.</li><br>
			<li>This privacy policy applies to all information collected through our and/or any related services, sales, marketing or events (we refer to them collectively in this privacy policy as the "Services").</li><br>
			<li>Please read this privacy policy carefully as it will help you make informed decisions about sharing your personal information with us.</li><br> 
			<li>Some information such as IP address and/or browser and device characteristics is collected automatically when you visit our .</li>
		</ul>	<br>	 
	</p>
	
	
	<p><a style="font-weight: bold;">1. WHAT INFORMATION DO WE COLLECT?</a><br><br> 
		<ol style="list-style-type: disc;" class="ml-5">
			<br><li>We collect personal information that you provide to us.</li>
			<li>We collect personal information that you voluntarily provide to us when registering at the expressing an interest in obtaining information about us or our products and services, when participating in activities on the (such as posting messages in our online forums or entering competitions, contests or giveaways) or otherwise contacting us.</li>
			<li>The personal information that we collect depends on the context of your interactions with us and the , the choices you make and the products and features you use. The personal information we collect can include the following: </li>
			<li>All personal information that you provide to us must be true, complete and accurate, and you must notify us of any changes to such personal information.</li>
		</ol><br>
	</p>
	
	<!-- <p><a style="font-weight: bold;">2. DO WE USE COOKIES AND OTHER TRACKING TECHNOLOGIES?</a><br><br> 
		<ol style="list-style-type: disc;" class="ml-5">
			<br><li>We may use cookies and other tracking technologies to collect and store your information.</li>
		</ol><br>
	</p> -->
	
	<p><a style="font-weight: bold;">2. DO WE MAKE UPDATES TO THIS POLICY?</a><br><br> 
		<ol style="list-style-type: disc;" class="ml-5">
			<br><li>Yes, we will update this policy as necessary to stay compliant with relevant laws.</li>
		</ol><br>
	</p>
	
	<p><a style="font-weight: bold;">3. HOW CAN YOU CONTACT US ABOUT THIS POLICY?</a><br><br> 
		<ol style="list-style-type: disc;" class="ml-5">
			<br><li>If you have questions or comments about this policy, you may <a href="contact_us.jsp">Contact Us</a>.</li>
		</ol><br>
	</p>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

</html>