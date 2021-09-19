<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="bean.Userbean" %>
<%@page import="DAO.Userdao" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Productdao" %>
<%@page import="bean.Productbean" %>
<%@page import="DAO.RateToProductdao" %>
<%@page import="DAO.Wishlistdao" %>
<%@page import="bean.Dealerregisterbean" %>
<%@page import="DAO.DealerRegisterdao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="Icon" type="image/jpg" href="resources/images/logo1.jpg">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%	
Dealerregisterbean db = DealerRegisterdao.getDealerById((Integer) session.getAttribute("id"));
Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
int pid = (Integer) session.getAttribute("proid"); 
int mid = Integer.parseInt(request.getParameter("mainid")); 
Productbean pb = Productdao.getProductById((Integer) session.getAttribute("proid"));
%>
<%
	RateToProductdao d1 = new RateToProductdao();
	int five = d1.getFiveCount(pid);
	if(five ==0 )
		five =0 ;
	
	int four = d1.getFourCount(pid);
	if(four ==0 )
		four =0 ;
	
	int three = d1.getThreeCount(pid);
	if(three ==0 )
		three =0 ;
	
	int two = d1.getTwoCount(pid);
	if(two ==0 )
		two =0 ;
	
	int one = d1.getOneCount(pid);
	if(one ==0 )
		one =0 ;
	
	int zero = d1.getZeroCount(pid);
	if(zero ==0 )
		zero =0 ;
	
	int count = d1.getCount(pid);
	float average ; 
	if(one == 0 & two == 0 & three== 0 & four == 0 & five == 0)
	{
		 average = (5*five + 4*four + 3*+three + 2*two + 1*one);
	}
	else
	{	
		 average =(float) (5*five + 4*four + 3*three + 2*two + 1*one) / (float) (five+four+three+two+one);
	}
%>

<style type="text/css">
.in_stock
	{
		width:100%;
		height:45px;
		position:absolute;
		bottom:12px;
		left:0px;
		background-color:green; /*#ff8600    #ff7f50*/
		padding-top:9px;
	}
 .out_stock
{
	width:100%;
	height:45px;
	position:absolute;
	bottom:12px;
	left:0px;
	background-color:#ff8c00; /*#ff8600    #ff7f50*/
	padding-top:9px;
}
.side
	{
		box-shadow: 1px 1px 6px grey;
		height: 420px;
		padding: 8px;
		margin-bottom: 15px;
		margin-top: 10px;
		width:100%;
		background-color: white;
	}
	.img
	{
		
		height: 250px;
		/* border: 1px solid #d7d4d4; */
		border-radius: 5px;
	}
	.name
	{
		height:60px;
		overflow: hidden;
   		text-overflow: ellipsis;
    	/* white-space: nowrap; */
    	max-width:300px;
	}
	.btn_div
	{
		width: 100%;
	}

	.sidebar
  	{
  		border: 1px solid grey;
  		height: 500px;
  		
  	}
  	.side_cat
  	{
  		box-shadow: 1px 1px 5px grey;
  		overflow-y: scroll;
  		height: 270px;
  	}
  	.main
  	{
  		border: 1px solid grey;
  		height: auto;
  		
  	}
  	.main_cat
  	{
		border-bottom: 1px solid grey;
		cursor: pointer;
		padding: 10px;
	}
	.result_div
	{
		padding: 10px;
		border-bottom: 1px solid grey;
		display: none;
	}
	

	.heart i.fa-heart{
		color: #f44336;
		
	}
	.heart{
		animation : heart 1.5s linear;
	}
	@keyframes heart{
		0%{
			transform : rotate(0deg) scale(1);
		}
		20%{
			transform : rotate(90deg) scale(1);
		}
		30%{
			transform : rotate(180deg) scale(1);		
		}
		40%{
			transform : rotate(270deg) scale(1);		
		}
		100%{
			transform : rotate(360deg) scale(1);
		}
	}
	.product-details .countdown-timer-wrapper{display: none !important;}
	
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



	
<link href="resources/css/btn_effect.css" rel="stylesheet" type="text/css"  />
<link href="resources/css/prod.css" rel="stylesheet" type="text/css"  />
<link href="resources/css/font-awesome.min.css" rel="stylesheet"> 
<link href="resources/css/single_css.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="resources/css/w3.css">
	</head>
	<body onload="preloader1()">
<!-- https://loading.io/asset/371099 -->
<div id="loading"></div>
	<jsp:include page="header2_dealer.jsp"></jsp:include>
	<script>
	$(document).ready(function() {
		$(".like").click(function(){
			$(this).toggleClass("heart");
		});
		
	});
	
	jQuery(function() {
	  jQuery('.swatch :radio').change(function() {
		var optionIndex = jQuery(this).closest('.swatch').attr('data-option-index');
		var optionValue = jQuery(this).val();
		jQuery(this)
		.closest('form')
		.find('.single-option-selector')
		.eq(optionIndex)
		.val(optionValue)
		.trigger('change');
	  });
	});
	
	function myFunction1(smallImg)
	{
		var fullImg = document.getElementById("imageBox");
		fullImg.src = smallImg.src;
		/* $("img").css("border", "2px solid yellow"); */
		
	}
	
	jQuery('#AddToCart').click(function(e) {
		e.preventDefault();
		Shopify.addItemFromFormStart('AddToCartForm', 1912078270534);
		 }); 
	
	

	</script>
