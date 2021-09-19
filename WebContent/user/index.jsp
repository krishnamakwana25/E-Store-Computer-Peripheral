<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Productbean" %>
<%@page import="bean.Userbean" %>
<%@page import="DAO.Userdao" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Productdao" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<title>Online Shopping site in India : Laptop,CCTV,Printer...</title>
<jsp:include page="script.jsp"></jsp:include>
<link href="resources/css/single_css.css" rel="stylesheet" type="text/css" media="all" />
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Best Store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!-- //animation-effect -->
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
	
.out_stock1
{
	width:30%;
	height:45px;
	position:absolute;
	bottom:12px;
	left:0px;
	background-color:#ff8c00; 
	padding-top:9px;
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
h4.col_a
{
	max-width:400px; 
	max-height:200px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}	
	.side
		{
			box-shadow: 1px 1px 6px grey;
			height: 430px;
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
	.img1
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
</style>
</head>	
<script type="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<body onload="preloader1()">
<div id="loading"></div>
<!-- header -->
<jsp:include page="header.jsp"></jsp:include>
<script>
$(document).ready(function() {
	$(".like").click(function(){
		$(this).toggleClass("heart");
	});
});
</script>
<!-- //header -->	
	<jsp:include page="slider1.jsp"></jsp:include>
<!-- banner-bottom -->
	<div class="banner-bottom">
		<div class="container"> 
			<div class="banner-bottom-grids">
				<a href="getAllLaptop.jsp">
				<div class="banner-bottom-grid-left animated wow slideInLeft" data-wow-delay=".5s">
					<div class="grid">
						<figure class="effect-julia">
							<img src="resources/images/laptops_1.jpg" alt=" " class="img-responsive showimg1" />
							<figcaption>
								<h3>Best <span>Laptop</span><i> </i></h3>
								<div>
									
									<p>Best Ever Performance</p>
									<p>Best New Design</p>
									<p>Best Processor</p>
								</div>
							</figcaption>			
						</figure>
					</div>
				</div>
				</a>
				
				<div class="banner-bottom-grid-left1 animated wow slideInUp" data-wow-delay=".5s">
				<a href="getAllMouseKeyboards.jsp">
					<div class="banner-bottom-grid-left-grid left1-grid grid-left-grid1">
						<div class="banner-bottom-grid-left-grid1">
							<img src="resources/images/KM_combo.jpg" alt=" " class="img-responsive showimg2" />
						</div>
						<div class="banner-bottom-grid-left1-pos">
							<p>Keyboard & Mouse</p>
						</div>
					</div>
				</a>
				<a href="getAllCameras.jsp">
					<div class="banner-bottom-grid-left-grid left1-grid grid-left-grid1 img1_menu">
						<div class="banner-bottom-grid-left-grid1 img1_menu">
							<img src="resources/images/CCTV.jpg" alt=" " class="img-responsive showimg2" style="margin-top: 11px;" />
						</div>
						<div class="banner-bottom-grid-left1-pos" style="top: 5px;">
							<p style="color:orange;">CCTV Camera</p>
						</div>
					</div>
				</a>
				</div>
				
				<a href="getAllPrinter.jsp">
				<div class="banner-bottom-grid-right animated wow slideInRight" data-wow-delay=".5s">
					<div class="banner-bottom-grid-left-grid grid-left-grid1">
						<div class="banner-bottom-grid-left-grid1">
							<img src="resources/images/Printer1.jpg" alt=" " class="img-responsive showimg1" />
						</div>
						<div class="grid-left-grid1-pos" style="bottom: 33%;">
							<p style="color:orange ;">Home Printer</span></p>
						</div>
					</div>
				</div>
				</a>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
<!-- //banner-bottom -->
<!-- collections -->
	<div class="new-collections">
		<div class="container">
			<h3 class="anyimated wow zoomIn" data-wow-delay=".5s">New Collections</h3>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="row p-2">
				<%
                 		Productdao pd= new Productdao();
  	              		List<Productbean> list = pd.getSixProduct();
      	          		for(Productbean product: list)
          	      		{
                 %>
					<div class="col-sm-6 col-md-6 col-lg-4">
						<div class="side animated wow slideInUp">
							<div class="img">							
								<form method="post" action="<%=application.getContextPath()%>/ProductController" >
									<input type="hidden" name="productid" id="productid" value="<% out.println(product.getProductid());%>">								
							  		<input type="hidden" name="subcatname" value="<%=product.getSubcatname()%>">
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
					</div>		
					<%
					}
					%>		
				</div>
			</div>			
		</div>
	</div>
<!-- //collections -->
<script>
function myFunction(smallImg)
{
	var fullImg = document.getElementById("imageBox");
	fullImg.src = smallImg.src;
}
</script>
		
<div class="timer mb-3">
	<div class="container">			
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class = "row">
			<%
				Productdao pd1= new Productdao();
				List<Productbean> list1 = pd1.getHighValProduct();
				for(Productbean product1: list1)
				{
		 %>
			<div class="col-sm-6 col-md-6 col-lg-8">
				<div class="row">
					<h3  class="float-clear font-weight-bold" style="color:#20b2aa ;font-size: 40px;"><% out.println(product1.getProductName());%></h3><br><br>
				</div>
				<div class="row">
					<p><span class="item_price" style="font-size:25px ;">&#8377; <% out.println(product1.getProductPrice());%></span></p>
				</div>
				<div class="row mt-1">			
					<h4 style="height: 50px;font-size:18px ;""><% out.println(product1.getProductSpecification1());%></h4>
								
				</div>
				<div class="row" >
					<div class="col-sm-3 col-md-3 col-lg-3">
						<img src="../uploadimg/<%=product1.getProductPhoto2() %>" alt=" " class="img img-responsive" style="border: 1px solid #c0c0c0;height: 115px !important" onclick="myFunction(this)" />
					</div>
					<div class="col-sm-3 col-md-3 col-lg-3">
						<img src="../uploadimg/<%=product1.getProductPhoto3() %>" alt=" " class="img img-responsive" style="border: 1px solid #c0c0c0;height: 115px !important" onclick="myFunction(this)"/>
					</div>
					<div class="col-sm-3 col-md-3 col-lg-3">
						<img src="../uploadimg/<%=product1.getProductPhoto4() %>" alt=" " class="img img-responsive" style="border: 1px solid #c0c0c0;height: 115px !important" onclick="myFunction(this)" />
					</div>
					<div class="col-sm-3 col-md-3 col-lg-3">
						<img src="../uploadimg/<%=product1.getProductPhoto1() %>" alt=" " class="img img-responsive" style="border: 1px solid #c0c0c0;height: 115px !important" onclick="myFunction(this)" />
					</div>
				</div>
				<div class="row mt-2">
				<% 
					int proid = product1.getProductid();
					int q = Productdao.GetTotalQTY(proid);
					if(q != 0)
					{
				%> 				
					<form action="<%=application.getContextPath()%>/Cartcontroller"  method="post" style="float: left;width: 135px;" >
						<input type="hidden" name="pid" id="p_id" value="<% out.println(product1.getProductid());%>">
						<input type="hidden" name="qty" value="1">     						
						<input type="submit" class="item_add btn btn-lg btn-primary" name="action" value="Add to Cart">				
					 </form>
					 <form action="<%=application.getContextPath()%>/WishlistController" method="post" style="padding-top: 8px;padding-left: 10px;float: left;">
						<input type="hidden" name="proid" id="proid" value="<% out.println(product1.getProductid());%>">
						<button type="hidden" type="submit" name="action" value="wishlist" class="btnwishlist" onclick="wishlistFun()">
						<a class="like">
							<i class="fa fa-heart w3-xlarge" aria-hidden="true" style="color:#337ab7 ! important;font-size: x-large;"></i>
						</a>
						</button>
					</form>	
					<%
						}
						else
						{
					%>
							<div class="out_stock1">
								<h5 class="text-center font-weight-bold text-white">Out Of Stock</h5>
							</div>
					<%
						}	
					%>		
				</div>
			</div>
		 
			<div class="col-sm-6 col-md-6 col-lg-4">
				<div class="timer-grid-right1" style="height:300px !important;">
					<img id="imageBox" src="../uploadimg/<%=product1.getProductPhoto1() %>" alt=" " class="img img-responsive p-2" width="100%" style="border:2px solid #c0c0c0;height:300px !important;"/>
					<div class="timer-grid-right-pos">
						<h4>Special Offer</h4>
					</div>
				</div>
				</div>	
				<%
				}
				%>
			</div>
		</div>
	</div>
</div>
<!-- //new-timer -->
<!-- collections-bottom -->
<div class="collections-bottom" style="padding-top: 0px;">	
	<div class=" container">
		<a href="CustomizeProduct.jsp">
		<!-- <div class="img-responsive " style="background-image: url('resources/images/custom.jpg');background-repeat: no-repeat;"> -->			
		<img class="img-responsive w-100 h-100" src="resources/images/custom.jpg" ></img>
		</div>
		</a>
	</div>
</div>
<!-- //collections-bottom -->
<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>
<!-- //footer -->
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

</body>
</html>