<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>    
<%@page import="DAO.Productdao" %>
<%@page import="DAO.FilterDao" %>
<%@page import="bean.Productbean" %>
 <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.Connect" %>
<%@page import="java.sql.*"%>
<%
	Connection conn = Connect.sqlconnection();
	PreparedStatement psmt = null;
	ResultSet rs = null;
	String query = null, query1 = null, brand = "", ram = "", processor = "", graphics = "", hdd = "", ssd = "", feature = "";
	if(request.getParameter("brand") != null){
		brand = request.getParameter("brand");
		query1 = "subcatid = "+brand;
	}
	if(request.getParameter("processor") != null){
		processor = request.getParameter("processor");
		if(query1 != null)
			query1 += " AND processor='"+processor+"'";
		else
			query1 = "processor='"+processor+"'";
	}
	if(request.getParameter("ram") != null){
		ram = request.getParameter("ram");
		if(query1 != null)
			query1 += " AND ram='"+ram+"'";
		else
			query1 = "ram='"+ram+"'";
	}
	if(request.getParameter("hdd") != null){
		hdd = request.getParameter("hdd");
		if(query1 != null)
			query1 += " AND hdd='"+hdd+"'";
		else
			query1 = "hdd='"+hdd+"'";
	}
	if(request.getParameter("ssd") != null){
		ssd = request.getParameter("ssd");
		if(query1 != null)
			query1 += " AND ssd='"+ssd+"'";
		else
			query1 = "ssd='"+ssd+"'";	
	}
	if(request.getParameter("graphics") != null){
		graphics = request.getParameter("graphics");
		if(query1 != null)
			query1 += " AND graphicscard='"+graphics+"'";
		else
			query1 = "graphicscard='"+graphics+"'";	
	}
	else if(query1 != null)
		query = "select * from product_table where isActive=1 AND maincatid = 1 AND "+query1;
	else
		query = "select * from product_table where isActive=1 AND maincatid = 1";
	//out.print(query);
