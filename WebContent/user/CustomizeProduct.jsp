<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>    
<%@page import="DAO.Custproddao" %>
<%@page import="bean.CustProdBean" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<title>Custom Product</title>
<jsp:include page="script.jsp"></jsp:include>
<link href="resources/css/font-awesome.min.css" rel="stylesheet"> 
<link rel="stylesheet" href="resources/css/w3.css">
<style type="text/css">
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
		width:200px;
		height: 180px;
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
  		height: 450px;
  		
  	}
  	.side_cat
  	{
  		box-shadow: 1px 1px 5px grey;
  		overflow-y: scroll;
  		height: 250px;
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
<script>
 new WOW().init();
</script>
<!-- //animation-effect -->

<script type="text/javascript">
			function refreshPage()
			{
				if(confirm("Are you sure, want to reset?"))
				{
					location.reload();
				}				
			}
		</script>
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
				<li class="active">Customize product</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<div class="container mb-5">
	<div class="row mt-5">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-3">
				<!-- <div  style="width: 160px;height: 35px;float: left;margin-top: 20px;margin-bottom: 20px;">
						<select>
							<option value="null">Sort By   </option>
							<option value="rlvn">Relavence</option>
							<option value="phigh">Price : high to low</option> 
							<option value="plow">Price : low to high</option>					
							<option value="rhigh">Ratings : high to low</option>
							<option value="rlow">Ratings : low to high</option>								
						</select>
				</div>  -->
				<div class="sidebar p-3">					
					<h2 class="text-success">Filters <i class="fa fa-filter float-right"></i></h2>
					<div class="side_cat mt-3">
						<!--------------->

						<div class="cat1 main_cat">
							<h5>Features<i class="fa fa-chevron-down float-right"></i></h5>
						</div>
						<div class="cat1_option result_div">
						<select class="form-control" id="Features_id" name="Features_id">
										<option disabled="" value="" selected="">Select Features</option>
										<option value="1">Processor</option>
										<option value="2">Motherboard</option>
										<option value="3">RAM</option>
										<option value="4">Storage</option>
										<option value="5">Graphics Card</option>
										<option value="6">Case</option>
							</select>
						</div>
						<!--------------->
					</div>
						<div class="form-group h6 mt-3 text-center">
							<button class="btn btn-danger" type="button" onclick='if(confirm("Do you want to Refresh ?")){ location.href="CustomizeProduct.jsp" }'>Reset Filter</button>
						</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-9">
				<div class="main">
				<div class="row p-2" id="gsk">
				<h3 class="text-center col-sm-12" style="font-weight: bold;">All Item 
				<button type="button" class="float-right btn btn-md" data-toggle="modal" data-target="#info_for_custom"><i class="fa fa-info-circle" style=" float:right;font-size:20px;color:red"></i></button><hr class="bg-primary">
				</h3>
				<%
    	       			Custproddao cd= new Custproddao();
                        List<CustProdBean> list = cd.getallProduct();
               	       	for(CustProdBean cust: list)
                   	   	{
               	%>	
					<div class="mb-3 col-sm-6 col-md-6 col-lg-4">
						<div class="side animated wow slideInUp">
							<div class="img">
								<form method="post" action="<%=application.getContextPath()%>/CustProdController" >
										<input type="hidden" name="productid" id="productid" value="<% out.println(cust.getCustproid());%>">
										<input type="hidden" name="maincatid" value="<%=cust.getCustmaincatid()%>">
										<button type="hidden" type="submit" name="action" value="customquickview" class="btn btn-white">									
											<img src="../uploadimg/<%=cust.getCustprophoto1() %>" width="100%" style="height:150px;" class="mt-2" alt="image">
										</button>
								</form>											
							</div>
							<div class="name mt-2">
								<h4 class="font-weight-bold" style="color:#20b2aa ;"> <% out.println(cust.getCustproname());%></h4>
								<p class="pt-2" style="font-size: 14px; font-family: sans-serif; color: #2f4f4f;"> <% out.println(cust.getCustprospecification());%></p>
							</div>
							<%-- <div class="prc1">		
								<p class="float-left"  style="color:#2f4f4f ; font-size: 20px;">&#8377; <% out.println(product.getProductPrice());%></p>
							</div>	 --%>
							<div class="mt-3 " style="color:#2f4f4f ; font-size: 20px;">
									<h3>&#8377; <% out.println(cust.getCustproprice());%></h3>
							</div>						
							<div class="btn_div p-2">																																						
									<%-- <%	 
										int proid = cust.getCustproid();
										int q = Custproddao.GetTotalQTY(proid);
										if(q != 0)
										{
									%> 	 --%>
									<form action="<%=application.getContextPath()%>/CustListController"  method="post">
			           	  				<input type="hidden" name="cpid" id="cpid" value="<% out.println(cust.getCustproid());%>">         	  
		    	       	  				<input type="hidden" name="qty" value="1" min="1" max="50">                	  	
										<input type="submit" class="item_add btn btn-primary float-left" name="action" value="Add to List">
									</form>
									<%-- <%
										}
										else
										{
									%>
											<div class="out_stock">
												<h5 class="text-center font-weight-bold text-white">Out Of Stock</h5>
											</div>
									<%
										}	
									%>			 --%>																
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
		</div>
		
<div id="info_for_custom" class="modal fade" role="dialog" style="margin-top:150px;">
	<div class="modal-dialog modal-md">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header mb-3 bg-danger">
				<h4 class="font-weight-bold" style="font-size:2vw ! important;">How to Build PC?</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>			
			<div class="modal-body">
				<label>Required Item for build PC</label><hr>
					<ol style="list-style-type: decimal;" class="ml-3" >
						<li>one Processor</li>
						<li>one Motherboard</li>
						<li>one RAM</li>
						<li>one HDD/SSD</li>
						<li>one Graphic Card</li>
						<li>one Case</li>					
					</ol>
		     </div>	
			 <div class="modal-footer">		        
		          <button data-dismiss="modal" class="btn btn-danger" type="button" name="#" href="#">OK</button>		          				
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

	$(document).ready(function () {
		$("#Features_id").on("change", function () {
             var Features_id = $("#Features_id").val();//id of country select box of index.jsp page;
                 $.ajax({
                     url: "filter_customize.jsp",//your jsp page name
                     data: {Features_id: Features_id},//sending request to state.jsp page.
                     method: "POST",//HTTP method.
                     success: function (data)
                     {
                         $("#gsk").html(data);//output or response will display in state select box.
                     }
                 });
		});
	});
</script>
</body>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>
</html>