<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Productbean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Productdao" %>
<%@page import="bean.Userbean" %>
<%@page import="DAO.Userdao" %>
<!DOCTYPE html>
<link rel="Icon" type="image/jpg" href="resources/images/logo1.jpg">
<html>
<head>
<jsp:include page="script.jsp"></jsp:include>
<%
Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
String name = request.getParameter("productname1");
 %>
<!-- for-mobile-apps -->
<link href="resources/css/font-awesome.min.css" rel="stylesheet"> 
<link rel="stylesheet" href="resources/css/w3.css">
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
.out_stock
	{
		width:100%;
		height:45px;
		position:absolute;
		bottom:12px;
		left:0px;
		background-color:#ff8c00;
		padding-top:9px;
	}
	.side
	{
		box-shadow: 1px 1px 6px grey;
		height: 350px;
		padding: 8px;
		margin-bottom: 15px;
		margin-top: 10px;
	}
	.img
	{
		margin-left:auto;
		margin-right:auto;
		width:220px;
		border: 1px solid #d7d4d4;
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
</script>
<!-- //animation-effect -->
</head>
<body onload="preloader1()">
<div id="loading"></div>

<jsp:include page="header1_user.jsp"></jsp:include>
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
				<li><a href="index1_user.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Search product</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<div class="container mb-5">
	<div class="row ">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="row p-2">
						<h3 class="text-center col-sm-12 " style="font-size: 20px;">Your Search result<hr class="bg-primary"></h3>
					 	<%
					 	int cnt = Productdao.getAllSearch(name);
					 	if(cnt != 0)
					 	{
	                  		Productdao pd= new Productdao();
	   	              		List<Productbean> list = pd.SearchProduct(name);  /* ,subcat1,maincat1 */
	       	          		for(Productbean product: list)
	           	      		{
	               	  		%>			
	               	  		<title>E-Store : <% out.println(name);%></title>		
								<div class="col-sm-6 col-md-6 col-lg-3">
									<div class="side animated wow slideInUp">
											
										<div class="img">
											<form method="post" action="<%=application.getContextPath()%>/ProductController" >
												<input type="hidden" name="maincatid" value="<% out.println(product.getMaincatid());%>">
												<input type="hidden" name="productid" id="productid" value="<% out.println(product.getProductid());%>">									
												<button type="submit" name="action" value="quickviewByUserId" class="btn btn-white">									
													<img src="../uploadimg/<%=product.getProductPhoto1() %>" width="100%" style="height:150px;" class="mt-2" alt="image">
												</button>
											</form>	
										</div>
										<div class="name mt-2">
											<h4 class="font-weight-bold" style="color:#20b2aa ;"> <% out.println(product.getProductName());%></h4>
											<p class="pt-2" style="font-size: 14px; font-family: sans-serif; color: #2f4f4f;"> <% out.println(product.getProductSpecification1());%></p>
										</div>
										<div class="mt-3 " style="color:#2f4f4f ; font-size: 20px;">
											<h3>&#8377; <% out.println(product.getProductPrice());%></h3>
										</div>
									<div class="btn_div p-2">	
									<% 
											int proid = product.getProductid();
											int q1 = Productdao.GetTotalQTY(proid);									
											if(q1 != 0)
											{
									%> 							
										<form action="<%=application.getContextPath()%>/Cartcontroller"  method="post">
	           	  							<input type="hidden" name="pid" id="pid" value="<% out.println(product.getProductid());%>">         	  
    	       	  							<input type="hidden" name="qty" value="1" min="1" max="50">                	  	
											<input type="submit" class="item_add btn btn-primary float-left" name="action" value="Add to Cart">
										</form>
								
										<form action="<%=application.getContextPath()%>/WishlistController" method="post">
 											<input type="hidden" name="proid" id="proid" value="<% out.println(product.getProductid());%>">
											<button  type="submit" name="action" value="wishlist" class="btnwishlist float-right pt-1" >
												<a class="like ">
													<i class="fa fa-heart  " aria-hidden="true"style="color:#337ab7 ! important;font-size: x-large;"></i>
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
							</div>	
						<%
                   	   		}
					 	}
					 	else
					 	{
					 	%>	
					 		<title>E-Store : <% out.println("Product Not Found");%></title>
					 		<!-- <div class="out_stock mt-5">
								<h5 class="text-center font-weight-bold " style="color:black ! important;">Product not found</h5>					
							</div> -->
							<div>
								<img alt="" src="resources/images/prod_not_found.png">
							</div>	
					 	<%
					 	}
						%>					
					</div>
			</div>
		</div>
</div>
<!-- footer -->
	<jsp:include page="footer_user.jsp"></jsp:include>
<!-- //footer -->
<script type="text/javascript">
		jQuery(document).ready(function($) {

			$(document).on('click', '.main_cat', function(event) {
				
				var next=$(this).next().slideToggle('slow');

				$('.result_div').not(next).slideUp('slow');


			});

			
			
		});
	</script>
	<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>
	
</body>
</html>

