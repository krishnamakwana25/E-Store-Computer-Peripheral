<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="bean.Productbean" %>
<%@page import="bean.Userbean" %>
<%@page import="DAO.Userdao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<title>Rent - Terms & Conditions</title>
<%
Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
%>
</head>
<body onload="preloader1()">
<div id="loading"></div>
  
<jsp:include page="script.jsp"></jsp:include>
<jsp:include page="header1_user.jsp"></jsp:include>

<div>
	<img src="resources/images/terms_banner.jpg" >
</div>
<div class="container">
	<h1 class="mb-1" style="font-size:36px;font-weight: bold;font-family: cursive;">E-Store Rental Terms & Conditions</h1>
<!-- 	<p class="mt-4">Most items purchased from sellers listed on <a style="font-weight: bold;">E-store</a> are returnable within the 
	<br>return window,except those that are explicitly identified as not returnable</p> -->
	<hr style="border: 1px solid black;margin-top: 0px;"><br>
	
	<p>
&#9900;&nbsp;All of our laptop rentals and computer rentals are rented out for specific rental periods requested by our customers for any specific amount of time they &nbsp;&nbsp;&nbsp;need<br><br>
&#9900;&nbsp;We allow a 24-hour grace period after the end of your rental period for the laptops and computers to be returned.<br><br>
&#9900;&nbsp;This allows time for shipping complications of other unforeseen circumstances that may delay the return of your laptop or computer without a customer &nbsp;&nbsp;&nbsp;being charged a late-fee.<br><br>
&#9900;&nbsp;The equipment shall remain the property of <a style="font-weight: bolder;">E-Store</a> and the Customer shall not sell, exchange, pledge or part possession with the equipment.<br><br> 
&#9900;&nbsp;The Customer shall not service or repair the equipment nor deface or remove any identification from the equipment<br><br>
&#9900;&nbsp;<a style="font-weight: bolder;">Security Deposit</a> will be refunded after the rental period is over.<br><br>
&#9900;&nbsp;The Customer shall notify <a style="font-weight: bolder;">E-Store</a> immediately of any loss or damage to the equipment.<br><br>
&#9900;&nbsp;The Customer is responsible for the safe custody of the equipment and accessories and shall be liable for any loss, theft or damage to the equipment &nbsp;&nbsp;&nbsp;however it has been caused.<br><br>
&#9900;&nbsp;<a style="font-weight: bolder;">E-Store</a> will, whenever possible, protect the customer's data security and right to confidentiality by scanning for viruses and reformatting hard disks before &nbsp;&nbsp;&nbsp;they are rented.<br><br>
&#9900;&nbsp;Refundable Security deposit has to be paid online(mentioned) which will be returned once product handed over, the refundable deposit does not include &nbsp;&nbsp;&nbsp;rent. It is a security deposit that takes care of damages, loss or mishandling if any.<br><br>
&#9900;&nbsp;The Rentee agrees to pay for any damage to, loss of, or any theft (disappearance) of parts of Product, regardless of cause or fault. Item damaged beyond &nbsp;&nbsp;&nbsp;repair will be paid for at its Market Price.<br><br>

&#9900;&nbsp;The representative shall check the Product and its parts to ascertain any damage to items. Damage shall be defined as follows:
	<br><br>&nbsp;&nbsp;&nbsp;<a style="font-weight: bolder;">1.)</a> Any damage which existed before the handover of the Product and was agreed between the rentee and owner will not be chargeable to the Rentee.
	<br>&nbsp;&nbsp;&nbsp;<a style="font-weight: bolder;">2.)</a> The extent of damage would be ascertained by comparing the quality control document signed by the Rentee and photographs taken on &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;delivery/Pickup.
	<br>&nbsp;&nbsp;&nbsp;<a style="font-weight: bolder;">3.)</a> Any variation showing damages, if ascertained as not caused by normal wear and tear, would be charged and would have to be borne by the Rentee.<br><br>
&#9900;&nbsp;Documents required for rental PC/Laptop are:
<ul class="ml-5 mt-3" style="list-style-type: disc;">
  <li >Aadhaar Card (Personal)</li>
  <li>Pan card (Personal)</li>
  <li>Electricity bill (Personal Address)</li>
  <li>Security Non Dated Cheque equivalent to products market value</li>
</ul><br><br>

&nbsp;<a style="font-weight: bolder;">**Please note:</a> if your laptop rental is not postmarked within this grace period, you will be charged the full day rental rate for each day the laptop is not &nbsp;&nbsp;&nbsp;returned.<br><br>
	</p>
</div>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>