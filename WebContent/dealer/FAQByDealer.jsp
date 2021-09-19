<%@page import="bean.Dealerregisterbean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.DealerRegisterdao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="Icon" type="image/jpg" href="resources/images/logo1.jpg">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FAQ's</title>
<% 
    Dealerregisterbean db = DealerRegisterdao.getDealerById((Integer) session.getAttribute("id"));
%>
<style type="text/css">
 .color1
 {
 	background-color: #dcdcdc !important;
 }
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
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
</head>
<body onload="preloader1()">
<div id="loading"></div>

<jsp:include page="script.jsp"></jsp:include>
<jsp:include page="header2_dealer.jsp"></jsp:include>

<div class="container mb-3">
	<div class="row">
		<div class="col-md-12">
		    <div id="accordion">
		    <!-- ADD QUE -1 HERE -->
			  <div class="card">
			    <div class="card-header color1 question">
			      <a class="card-link text-dark" data-toggle="collapse" href="#collapseOne"><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>Whether the inventory is handled by the dealers?</h6>
			        
			      </a>
			    </div>
			    <div class="collapse answer" data-parent="#accordion">
			      <div class="card-body">
			        No, Dealer is only contact us for about their products and new stock.
			      </div>
			    </div>
			  </div>
			
			  <div class="card">
			    <div class="card-header color1 question">
			      <a class="collapsed card-link text-dark" data-toggle="collapse" href="#collapseTwo"><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>Why we provide stock to your system? </h6>
			      </a>
			    </div>
			    <div class="collapse answer" data-parent="#accordion">
			      <div class="card-body">
			         Our system provides user to best quality. We provide you huge customer area for selling your products. Also we give you time to time payments. 
			      </div>
			    </div>
			  </div>
			
			  <div class="card">
			    <div class="card-header color1 question">
			      <a class="collapsed card-link text-dark" data-toggle="collapse" href="#collapseThree"><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>Is your system is easy to use for us? </h6>
			        <span class="float-right"><i class="ti-plus"></i></span>
			      </a>
			    </div>
			    <div class="collapse answer" data-parent="#accordion">
			      <div class="card-body">
			        Yes, we provide you all the details about how to use our system for your stocks management, also we are 24/7 available for helping you. You can easily contact us and get at the time solutions. 
			      </div>
			    </div>
			  </div>
			  
			   <div class="card">
			    <div class="card-header color1 question">
			      <a class="collapsed card-link text-dark" data-toggle="collapse" href="#collapseThree"><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>Your system follow all the legal law for selling products? </h6>
			        <span class="float-right"><i class="ti-plus"></i></span>
			      </a>
			    </div>
			    <div class="collapse answer" data-parent="#accordion">
			      <div class="card-body">
			        Yes, 100% we proceed all the legal law for the selling products, we cannot break any single rule for the selling our products.  
			      </div>
			    </div>
			  </div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
		jQuery(document).ready(function($) {

			$(document).on('click', '.question', function(event) {
				
				var next=$(this).next().slideToggle('slow');

				$('.answer').not(next).slideUp('slow');
			});
		});
</script>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

<jsp:include page="footer_dealer.jsp"></jsp:include>
</body>
</html>