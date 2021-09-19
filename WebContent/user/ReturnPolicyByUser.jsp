<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Productbean" %>
<%@page import="bean.Userbean" %>
<%@page import="DAO.Userdao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<title>Return Policy</title>
<%
Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
%>
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
<jsp:include page="header1_user.jsp"></jsp:include>
<div>
	<img src="resources/images/return.jpg">
</div>
<div class="container">
	<h1 class="mb-1" style="font-size:36px;font-weight: bold;font-family: cursive;">E-Store Return Policy</h1>
	<p class="mt-4">Most items purchased from sellers listed on <a style="font-weight: bold;">E-store</a> are returnable within the 
	<br>return window,except those that are explicitly identified as not returnable</p>
	<hr style="border: 1px solid black;margin-top: 0px;"><br>
	
	<p>Thanks for purchasing our products at <a style="font-weight: bold;">E-Store</a>.<br><br>
		&#9900;&nbsp;In order to be eligible for a refund, you have to return the product within 30 calendar days of your purchase. The product must be in the same condition that &nbsp;&nbsp;&nbsp;you receive it and undamaged in any way.<br><br>
		&#9900;&nbsp;If you wish to return an electronic device that stores any personal information, please ensure that you have removed all such personal information from the &nbsp;&nbsp;&nbsp;device prior to returning. E-Store shall not be liable in any manner for any misuse or usage of such information.<br><br>
		&#9900;&nbsp;After we receive your item, our team of professionals will inspect it and process your refund. The money will be refunded to the original payment method &nbsp;&nbsp;&nbsp;you have used during the purchase.<br><br>
		&#9900;&nbsp;If the product is damaged in any way, or you have initiated the return after 30 calendar days have passed, you will not be eligible for a refund.<br><br> 
		&#9900;&nbsp;If anything is unclear or you have more questions feel free to contact our customer support team.<br><br>
		&#9900;&nbsp;Products marked as "non-returnable" on the product detail page cannot be returned.<br><br>
		&#9900;&nbsp;Additional information is not required to return an eligible order unless otherwise noted in the category specific policy.<br><br>
		&#9900;&nbsp;<a style="font-weight: bold;">Note:</a> If you've received a non-returnable product in a damaged/defective condition, you can contact us within 10 days from the delivery of the product.<br><br>
	</p>
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