%>	

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
			function refreshPage()
			{
				if(confirm("Are you sure, want to reset?"))
				{
					location.reload();
				}				
			}
		</script>
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<title>Laptops</title>
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
  		height: 600px;
  		
  	}
  	.side_cat
  	{
  		box-shadow: 1px 1px 5px grey;
  		overflow-y: scroll;
  		height: 350px;
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
	 .out_stock
{
	width:100%;
	height:45px;
	position:absolute;
	bottom:12px;
	left:0px;
	background-color:#ff8c00; /#ff8600    #ff7f50/
	padding-top:9px;
	opacity: 70%;
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
	url('resources/images/preloader.gif')
	 no-repeat center center;	
	z-index: 99999;
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
					<form>				
					<h2 class="text-success">Filters <i class="fa fa-filter float-right"></i></h2>
					<div class="side_cat mt-3">
						<div class="cat1 main_cat">
							<h5>Brand <i class="fa fa-chevron-down float-right"></i></h5>
						</div>
						<div class="cat1_option result_div">
							
							<% psmt = conn.prepareStatement("select subcatid,subcatname from subcategory_table where maincatid=1");
											rs = psmt.executeQuery();
											while(rs.next()){ %>
												<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(brand.equals(rs.getString("subcatid"))) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="brand" value="<%=rs.getString("subcatid") %>"><%=rs.getString("subcatname") %></label></div>
											<% } %>
							
							<%-- <select class="form-control" id="company_id" name="company_id">
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
                              		  </select> --%>
							
							
						</div>
						<!--------------->

						<div class="cat2 main_cat">
							<h5>Processor <i class="fa fa-chevron-down float-right"></i></h5>
						</div>
						<div class="cat2_option result_div">
						
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(processor.equals("i3")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="processor" value="i3">i3</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(processor.equals("i5")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="processor" value="i5">i5</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(processor.equals("i7")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="processor" value="i7">i7</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(processor.equals("i9")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="processor" value="i9">i9</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(processor.equals("AMD")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="processor" value="AMD">AMD</label></div>
						
						<!-- <select class="form-control" id="processor_id" name="processor_id">
										<option disabled="" value="" selected="">Select Processor</option>
										<option value="i3">i3</option>
										<option value="i5">i5</option>
										<option value="i7">i7</option>
										<option value="i9">i9</option>
										<option value="AMD">AMD</option>
							</select> -->
						</div>
						<!--------------->

						<div class="cat3 main_cat">
							<h5>RAM <i class="fa fa-chevron-down float-right"></i></h5>
						</div>
						<div class="cat3_option result_div">
						
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(ram.equals("4 GB")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="ram" value="4 GB">4 GB</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(ram.equals("8 GB")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="ram" value="8 GB">8 GB</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(ram.equals("16 GB")) out.print("checked"); %>onclick="form.submit()" class="form-check-input" name="ram" value="16 GB">16 GB</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(ram.equals("32 GB")) out.print("checked"); %>onclick="form.submit()" class="form-check-input" name="ram" value="32 GB">32 GB</label></div>
						
						<!-- <select class="form-control" id="ram_id" name="ram_id">
										<option disabled="" value="" selected="">Select RAM</option>
										<option value="4 GB">4 GB</option>
										<option value="8 GB">8 GB</option>
										<option value="16 GB">16 GB</option>
										<option value="32 GB">32 GB</option>
							</select> -->
							
						</div>
						<!--------------->

						<div class="cat4 main_cat">
							<h5>HDD <i class="fa fa-chevron-down float-right"></i></h5>
						</div>
						<div class="cat4_option result_div">
						
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(hdd.equals("500 GB HDD")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="hdd" value="500 GB HDD">500 GB HDD</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(hdd.equals("1 TB HDD")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="hdd" value="1 TB HDD">1 TB HDD</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(hdd.equals("2 TB HDD")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="hdd" value="2 TB HDD">2 TB HDD</label></div>
						
						<!-- 	<select class="form-control" id="HDD_id" name="HDD_id">
										<option disabled="" value="" selected="">Select Storage</option>
										<option value="500 GB HDD">500 GB</option>
										<option value="1 TB HDD">1 TB</option>
										<option value="2 TB HDD">2 TB</option>
							</select> -->
						</div>
						<!--------------->
						
						<div class="cat5 main_cat">
							<h5>SSD <i class="fa fa-chevron-down float-right"></i></h5>
						</div>
						<div class="cat5_option result_div">
						
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(ssd.equals("128 GB SSD")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="ssd" value="128 GB SSD">128 GB SSD</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(ssd.equals("256 GB SSD")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="ssd" value="256 GB SSD">256 GB SSD</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(ssd.equals("512 GB SSD")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="ssd" value="512 GB SSD">512 GB SSD</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(ssd.equals("1 TB SSD")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="ssd" value="1 TB SSD">1 TB SSD</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(ssd.equals("2 TB SSD")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="ssd" value="2 TB SSD">2 TB SSD</label></div>
						
						<!-- 	<select class="form-control" id="SSD_id" name="SSD_id">
										<option disabled="" value="" selected="">Select Storage</option>
										<option value="128 GB SSD">128 GB</option>
										<option value="256 GB SSD">256 GB</option>
										<option value="512 GB SSD">512 GB</option>
										<option value="1 TB SSD">1 TB </option>
										<option value="2 TB SSD">2 TB </option>
							</select> -->
						</div>
						<!--------------->

						<div class="cat6 main_cat">
							<h5>Graphics <i class="fa fa-chevron-down float-right"></i></h5>
						</div>
						<div class="cat6_option result_div">
							
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(graphics.equals("2 GB")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="graphics" value="2 GB">2 GB</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(graphics.equals("4 GB")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="graphics" value="4 GB">4 GB</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(graphics.equals("6 GB")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="graphics" value="6 GB">6 GB</label></div>
							<div class="form-check"><label class="form-check-label"><input class="" type="radio" <% if(graphics.equals("8 GB")) out.print("checked"); %> onclick="form.submit()" class="form-check-input" name="graphics" value="8 GB">8 GB</label></div>
							
							<!-- <select class="form-control" id="GC_id" name="GC_id">
										<option disabled="" value="" selected="">Select Graphics</option>
										<option value="2 GB">2 GB</option>
										<option value="4 GB">4 GB</option>
										<option value="6 GB">6 GB</option>
										<option value="8 GB">8 GB </option>
							</select> -->
						</div>
					</div>
					
					<!---price range---->
				
					<br><br>
					<div class="form-group h6 mt-3 text-center">
							<button class="btn btn-danger" type="button" onclick='if(confirm("Do you want to Refresh ?")){ location.href="prod.jsp" }'>Reset Filter</button>
						</div>
					
					</form>
				</div>
			</div>
				
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-9">
				<div class="main">
					<div class="row p-2">
						<div class="container p-3">
				<div class="row">
					<% if(query != null) {
					psmt = conn.prepareStatement(query);
					rs = psmt.executeQuery(); }
					if(feature.equals("") == false){ %> 
						<h3 class="text-center col-sm-12">Products with specific Features<hr class="bg-primary"></h3>
						<% while(rs.next()){ %>
							<div class="p-3 col-md-4 ">
								<div class="card p-3 h-100 bg-warning">
									<form class="h-100" method="post" action="<%=application.getContextPath()%>/CustProdController" >
										<input type="hidden" name="productid" id="productid" value="<%=rs.getString("customizeprodid") %>">
										<input type="hidden" name="maincatid" value="<%=rs.getString("custmaincatid") %>">
										<button class="btn p-0" type="submit" name="action" class="btn btn-white">									
											<img src="../uploadimg/<%=rs.getString("custprodphoto1") %>" class="img-thumbnail" alt="image">
										</button>
									</form>
									<h4 class="font-weight-bold mt-2"> <%=rs.getString("customizeprodname")	 %></h4>
									<p><%=rs.getString("custprodspecification") %></p>
									<p>&#8377; <%=rs.getString("custprodprice") %></p>
								<%  int q = 0;
									PreparedStatement psmt2 = conn.prepareStatement("select custprodqty from customizeproduct_table where customizeprodid='"+rs.getString("customizeprodid")+"'");
									ResultSet rs2 = psmt2.executeQuery();
								    rs2.next();
								    q = rs2.getInt("custprodqty");
								    if(q != 0){ %>
								    	<form action="<%=application.getContextPath()%>/CustListController"  method="post">
				           	  				<input type="hidden" name="cpid" id="cpid" value="<%=rs.getString("customizeprodid") %>">         	  
			    	       	  				<input type="hidden" name="qty" value="1" min="1" max="50">                	  	
											<input type="submit" class="btn btn-success" name="action" value="Add to List">
										</form>
								 <% } else out.print("Out of Stock");%>
								</div>
							</div>
						<% }
					} else if(query1 != null){ %>
						<h3 class="text-center col-sm-12">Laptop As Per Filter<hr class="bg-primary"></h3>
						<% while(rs.next()){ %>
					 		<div class="mb-3 col-sm-6 col-md-6 col-lg-4">
								<div class="card side">
									<form method="post" action="<%=application.getContextPath()%>/ProductController" >
										<input type="hidden" name="maincatid" value="<%=rs.getString("subcatid") %>">
										<input type="hidden" name="productid" id="productid" value="<%=rs.getString("productid") %>">
										<button type="submit" name="action" value="quickview" class="btn btn-white">									
											<%-- <img src="../uploadimg/<%=rs.getString("productphoto1") %>" width="100%" style="height:150px;" class="mt-2" alt="image"> --%>
											<img src="../uploadimg/<%=rs.getString("productphoto1") %>" width="100%" style="height:150px;" class="mt-2" alt="image">
										</button>
									</form>
									<%-- <h4 class="font-weight-bold mt-2"> <%=rs.getString("productname") %></h4>
									<p class="mt-2"> <%=rs.getString("productspecification") %></p>
									<p>&#8377; <%=rs.getString("productprice") %></p> --%>
									<div class="name mt-2">
									<h4 class="font-weight-bold" style="color:#20b2aa;float: left;"> <%=rs.getString("productname") %></h4><br>
									<p class="pt-2" style="font-size: 14px; font-family: sans-serif; color: #2f4f4f;float:left !important;"> <%=rs.getString("productspecification") %></p>
								</div>
								<div class="mt-3 " style="color:#2f4f4f;font-size: 20px;float: left !important;">
									<h3>&#8377;<%=rs.getString("productprice") %></h3>
								</div>
									<%  int q = 0;
										PreparedStatement psmt2 = conn.prepareStatement("select productqty from product_table where productid='"+rs.getString("productid")+"'");
										ResultSet rs2 = psmt2.executeQuery();
									    rs2.next();
									    q = rs2.getInt("productqty");
									    if(q != 0){ %>
									    	<%-- <form action="<%=application.getContextPath()%>/Cartcontroller"  method="post">
		           	  							<input type="hidden" name="pid" id="pid" value="<%=rs.getString("productid") %>">         	  
			           	  						<input type="hidden" name="qty" value="1" min="1" max="50">                	  	
												<input type="submit" class="	btn btn-primary" name="action" value="Add to Cart">
											</form>	
										
											<form action="<%=application.getContextPath()%>/WishlistController" method="post">
												<input type="hidden" name="proid" id="proid" value="<%=rs.getString("productid")%>">
												<button class="btn mt-2 p-3 bg-dark" type="submit" name="action" value="wishlist">
													<h6 class="text-warning"><i class="fa fa-heart text-danger" aria-hidden="true"></i> Add to Wish List</h6>
												</button>
											</form> --%>
									<div class="btn_div pt-2 pl-2 pr-2">
											<form action="<%=application.getContextPath()%>/Cartcontroller"  method="post">
		           	  				<input type="hidden" name="pid" id="pid" value="<%=rs.getString("productid") %>">         	  
	    	       	  				<input type="hidden" name="qty" value="1" min="1" max="50">                	  	
									<input type="submit" class="item_add btn btn-primary float-left" name="action" value="Add to Cart">
									</form>
									
									<form action="<%=application.getContextPath()%>/WishlistController" method="post">
	 								<input type="hidden" name="proid" id="proid" value="<%=rs.getString("productid")%>">
									<button  type="submit" name="action" value="wishlist" class="btnwishlist float-right pt-1" >
									<a class="like ">
										<i class="fa fa-heart  " aria-hidden="true" style="font-size: x-large;color:#337ab7 ! important;" ></i>
									</a>
									</button>
									</form>
									</div>					
									 <% } else out.print("Out of Stock");%>
								</div>
							</div>
					 	<% }
					 }else{  %>
						<h3 class="text-center col-sm-12">All Laptops<hr class="bg-primary"></h3>
						<% while(rs.next()){ %>
					 		<div class="mb-3 col-sm-6 col-md-6 col-lg-4">
								<div class="card side">
									<form method="post" action="<%=application.getContextPath()%>/ProductController" >
										<input type="hidden" name="maincatid" value="<%=rs.getString("subcatid") %>">
										<input type="hidden" name="productid" id="productid" value="<%=rs.getString("productid") %>">
										<button type="submit" name="action" value="quickview" class="btn btn-white">									
											<%-- <img src="../uploadimg/<%=rs.getString("productphoto1") %>" width="100%" style="height:150px;" class="mt-2" alt="image"> --%>
											<img src="../uploadimg/<%=rs.getString("productphoto1") %>" width="100%" style="height:150px;" class="mt-2" alt="image">
										</button>
									</form>
									<%-- <h4 class="font-weight-bold mt-2"> <%=rs.getString("productname") %></h4>
									<p class="mt-2"> <%=rs.getString("productspecification") %></p>
									<p>&#8377; <%=rs.getString("productprice") %></p> --%>
									<div class="name mt-2">
									<h4 class="font-weight-bold" style="color:#20b2aa;float: left;"> <%=rs.getString("productname") %></h4><br>
									<p class="pt-2" style="font-size: 14px; font-family: sans-serif; color: #2f4f4f;float:left !important;"> <%=rs.getString("productspecification") %></p>
								</div>
								<div class="mt-3 " style="color:#2f4f4f;font-size: 20px;float: left !important;">
									<h3>&#8377;<%=rs.getString("productprice") %></h3>
								</div>
									<%  int q = 0;
										PreparedStatement psmt2 = conn.prepareStatement("select productqty from product_table where productid='"+rs.getString("productid")+"'");
										ResultSet rs2 = psmt2.executeQuery();
									    rs2.next();
									    q = rs2.getInt("productqty");
									    if(q != 0){ %>
									    	<%-- <form action="<%=application.getContextPath()%>/Cartcontroller"  method="post">
		           	  							<input type="hidden" name="pid" id="pid" value="<%=rs.getString("productid") %>">         	  
			           	  						<input type="hidden" name="qty" value="1" min="1" max="50">                	  	
												<input type="submit" class="	btn btn-primary" name="action" value="Add to Cart">
											</form>	
										
											<form action="<%=application.getContextPath()%>/WishlistController" method="post">
												<input type="hidden" name="proid" id="proid" value="<%=rs.getString("productid")%>">
												<button class="btn mt-2 p-3 bg-dark" type="submit" name="action" value="wishlist">
													<h6 class="text-warning"><i class="fa fa-heart text-danger" aria-hidden="true"></i> Add to Wish List</h6>
												</button>
											</form> --%>
									<div class="btn_div pt-2 pl-2 pr-2">
											<form action="<%=application.getContextPath()%>/Cartcontroller"  method="post">
		           	  				<input type="hidden" name="pid" id="pid" value="<%=rs.getString("productid") %>">         	  
	    	       	  				<input type="hidden" name="qty" value="1" min="1" max="50">                	  	
									<input type="submit" class="item_add btn btn-primary float-left" name="action" value="Add to Cart">
									</form>
									
									<form action="<%=application.getContextPath()%>/WishlistController" method="post">
	 								<input type="hidden" name="proid" id="proid" value="<%=rs.getString("productid")%>">
									<button  type="submit" name="action" value="wishlist" class="btnwishlist float-right pt-1" >
									<a class="like ">
										<i class="fa fa-heart  " aria-hidden="true" style="font-size: x-large;color:#337ab7 ! important;" ></i>
									</a>
									</button>
									</form>
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
					 	<% }
					 } %>
				</div>
			</div>					
					</div>
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