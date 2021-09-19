<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>    
<%@page import="DAO.Rentproddao" %>
<%@page import="bean.Rentprodbean" %>
<%@page import="bean.Productbean" %>
<%@page import="DAO.Productdao" %>
<!DOCTYPE html>
<html>
<link rel="Icon" type="image/jpg" href="resources/images/logo1.jpg">
<head>

<title>Rent Products</title>
<jsp:include page="script.jsp"></jsp:include>
  <!--font awsome---->
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
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
		background-color:#ff8c00; /*#ff8600    #ff7f50*/
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
</script>
<!-- //animation-effect -->
</head>
<body onload="preloader1()">
<div id="loading"></div>

<jsp:include page="header.jsp"></jsp:include>
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
				<li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Rent Product</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<div class="container mb-5">
	<div class="row mt-5">			
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="row p-2">
					<%
					Rentproddao rpd= new Rentproddao();
                    List<Rentprodbean> list = rpd.getallProduct();
           	       	for(Rentprodbean rent: list)
                  	   	{
              			%>						
				<div class="col-sm-6 col-md-6 col-lg-4">
						<div class="side animated wow slideInUp">
							<div class="img">
								<form method="post" action="<%=application.getContextPath()%>/RentProdController1" >
									<input type="hidden" name="productid" id="productid" value="<% out.println(rent.getRentProid());%>">									
									<button type="submit" name="action" value="rentquickview" class="btn btn-white">									
											<img src="../uploadimg/<%=rent.getRentProPhoto1() %>" width="100%" style="height:150px;" class="mt-2" alt="image">
									</button>												
							</div>
							<div class="name mt-2">
								<h4 class="font-weight-bold" style="color:#20b2aa ;"> <% out.println(rent.getRentProName());%></h4>
								<p class="pt-2" style="font-size: 14px; font-family: sans-serif; color: #2f4f4f;"> <% out.println(rent.getRentProductSpecification1());%></p>
							</div>
							<div class="mt-3 " style="color:#2f4f4f ; font-size: 20px;">
								<h3>&#8377; <% out.println(rent.getRentProductPrice());%>/Month</h3>
							</div>
							<div class="btn_div p-2">	
							<% 
							int proid = rent.getRentProid();
							int q = Rentproddao.GetTotalQTY(proid);
							if(q != 0)
							{
							%>								
								<form action="<%=application.getContextPath()%>/RentProdController1"  method="post">
	           	  				<input type="hidden" name="rentpid" id="rentpid" value="<% out.println(rent.getRentProid());%>">         	  
	   	       	  					<input type="hidden" name="rentqty" value="1" min="1" max="10">
	    	       	  				<input type="hidden" name="rentprice" value="<%=rent.getRentProductPrice() %>" >                             	  	
									<input type="submit" class="item_add btn btn-primary float-left" name="action" value="On Rent">
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
<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
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

