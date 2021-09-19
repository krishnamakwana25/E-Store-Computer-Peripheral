<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>    
<%@page import="DAO.Productdao" %>
<%@page import="bean.Productbean" %>
<%@page import="bean.Userbean" %>
<%@page import="DAO.Userdao" %>
<%@page import="DAO.FilterDao" %>
   <%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="connection.Connect" %>
<!DOCTYPE html>
<html>
<head>
<link rel="Icon" type="image/jpg" href="resources/images/logo1.jpg">
<script type="text/javascript">
			function refreshPage()
			{
				if(confirm("Are you sure, want to reset?"))
				{
					location.reload();
				}				
			}
		</script>
<title>i9 Laptops</title>
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
				<li class="active">Laptop product</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<div class="container mb-5">
	<div class="row mt-5">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-3">
				
				<div class="sidebar p-3">					
					<h2 class="text-success">Filters <i class="fa fa-filter float-right"></i></h2>
					<div class="side_cat mt-3">
						<div class="cat1 main_cat">
							<h5>Brand <i class="fa fa-chevron-down float-right"></i></h5>
						</div>
						<div class="cat1_option result_div">
							
							<select class="form-control" id="company_id" name="company_id">
											<option disabled="" value="" selected="">Select Company</option>
			                            	   <%
			                            		   Connection con=Connect.sqlconnection();
			                                	    Statement st = con.createStatement();
			                                	    ResultSet rs = st.executeQuery("select * from subcategory_table where maincatid=1");
			                                  	  while (rs.next()) {
			                            	   %>
													  		                            	   		  		
			                              			  <option value="<%=rs.getInt("subcatid")%>"><%=rs.getString("subcatname")%></option>
			                              	  <%
			                                   	 }
			                              	  %>
                              		  </select>
							
							
						</div>
						<!--------------->

						<div class="cat2 main_cat">
							<h5>Processor <i class="fa fa-chevron-down float-right"></i></h5>
						</div>
						<div class="cat2_option result_div">
						<select class="form-control" id="processor_id" name="processor_id">
										<option disabled="" value="" selected="">Select Processor</option>
										<option value="i3">i3</option>
										<option value="i5">i5</option>
										<option value="i7">i7</option>
										<option value="i9">i9</option>
										<option value="AMD">AMD</option>
							</select>
						</div>
						<!--------------->

						<div class="cat3 main_cat">
							<h5>RAM <i class="fa fa-chevron-down float-right"></i></h5>
						</div>
						<div class="cat3_option result_div">
						<select class="form-control" id="ram_id" name="ram_id">
										<option disabled="" value="" selected="">Select RAM</option>
										<option value="4 GB">4 GB</option>
										<option value="8 GB">8 GB</option>
										<option value="16 GB">16 GB</option>
										<option value="32 GB">32 GB</option>
							</select>
							
						</div>
						<!--------------->

						<div class="cat4 main_cat">
							<h5>HDD <i class="fa fa-chevron-down float-right"></i></h5>
						</div>
						<div class="cat4_option result_div">
							<select class="form-control" id="HDD_id" name="HDD_id">
										<option disabled="" value="" selected="">Select Storage</option>
										<option value="500 GB HDD">500 GB</option>
										<option value="1 TB HDD">1 TB</option>
										<option value="2 TB HDD">2 TB</option>
							</select>
						</div>
						<!--------------->
						
						<div class="cat5 main_cat">
							<h5>SSD <i class="fa fa-chevron-down float-right"></i></h5>
						</div>
						<div class="cat5_option result_div">
							<select class="form-control" id="SSD_id" name="SSD_id">
										<option disabled="" value="" selected="">Select Storage</option>
										<option value="128 GB SSD">128 GB</option>
										<option value="256 GB SSD">256 GB</option>
										<option value="512 GB SSD">512 GB</option>
										<option value="1 TB SSD">1 TB </option>
										<option value="2 TB SSD">2 TB </option>
							</select>
						</div>
						<!--------------->

						<div class="cat6 main_cat">
							<h5>Graphics <i class="fa fa-chevron-down float-right"></i></h5>
						</div>
						<div class="cat6_option result_div">
							<select class="form-control" id="GC_id" name="GC_id">
										<option disabled="" value="" selected="">Select Graphics</option>
										<option value="2 GB">2 GB</option>
										<option value="4 GB">4 GB</option>
										<option value="6 GB">6 GB</option>
										<option value="8 GB">8 GB </option>
							</select>
						</div>
					</div>
					
					<!---price range---->
					<div class="mt-4">
						<div class="">
							<h5>Price</h5>
						</div>
						<div class="" style="display: visible">
							
							<input type="range" class="form-control-range custom-range">
							<p class="float-left">Rs. 200</p>
							<p class="float-right">Rs. 5000</p>
						</div>
						<!--------------->
					</div>
					
					<div class="mt-5">
						<p><input class="w-100 h-75" type="button" value="Reset" onclick='refreshPage()'/>
					</div>

				</div>
			</div>			
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-9">				
				<div class="row p-2" id="gsk">
					<%
   	       			Productdao pd= new Productdao();
                       List<Productbean> list = pd.getalli9Laptop();
              	       	for(Productbean product: list)
                  	   	{
              			%>						              			
					<div class="col-sm-6 col-md-6 col-lg-4">
						<div class="side animated wow slideInUp">
							<div class="img">
								<form method="post" action="<%=application.getContextPath()%>/ProductController" >
								<input type="hidden" name="maincatid" value="<%=product.getSubcatid()%>">
								<input type="hidden" name="productid" id="productid" value="<% out.println(product.getProductid());%>">
								<button type="hidden" type="submit" name="action" value="quickview" class="btnquickview">									
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
										int q = Productdao.GetTotalQTY(proid);
										if(q != 0)
										{
									%> 
										<form action="<%=application.getContextPath()%>/Cartcontroller"  method="post">
           	  							<input type="hidden" name="pid" id="pid" value="<% out.println(product.getProductid());%>">         	  
	           	  						<input type="hidden" name="qty" value="1" min="1" max="50">                	  	
										<input type="submit" class="item_add btn btn-primary float-left" name="action" value="Add to Cart">
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
    $(document).ready(function () {
        $("#company_id").on("change", function () {
            var company_id = $("#company_id").val();//id of country select box of index.jsp page;
                $.ajax({
                    url: "filter_brand.jsp",//your jsp page name
                    data: {company_id: company_id},//sending request to state.jsp page.
                    method: "POST",//HTTP method.
                    success: function (data)
                    {
                        $("#gsk").html(data);//output or response will display in state select box.
                    }
                });
                $("#processor_id").on("change", function () {
                    var processor_id = $("#processor_id").val();//id of country select box of index.jsp page;
                        $.ajax({
                            url: "filter_brand1.jsp",//your jsp page name
                            data: {company_id: company_id,processor_id: processor_id},//sending request to state.jsp page.
                            method: "POST",//HTTP method.
                            success: function (data)
                            {
                                $("#gsk").html(data);//output or response will display in state select box.
                            }
                        });
                        $("#ram_id").on("change", function () {
                            var ram_id = $("#ram_id").val();//id of country select box of index.jsp page;
                                $.ajax({
                                    url: "filter_brand2.jsp",//your jsp page name
                                    data: {company_id: company_id,processor_id: processor_id,ram_id: ram_id},//sending request to state.jsp page.
                                    method: "POST",//HTTP method.
                                    success: function (data)
                                    {
                                        $("#gsk").html(data);//output or response will display in state select box.
                                    }
                                });
                                $("#HDD_id").on("change", function () {
                                    var HDD_id = $("#HDD_id").val();//id of country select box of index.jsp page;
                                        $.ajax({
                                            url: "filter_brand3.jsp",//your jsp page name
                                            data: {company_id: company_id,processor_id: processor_id,ram_id: ram_id,HDD_id: HDD_id},//sending request to state.jsp page.
                                            method: "POST",//HTTP method.
                                            success: function (data)
                                            {
                                                $("#gsk").html(data);//output or response will display in state select box.
                                            }
                                        });
                                        $("#GC_id").on("change", function () {
                                            var GC_id = $("#GC_id").val();//id of country select box of index.jsp page;
                                                $.ajax({
                                                    url: "filter_brand5.jsp",//your jsp page name
                                                    data: {company_id: company_id,processor_id: processor_id,ram_id: ram_id,HDD_id: HDD_id,GC_id: GC_id},//sending request to state.jsp page.
                                                    method: "POST",//HTTP method.
                                                    success: function (data)
                                                    {
                                                        $("#gsk").html(data);//output or response will display in state select box.
                                                    }
                                                });
                                        });
                                });
                                $("#SSD_id").on("change", function () {
                                    var SSD_id = $("#SSD_id").val();//id of country select box of index.jsp page;
                                        $.ajax({
                                            url: "filter_brand4.jsp",//your jsp page name
                                            data: {company_id: company_id,processor_id: processor_id,ram_id: ram_id,SSD_id: SSD_id},//sending request to state.jsp page.
                                            method: "POST",//HTTP method.
                                            success: function (data)
                                            {
                                                $("#gsk").html(data);//output or response will display in state select box.
                                            }
                                        });
                                        $("#GC_id").on("change", function () {
                                            var GC_id = $("#GC_id").val();//id of country select box of index.jsp page;
                                                $.ajax({
                                                    url: "filter_brand5.jsp",//your jsp page name
                                                    data: {company_id: company_id,processor_id: processor_id,ram_id: ram_id,SSD_id: SSD_id,GC_id: GC_id},//sending request to state.jsp page.
                                                    method: "POST",//HTTP method.
                                                    success: function (data)
                                                    {
                                                        $("#gsk").html(data);//output or response will display in state select box.
                                                    }
                                                });
                                        });
                                });
                                $("#GC_id").on("change", function () {
                                    var GC_id = $("#GC_id").val();//id of country select box of index.jsp page;
                                        $.ajax({
                                            url: "filter_brand6.jsp",//your jsp page name
                                            data: {company_id: company_id,processor_id: processor_id,ram_id: ram_id,HDD_id: HDD_id,SSD_id: SSD_id,GC_id: GC_id},//sending request to state.jsp page.
                                            method: "POST",//HTTP method.
                                            success: function (data)
                                            {
                                                $("#gsk").html(data);//output or response will display in state select box.
                                            }
                                        });
                                });
                        });
                });
        });        
    });
</script>

<script>
	$(document).ready(function () {
		$("#processor_id").on("change", function () {
             var processor_id = $("#processor_id").val();//id of country select box of index.jsp page;
                 $.ajax({
                     url: "filter_processor.jsp",//your jsp page name
                     data: {processor_id: processor_id},//sending request to state.jsp page.
                     method: "POST",//HTTP method.
                     success: function (data)
                     {
                         $("#gsk").html(data);//output or response will display in state select box.
                     }
                 });
                 $("#company_id").on("change", function () {
            	 	 var company_id = $("#company_id").val();//id of country select box of index.jsp page;
                	 	 $.ajax({
                    	 	 url: "filter_processor1.jsp",//your jsp page name
                     	 	 data: {processor_id: processor_id,company_id: company_id},//sending request to state.jsp page.
                     	 	 method: "POST",//HTTP method.
                     	 	 success: function (data)
                     	 	 {
                         	 	 $("#gsk").html(data);//output or response will display in state select box.
                     	 	 }
                 	 	 });
                	 	$("#ram_id").on("change", function () {
                            var ram_id = $("#ram_id").val();//id of country select box of index.jsp page;
                                $.ajax({
                                    url: "filter_processor2.jsp",//your jsp page name
                                    data: {processor_id: processor_id,company_id: company_id,ram_id: ram_id},//sending request to state.jsp page.
                                    method: "POST",//HTTP method.
                                    success: function (data)
                                    {
                                        $("#gsk").html(data);//output or response will display in state select box.
                                    }
                                });
                                $("#HDD_id").on("change", function () {
                                    var HDD_id = $("#HDD_id").val();//id of country select box of index.jsp page;
                                        $.ajax({
                                            url: "filter_processor3.jsp",//your jsp page name
                                            data: {processor_id: processor_id,company_id: company_id,ram_id: ram_id,HDD_id: HDD_id},//sending request to state.jsp page.
                                            method: "POST",//HTTP method.
                                            success: function (data)
                                            {
                                                $("#gsk").html(data);//output or response will display in state select box.
                                            }
                                        });
                                        $("#GC_id").on("change", function () {
                                            var GC_id = $("#GC_id").val();//id of country select box of index.jsp page;
                                                $.ajax({
                                                    url: "filter_processor4.jsp",//your jsp page name
                                                    data: {processor_id: processor_id,company_id: company_id,ram_id: ram_id,HDD_id: HDD_id,GC_id: GC_id},//sending request to state.jsp page.
                                                    method: "POST",//HTTP method.
                                                    success: function (data)
                                                    {
                                                        $("#gsk").html(data);//output or response will display in state select box.
                                                    }
                                                });
                                        });
                        	 	});
                                $("#SSD_id").on("change", function () {
                                    var SSD_id = $("#SSD_id").val();//id of country select box of index.jsp page;
                                        $.ajax({
                                            url: "filter_processor5.jsp",//your jsp page name
                                            data: {processor_id: processor_id,company_id: company_id,ram_id: ram_id,HDD_id: HDD_id,SSD_id: SSD_id},//sending request to state.jsp page.
                                            method: "POST",//HTTP method.
                                            success: function (data)
                                            {
                                                $("#gsk").html(data);//output or response will display in state select box.
                                            }
                                        });
                                        $("#GC_id").on("change", function () {
                                            var GC_id = $("#GC_id").val();//id of country select box of index.jsp page;
                                                $.ajax({
                                                    url: "filter_processor4.jsp",//your jsp page name
                                                    data: {processor_id: processor_id,company_id: company_id,ram_id: ram_id,SSD_id: SSD_id,GC_id: GC_id},//sending request to state.jsp page.
                                                    method: "POST",//HTTP method.
                                                    success: function (data)
                                                    {
                                                        $("#gsk").html(data);//output or response will display in state select box.
                                                    }
                                                });
                                        });
                        	 	});
                	 	});
                 });
		});
	});
</script>

<script>
	$(document).ready(function () {
		$("#ram_id").on("change", function () {
             var ram_id = $("#ram_id").val();//id of country select box of index.jsp page;
                 $.ajax({
                     url: "filter_ram.jsp",//your jsp page name
                     data: {ram_id: ram_id},//sending request to state.jsp page.
                     method: "POST",//HTTP method.
                     success: function (data)
                     {
                         $("#gsk").html(data);//output or response will display in state select box.
                     }
                 });
                 $("#company_id").on("change", function () {
            	 	 var company_id = $("#company_id").val();//id of country select box of index.jsp page;
                	 	 $.ajax({
                    	 	 url: "filter_ram1.jsp",//your jsp page name
                     	 	 data: {ram_id: ram_id,company_id: company_id},//sending request to state.jsp page.
                     	 	 method: "POST",//HTTP method.
                     	 	 success: function (data)
                     	 	 {
                         	 	 $("#gsk").html(data);//output or response will display in state select box.
                     	 	 }
                 	 	 });
                	 	$("#processor_id").on("change", function () {
                            var processor_id = $("#processor_id").val();//id of country select box of index.jsp page;
                                $.ajax({
                                    url: "filter_ram2.jsp",//your jsp page name
                                    data: {ram_id: ram_id,company_id: company_id,processor_id: processor_id},//sending request to state.jsp page.
                                    method: "POST",//HTTP method.
                                    success: function (data)
                                    {
                                        $("#gsk").html(data);//output or response will display in state select box.
                                    }
                                });
                                $("#HDD_id").on("change", function () {
                                    var HDD_id = $("#HDD_id").val();//id of country select box of index.jsp page;
                                        $.ajax({
                                            url: "filter_ram3.jsp",//your jsp page name
                                            data: {ram_id: ram_id,company_id: company_id,processor_id: processor_id,HDD_id: HDD_id},//sending request to state.jsp page.
                                            method: "POST",//HTTP method.
                                            success: function (data)
                                            {
                                                $("#gsk").html(data);//output or response will display in state select box.
                                            }
                                        });
                                        $("#GC_id").on("change", function () {
                                            var GC_id = $("#GC_id").val();//id of country select box of index.jsp page;
                                                $.ajax({
                                                    url: "filter_ram4.jsp",//your jsp page name
                                                    data: {ram_id: ram_id,company_id: company_id,processor_id: processor_id,HDD_id: HDD_id,GC_id: GC_id},//sending request to state.jsp page.
                                                    method: "POST",//HTTP method.
                                                    success: function (data)
                                                    {
                                                        $("#gsk").html(data);//output or response will display in state select box.
                                                    }
                                                });
                                        });
                        	 	});
                                $("#SSD_id").on("change", function () {
                                    var SSD_id = $("#SSD_id").val();//id of country select box of index.jsp page;
                                        $.ajax({
                                            url: "filter_ram5.jsp",//your jsp page name
                                            data: {ram_id: ram_id,company_id: company_id,processor_id: processor_id,SSD_id: SSD_id},//sending request to state.jsp page.
                                            method: "POST",//HTTP method.
                                            success: function (data)
                                            {
                                                $("#gsk").html(data);//output or response will display in state select box.
                                            }
                                        });
                                        $("#GC_id").on("change", function () {
                                            var GC_id = $("#GC_id").val();//id of country select box of index.jsp page;
                                                $.ajax({
                                                    url: "filter_ram4.jsp",//your jsp page name
                                                    data: {ram_id: ram_id,company_id: company_id,processor_id: processor_id,SSD_id: SSD_id,GC_id: GC_id},//sending request to state.jsp page.
                                                    method: "POST",//HTTP method.
                                                    success: function (data)
                                                    {
                                                        $("#gsk").html(data);//output or response will display in state select box.
                                                    }
                                                });
                                        });
                                });
                	 	});
                 });
		});
	});
</script>


<script>
	$(document).ready(function () {
		$("#HDD_id").on("change", function () {
             var HDD_id = $("#HDD_id").val();//id of country select box of index.jsp page;
                 $.ajax({
                     url: "filter_hdd.jsp",//your jsp page name
                     data: {HDD_id: HDD_id},//sending request to state.jsp page.
                     method: "POST",//HTTP method.
                     success: function (data)
                     {
                         $("#gsk").html(data);//output or response will display in state select box.
                     }
                 });
                 $("#company_id").on("change", function () {
                     var company_id = $("#company_id").val();//id of country select box of index.jsp page;
                         $.ajax({
                             url: "filter_hdd1.jsp",//your jsp page name
                             data: {HDD_id: HDD_id,company_id: company_id},//sending request to state.jsp page.
                             method: "POST",//HTTP method.
                             success: function (data)
                             {
                                 $("#gsk").html(data);//output or response will display in state select box.
                             }
                         });
                         $("#processor_id").on("change", function () {
                             var processor_id = $("#processor_id").val();//id of country select box of index.jsp page;
                                 $.ajax({
                                     url: "filter_hdd2.jsp",//your jsp page name
                                     data: {HDD_id: HDD_id,company_id: company_id,processor_id: processor_id},//sending request to state.jsp page.
                                     method: "POST",//HTTP method.
                                     success: function (data)
                                     {
                                         $("#gsk").html(data);//output or response will display in state select box.
                                     }
                                 });
                                 $("#ram_id").on("change", function () {
                                     var ram_id = $("#ram_id").val();//id of country select box of index.jsp page;
                                         $.ajax({
                                             url: "filter_hdd3.jsp",//your jsp page name
                                             data: {HDD_id: HDD_id,company_id: company_id,processor_id: processor_id,ram_id: ram_id},//sending request to state.jsp page.
                                             method: "POST",//HTTP method.
                                             success: function (data)
                                             {
                                                 $("#gsk").html(data);//output or response will display in state select box.
                                             }
                                         });
                                 });
                		});
        		});
		});
	});
</script>
<script>
	$(document).ready(function () {
		$("#SSD_id").on("change", function () {
             var SSD_id = $("#SSD_id").val();//id of country select box of index.jsp page;
                 $.ajax({
                     url: "filter_ssd.jsp",//your jsp page name
                     data: {SSD_id: SSD_id},//sending request to state.jsp page.
                     method: "POST",//HTTP method.
                     success: function (data)
                     {
                         $("#gsk").html(data);//output or response will display in state select box.
                     }
                 });
		});
	});
</script>
<script>
	$(document).ready(function () {
		$("#GC_id").on("change", function () {
             var GC_id = $("#GC_id").val();//id of country select box of index.jsp page;
                 $.ajax({
                     url: "filter_graphics.jsp",//your jsp page name
                     data: {GC_id: GC_id},//sending request to state.jsp page.
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