<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index1_dealer.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Product Details</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<div class="container mb-5">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="row mt-5">
			<div class="col-sm-1 col-md-1 col-lg-1">
			</div> 
			 <%        
				List<Productbean> list = Productdao.getQuickProductByProId(pb.getProductid());
				for(Productbean product1: list)
				{
			%>
			<div class="col-sm-1 col-md-1 col-lg-1">
				<div class="pdct-small-img">
					<img src="../uploadimg/<%=product1.getProductPhoto1() %>" onclick="myFunction1(this)" style="width: 80px; height:70px;border: 1px solid gray;">
					<img src="../uploadimg/<%=product1.getProductPhoto2() %>" onclick="myFunction1(this)" style="width: 80px; height:70px;border: 1px solid gray;">
					<img src="../uploadimg/<%=product1.getProductPhoto3() %>" onclick="myFunction1(this)" style="width: 80px; height:70px;border: 1px solid gray;">
					<img src="../uploadimg/<%=product1.getProductPhoto4() %>" onclick="myFunction1(this)" style="width: 80px; height:70px;border: 1px solid gray;">
				</div>
			
			</div>
			<div class="col-sm-4 col-md-4 col-lg-4" >
				<div class="timer-grid-right1">
					<img id="imageBox" src="../uploadimg/<%=product1.getProductPhoto1() %>" alt=" " class="img img p-2"  style="border:2px solid #c0c0c0;height:325px;width: 430px !important;"/>
				</div>
			</div>
			<div class="col-sm-6 col-md-6 col-lg-6">
				<div class="product-details">
					<h1 class="single-product-name" style="font-size:2vw !important;"><% out.println(product1.getProductName());%></h1>
					<title><% out.println(product1.getProductName());%></title>
					<div class="single-product-reviews">
						<span class="shopify-product-reviews-badge" data-id="1912078270534"></span>
					</div>					
					<div class="single-product-price">
						<div class="product-discount"><span  class="price" id="ProductPrice"><span class=money>&#8377;<% out.println(product1.getProductPrice());%></span></span></div>
					</div>
					<div class="product-info"><%out.println(product1.getProductSpecification1()); %></div>
							<div class='rating-stars mt-3'>										
						<!-- ************************************************************ -->
							<%
									int i ; 
									if(average<=5)
									{
										System.out.println("average is  : "+average);
										for(i=0;i<average;i++)
										{
									%>
									<i class='fa fa-star fa-fw' style="color:yellow;font-size:25px;"></i>  											
									<%
										}									
										if(i==5)
										{}
										else
										{
											for(int j = i ; j<5 ; j++)
											{	
									 %>
											<i class='fa fa-star fa-fw' style="font-size:25px;"></i>
										<%
											}
										}	
									}  											
						%>
					</div>
					<%
					  	int p = Integer.parseInt(product1.getProductPrice());
						int q = 1;
						int total = p * q ;
					%>
					
					<% 
						int proid = product1.getProductid();
						int q1 = Productdao.GetTotalQTY(proid);
						if(q1 != 0)
						{
					%> 			
					<div class="single-product-action">
										
						<div class="product-add-to-cart">
							<div class="add" style="display: inline-block;">	
							<div class="in_stock">
										<h5 class="text-center font-weight-bold text-white">In Stock</h5>
								</div>																																		
							</div>
						</div>    
						                                                         
					</div>                        
					<%
							}
							else
							{
						%>
								<div class="out_stock">
									<h5 class="text-center font-weight-bold text-white">Out Of Stock</h5>
								</div>
						<%
							}	
						%>		                                
				</div>
			</div>
		</div>
	</div>
</div>
	<div class="single" >
			<div class="container">
				<div class="bootstrap-tab animated wow slideInUp" data-wow-delay=".5s" style="visibility: visible;animation-delay: 0.5s;animation-name: slideInUp;margin-top: 0px;">
						<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
							<ul id="myTab" class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Description</a></li>
								 
								<li role="presentation" class="dropdown">
									
								</li>
							</ul>
							<div id="myTabContent" class="tab-content">							
								<div role="tabpanel" class="tab-pane fade in active bootstrap-tab-text" id="home" aria-labelledby="home-tab">
									<h5>Product Brief Description</h5>
									<p style="white-space: pre-wrap"><%out.println(product1.getProductDescription()); %></p>
								</div>		
																
							<%
								}
							%>
							</div>
						</div>
					</div>
				</div>				
				<div class="clearfix"> </div>			
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