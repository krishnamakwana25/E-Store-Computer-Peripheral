<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Dealerregisterbean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.DealerRegisterdao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<title>Terms & Conditions</title>
<% 
    Dealerregisterbean db = DealerRegisterdao.getDealerById((Integer) session.getAttribute("id"));
%>
<style type="text/css">
#loading{
	position: fixed;
	width: 100%;
	height: 100vh;
	background: #fff
	url('resources/images/preloader.gif')
	 no-repeat center center;	
	z-index: 99999;
	}
</style>
</head>
<body onload="preloader1()">
<div id="loading"></div>  
<jsp:include page="script.jsp"></jsp:include>
<jsp:include page="header2_dealer.jsp"></jsp:include>
<div>
	<img src="resources/images/terms_banner.jpg">
</div>
<div class="container">
	<h1 class="mb-1" style="font-size:36px;font-weight: bold;font-family: cursive;">E-Store Terms & Conditions.</h1>
	<hr style="border: 1px solid black;margin-top: 0px;"><br>
	
	<p><a style="font-weight: bold;">AGREEMENT TO TERMS</a><br><br>
		<ul class="ml-5 mt-3" style="list-style-type: disc;">
			<li>These Terms of Use constitute a legally binding agreement made between you, whether personally or on behalf of an entity (you) and E-Store .You agree that by accessing the Site, you have read, understood, and agreed to be bound by all of these Terms of Use. IF YOU DO NOT AGREE WITH ALL OF THESE TERMS OF USE, THEN YOU ARE EXPRESSLY PROHIBITED FROM USING THE SITE AND YOU MUST DISCONTINUE USE IMMEDIATELY.</li><br>
			<li>Supplemental terms and conditions or documents that may be posted on the Site from time to time are hereby expressly incorporated herein by reference. We reserve the right, in our sole discretion, to make changes or modifications to these Terms of Use at any time and for any reason. We will alert you about any changes by updating the Last updated of these Terms of Use, and you waive any right to receive specific notice of each such change. It is your responsibility to periodically review these Terms of Use to stay informed of updates. You will be subject to, and will be deemed to have been made aware of and to have accepted, the changes in any revised Terms of Use by your continued use of the Site after the date such revised Terms of Use are posted.</li><br>
			<li>The information provided on the Site is not intended for distribution to or use by any person or entity in any jurisdiction or country where such distribution or use would be contrary to law or regulation or which would subject us to any registration requirement within such jurisdiction or country. Accordingly, those persons who choose to access the Site from other locations do so on their own initiative and are solely responsible for compliance with local laws, if and to the extent local laws are applicable.</li><br>
			<li>The Site is intended for users who are at least 13 years of age. All users who are minors in the jurisdiction in which they reside (generally under the age of 18) must have the permission of, and be directly supervised by, their parent or guardian to use the Site. If you are a minor, you must have your parent or guardian read and agree to these Terms of Use prior to you using the Site.</li><br> 
		</ul>
	</p>
	
	<p><a style="font-weight: bold;">INTELLECTUAL PROPERTY RIGHTS</a><br><br>
		<ul class="ml-5 mt-3" style="list-style-type: disc;">
			<li>Unless otherwise indicated, the Site is our proprietary property and all source code, databases, functionality, software, website designs, audio, video, text, photographs, and graphics on the Site (collectively, the Content) and the trademarks, service marks, and logos contained therein (the Marks) are owned or controlled by us or licensed to us, and are protected by copyright and trademark laws and various other intellectual property rights and unfair competition laws of the United States, international copyright laws, and international conventions.</li><br>
			<li> The Content and the Marks are provided on the Site AS IS for your information and personal use only. Except as expressly provided in these Terms of Use, no part of the Site and no Content or Marks may be copied, reproduced, aggregated, republished, uploaded, posted, publicly displayed, encoded, translated, transmitted, distributed, sold, licensed, or otherwise exploited for any commercial purpose whatsoever, without our express prior written permission.</li><br>
			<li>Provided that you are eligible to use the Site, you are granted a limited license to access and use the Site and to download or print a copy of any portion of the Content to which you have properly gained access solely for your personal, non-commercial use. We reserve all rights not expressly granted to you in and to the Site, the Content and the Marks.</li><br>
		</ul>
	</p>

	<p><a style="font-weight: bold;">USER REPRESENTATIONS</a><br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;By using the Site, you represent and warrant that: 
		<ol style="list-style-type: decimal;" class="ml-5">
			<br><li>all registration information you submit will be true, accurate, current, and complete; </li>
			<li>you will maintain the accuracy of such information and promptly update such registration information as necessary; </li>
			<li>you have the legal capacity and you agree to comply with these Terms of Use; </li>
			<li>you are not under the age of 13;</li>
			<li>you are not a minor in the jurisdiction in which you reside, or if a minor, you have received parental permission to use the Site;</li>
			<li>you will not access the Site through automated or non-human means, whether through a bot, script or otherwise;</li>
			<li>you will not use the Site for any illegal or unauthorized purpose;</li>
			<li>your use of the Site will not violate any applicable law or regulation.</li> 
		</ol>
		<br><p class="ml-5">If you provide any information that is untrue, inaccurate, not current, or incomplete, we have the right to suspend or terminate your account and refuse any and all current or future use of the Site (or any portion thereof).</p><br>
	</p>
	
	<p><a style="font-weight: bold;">USER REGISTRATION</a><br><br>
		<ul class="ml-5 mt-3" style="list-style-type: disc;">
			<li>You may be required to register with the Site. You agree to keep your password confidential and will be responsible for all use of your account and password. We reserve the right to remove, reclaim, or change a username you select if we determine, in our sole discretion, that such username is inappropriate, obscene, or otherwise objectionable.</li><br>
		</ul>
	</p>

	<p><a style="font-weight: bold;">PRODUCTS</a><br><br>
		<ul class="ml-5 mt-3" style="list-style-type: disc;">
			<li>We make every effort to display as accurately as possible the colors, features, specifications, and details of the products available on the Site. However, we do not guarantee that the colors, features, specifications, and details of the products will be accurate, complete, reliable, current, or free of other errors, and your electronic display may not accurately reflect the actual colors and details of the products. All products are subject to availability, and we cannot guarantee that items will be in stock. We reserve the right to discontinue any products at any time for any reason. Prices for all products are subject to change.</li><br>
		</ul>
	</p>
	
	<p><a style="font-weight: bold;">PURCHASES AND PAYMENT</a><br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;We accept the following forms of payment:
		<ul class="ml-5 mt-3" style="list-style-type:disc;">
			<li>You agree to provide current, complete, and accurate purchase and account information for all purchases made via the Site. You further agree to promptly update account and payment information, including email address, payment method, and payment card expiration date, so that we can complete your transactions and contact you as needed. Sales tax will be added to the price of purchases as deemed required by us. We may change prices at any time. All payments shall be in INR Rupees.</li><br>
			<li>You agree to pay all charges at the prices then in effect for your purchases and any applicable shipping fees, and you authorize us to charge your chosen payment provider for any such amounts upon placing your order. We reserve the right to correct any errors or mistakes in pricing, even if we have already requested or received payment.</li><br>
			<li>We reserve the right to refuse any order placed through the Site. We may, in our sole discretion, limit or cancel quantities purchased per person, per household, or per order. These restrictions may include orders placed by or under the same customer account, the same payment method, and/or orders that use the same billing or shipping address. We reserve the right to limit or prohibit orders that, in our sole judgment, appear to be placed by dealers, resellers, or distributors.</li><br> 
		</ul>
	</p>
	
	<p><a style="font-weight: bold;">RETURN POLICY</a><br><br>
		<ul class="ml-5 mt-3" style="list-style-type:disc;">
			<li>Please review our Return Policy posted on the Site prior to making any purchases.<a href="ReturnPolicy.jsp" style="font-weight: bold;">Return Policy</a></li><br>
		</ul>
	</p>
	
	<p><a style="font-weight: bold;">PROHIBITED ACTIVITIES</a><br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;You may not access or use the Site for any purpose other than that for which we make the Site available.<br>
		<br>&nbsp;&nbsp;&nbsp;&nbsp;As a user of the Site, you agree not to:
		<ol style="list-style-type: decimal;" class="ml-5">
			<br><li>Make any unauthorized use of the Site, including collecting usernames and/or email addresses of users by electronic or other means for the purpose of sending unsolicited email, or creating user accounts by automated means or under false pretenses.</li>
			<li>Systematically retrieve data or other content from the Site to create or compile, directly or indirectly, a collection, compilation, database, or directory without written permission from us.</li>
			<li>Use a buying agent or purchasing agent to make purchases on the Site.</li>
			<li>Use the Site to advertise or offer to sell goods and services.</li>
			<li>Trick, defraud, or mislead us and other users, especially in any attempt to learn sensitive account information such as user passwords.</li>
			<li>Make improper use of our support services or submit false reports of abuse or misconduct.</li>
			<li>Sell or otherwise transfer your profile.</li>
			<li>Harass, annoy, intimidate, or threaten any of our employees or agents engaged in providing any portion of the Site to you.</li>
			<li>Delete the copyright or other proprietary rights notice from any Content.</li> 
		</ol>
	</p><br>
	
	<p><a style="font-weight: bold;">CONTRIBUTION LICENSE</a><br><br>
		<ul class="ml-5 mt-3" style="list-style-type:disc;">
			<li>You and Site agree that we may access, store, process, and use any information and personal data that you provide following the terms of the Privacy Policy and your choices (including settings).</li><br>
			<li>By submitting suggestions or other feedback regarding the Site, you agree that we can use and share such feedback for any purpose without compensation to you.</li><br>
			<li>We do not assert any ownership over your Contributions. You retain full ownership of all of your Contributions and any intellectual property rights or other proprietary rights associated with your Contributions. We are not liable for any statements or representations in your Contributions provided by you in any area on the Site. You are solely responsible for your Contributions to the Site and you expressly agree to exonerate us from any and all responsibility and to refrain from any legal action against us regarding your Contributions.</li><br> 
		</ul>
	</p>
	
	<p><a style="font-weight: bold;">GUIDELINES FOR REVIEWS</a><br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;We may provide you areas on the Site to leave reviews or ratings. When posting a review, you must comply with the following criteria: <br>
		<ol style="list-style-type: decimal;" class="ml-5">
			<br><li>you should have firsthand experience with the person/entity being reviewed;</li>
			<li>your reviews should not contain offensive profanity, or abusive, racist, offensive, or hate language; </li>
			<li>your reviews should not contain discriminatory references based on religion, race, gender, national origin, age, marital status, sexual orientation, or disability;</li>
			<li>your reviews should not contain references to illegal activity;</li>
			<li>you should not be affiliated with competitors if posting negative reviews;</li>
			<li>you should not make any conclusions as to the legality of conduct;</li>
			<li>you may not post any false or misleading statements;</li>
			<li>you may not organize a campaign encouraging others to post reviews, whether positive or negative.</li>
		</ol>
		
		<br><p class="ml-5">
		<ul class="ml-5 mt-3" style="list-style-type:disc;">
			<li>We may accept, reject, or remove reviews in our sole discretion. We have absolutely no obligation to screen reviews or to delete reviews, even if anyone considers reviews objectionable or inaccurate. Reviews are not endorsed by us, and do not necessarily represent our opinions or the views of any of our affiliates or partners. We do not assume liability for any review or for any claims, liabilities, or losses resulting from any review. By posting a review, you hereby grant to us a perpetual, non-exclusive, worldwide, royalty-free, fully-paid, assignable, and sublicensable right and license to reproduce, modify, translate, transmit by any means, display, perform, and/or distribute all content relating to reviews.</li><br>
		</ul>
		</p>
	</p>
	
	<p><a style="font-weight: bold;">SITE MANAGEMENT</a><br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;We reserve the right, but not the obligation, to:  <br>
		<ol style="list-style-type: decimal;" class="ml-5">
			<br><li>monitor the Site for violations of these Terms of Use; </li>
			<li>take appropriate legal action against anyone who, in our sole discretion, violates the law or these Terms of Use, including without limitation, reporting such user to law enforcement authorities;</li>
			<li>in our sole discretion and without limitation, refuse, restrict access to, limit the availability of, or disable (to the extent technologically feasible) any of your Contributions or any portion thereof; </li>
			<li>in our sole discretion and without limitation, notice, or liability, to remove from the Site or otherwise disable all files and content that are excessive in size or are in any way burdensome to our systems;</li>
			<li>otherwise manage the Site in a manner designed to protect our rights and property and to facilitate the proper functioning of the Site and the Marketplace Offerings.</li>
		</ol><br>
	</p>
	
	<p><a style="font-weight: bold;">PRIVACY POLICY</a><br><br>
		<ul class="ml-5 mt-3" style="list-style-type:disc;">
			<li>We care about data privacy and security. By using the Site or the Marketplace Offerings, you agree to be bound by our Privacy Policy posted on the Site, which is incorporated into these Terms of Use. Please be advised the Site and the Marketplace Offerings are hosted in India. If you access the Site or the Marketplace Offerings from any other region of the world with laws or other requirements governing personal data collection, use, or disclosure that differ from applicable laws in India, then through your continued use of the Site, you are transferring your data to India, and you expressly consent to have your data transferred to and processed in India.</li><br>
		</ul>
	</p>
	
	<p><a style="font-weight: bold;">GOVERNING LAW</a><br><br>
		<ul class="ml-5 mt-3" style="list-style-type:disc;">
			<li>These terms shall be governed by and defined following the laws of India. E-Store and yourself irrevocably consent that the courts of India shall have exclusive jurisdiction to resolve any dispute which may arise in connection with these terms.</li><br>
		</ul>
	</p>
	
	<p>
	<a style="font-weight: bold;">CONTACT US</a><br><br>
	&nbsp;&nbsp;&nbsp;&nbsp;In order to resolve a complaint regarding the Site or to receive further information regarding use of the Site, please <a href="contact_usByDealer.jsp" style="font-weight: bold;">Contact Us</a>.<br><br>
	</p>
	
</div>
<jsp:include page="footer_dealer.jsp"></jsp:include>
<script>
		// $(document).ready(function(){
			// 	$('div#loading').removeAttr('id');
		// });
		var preloader = document.getElementById("loading");
		// window.addEventListener('load', function(){
		// 	preloader.style.display = 'none';
		// 	})

		function preloader1(){
			preloader.style.display = 'none';
		};
	</script>
</body>
</html>



<!-- AN IMPORTANT PATH FOR SETTING IMAGES -->
<!-- C:\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\Admin_Panel\uploadimg -->