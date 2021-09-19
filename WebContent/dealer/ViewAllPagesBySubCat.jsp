<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>    
<%@page import="DAO.Productdao"%>
<%@page import="bean.Productbean" %>
<%@page import="bean.Dealerregisterbean" %>
<%@page import="DAO.DealerRegisterdao" %>
<%@page import="DAO.Wishlistdao" %>
<!DOCTYPE html>
<html>
<link rel="Icon" type="image/jpg" href="resources/images/logo1.jpg">
<head>
<title>Products</title>
<jsp:include page="script.jsp"></jsp:include>
<link href="resources/css/font-awesome.min.css" rel="stylesheet"> 
<link rel="stylesheet" href="resources/css/w3.css">
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
	.in_stock
	{
		width:100%;
		height:45px;
		position:absolute;
		bottom:12px;
		left:0px;
		background-color:green; /*#ff8600    #ff7f50*/
		padding-top:9px;
		top: 285px;
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
		height: 330px;
		padding: 8px;
		margin-bottom: 15px;
		margin-top: 10px;
	}
	.img
	{
		margin-left:auto;
		margin-right:auto;
		width:200px;
		height: 180px;
		border: 1px solid #d7d4d4;
		border-radius: 5px;
	}
	.name
	{
		height:40px;
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
</style>
<script>
 new WOW().init();
 <%
 Dealerregisterbean db = DealerRegisterdao.getDealerById((Integer) session.getAttribute("id"));
 int sid = Integer.parseInt(request.getParameter("sid"));
 %>
</script>
<!-- //animation-effect -->
</head>
	
<body onload="preloader1()">
<!-- https://loading.io/asset/371099 -->
<div id="loading"></div>


<!-- header -->

<jsp:include page="header2_dealer.jsp"></jsp:include>

<script>
$(document).ready(function() {
	$(".like").click(function(){
		$(this).toggleClass("heart");
	});
});
</script>

<!-- /header-->
<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index1_dealer.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Products</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<div class="container mb-5">
	<div class="row mt-5">			
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="row p-2">
				<%					            
              		List<Productbean> list = Productdao.getProductBySubCatID(sid);  
   	          		for(Productbean product: list)
       	      		{
           	  		%>					
				<div class="col-sm-6 col-md-6 col-lg-3">
						<div class="side animated wow slideInUp">
							<div class="img">							
								<form method="post" action="<%=application.getContextPath()%>/ProductController" >
								<input type="hidden" name="productid" id="productid" value="<% out.println(product.getProductid());%>">								
						  		<input type="hidden" name="maincatid" value="<%=product.getSubcatid()%>">
								<button type="hidden" type="submit" name="action" value="quickviewDealer" class="btnquickview">									
										<img src="../uploadimg/<%=product.getProductPhoto1() %>" width="100%" style="height:150px;" class="mt-2" alt="image">	
								</button>
								</form>	
							</div>
						<div class="name mt-2">
							<h4 class="font-weight-bold" style="color:#20b2aa ;"> <% out.println(product.getProductName());%></h4>
							<p class="pt-2" style="font-size: 14px; font-family: sans-serif; color: #2f4f4f;"> <% out.println(product.getProductSpecification1());%></p>
						</div>
						<div class="prc1">		
							<p class="float-left"  style="color:#2f4f4f ; font-size: 20px;">&#8377; <% out.println(product.getProductPrice());%></p>
						</div>		
						<div class="btn_div p-2">	
						<% 
							int proid = product.getProductid();
							int q = Productdao.GetTotalQTY(proid);
							if(q != 0)
							{
						%> 							
							<div class="in_stock">
									<h5 class="text-center font-weight-bold text-white">In Stock</h5>
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
				<%-- <div class="col-sm-6 col-md-6 col-lg-4">
						<div class="side animated wow slideInUp">
							<div class="img">							
								<form method="post" action="<%=application.getContextPath()%>/ProductController" >
								<input type="hidden" name="productid" id="productid" value="<% out.println(product.getProductid());%>">								
						  		<input type="hidden" name="maincatid" value="<%=product.getSubcatid()%>">
								<button type="hidden" type="submit" name="action" value="quickview" class="btnquickview without-shadow">
									<img src="../uploadimg/<%=product.getProductPhoto1() %>" width="100%" style="margin:0px;height:230px;" alt="image">	
								</button>
								</form>	
							</div>
							<div class="name mt-2">
								<h4 class="font-weight-bold" style="color:#20b2aa ;"> <% out.println(product.getProductName());%></h4>
								<p class="pt-2" style="font-size: 14px; font-family: sans-serif; color: #2f4f4f;"> <% out.println(product.getProductSpecification1());%></p>
							</div>
							<div class="prc1">		
								<p class="float-left"  style="color:#2f4f4f ; font-size: 20px;">&#8377; <% out.println(product.getProductPrice());%></p>
							</div>							
							<div class="btn_div p-2">																																						
									<% 
										int proid = product.getProductid();
										int q = Productdao.GetTotalQTY(proid);
										if(q != 0)
										{
									%> 
										<form action="<%=application.getContextPath()%>/Cartcontroller"  method="post">
           	  							<input type="hidden" name="pid" id="pid" value="<% out.println(product.getProductid());%>">         	  
	           	  						<input type="hidden" name="qty" value="1" min="1" max="50">                	  	
										<input type="submit" class="item_add btn btn-lg btn-primary float-left" name="action" value="Add to Cart">
										</form>	
										
										<form action="<%=application.getContextPath()%>/WishlistController" method="post">
											<input type="hidden" name="proid" id="proid" value="<% out.println(product.getProductid());%>">
											<button  type="submit" name="action" value="wishlist" class="btnwishlist float-right pt-2" onclick="wishlistFun()">
											<a class="like ">
												<i class="fa fa-heart" aria-hidden="true"  style="color:#337ab7 ! important;font-size: x-large;"></i>
											</a>
											</button>
										</form>									
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
					</div>		 --%>
			<%
	          	}
			%>					
			</div>
		</div>
	</div>
</div>
<!-- footer -->
	<jsp:include page="footer_dealer.jsp"></jsp:include>
<!-- //footer -->
<script type="text/javascript">
		jQuery(document).ready(function($) 	
				{
			$(document).on('click', '.main_cat', function(event) {
				
				var next=$(this).next().slideToggle('slow');

				$('.result_div').not(next).slideUp('slow');
			});
		});
	</script>
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