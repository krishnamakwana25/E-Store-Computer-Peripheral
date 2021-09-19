<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<%@page import="DAO.OrderProductdao" %>
<%@page import="DAO.Userdao" %>
<%@page import="DAO.Productdao" %>
<%@page import="DAO.Orderdao" %>
<%@page import="DAO.DealerRegisterdao" %>
<%@page import="DAO.ORPdao" %>
<%@page import="DAO.CustomeOPdao" %>
<%@page import="DAO.CustomOPStatusdao" %>
<%@page import="DAO.OrderStatusdao" %>
<%@page import="DAO.ORPStatusdao" %>
<%@page import="DAO.DealerStockdao" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Online Shopping site in India : Laptop,CCTV,Printer...</title>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<style>
.name_cnt
	{
		font-size:2.5vw !important;
	}
.name_class
	{
		font-size:2vw !important;
		color:#212529;
		margin-left:5px;
	}
.side
	{
		box-shadow: 1px 1px 4px grey;
		height: 150px;
		margin-bottom: 15px;
		margin-top: 10px;
		width:100%;
		background-color: white;
		background-color:#FFC229 ;
	}
	.side1
	{
		box-shadow: 1px 1px 4px grey;
		color:#FFC229 ;
	}
	.side:hover
	{
		cursor:pointer;
		color:#AEB2B7;
		background-color:#424A5D ;
	}
	.side a:hover
	{
		color:#AEB2B7;
	}
</style>
<%
	Adminbean ub = Admindao.getAdminById((Integer) session.getAttribute("aid"));
%>
 <jsp:include page="head.jsp"></jsp:include>
 </head>
	<body onload="PreLoader()">
 	  <div id="loading"></div>
		<section id="container" >
			<jsp:include page="header.jsp"></jsp:include>
				<jsp:include page="sidebar.jsp"></jsp:include>
					<section id="main-content">
						<section class="wrapper">
							<div class="row"> 
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">     		 
           						<div class = "row side1" >
           							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt-4">
           								<h1> Dashboard</h1>
           								<h6>Dashboard features</h6>           								
           							</div>
           						</div>
           						<div class = "row mt-2">           							
           							<div class="col-sm-3 col-md-3 col-lg-3">           						           								
       									<div class="side">
       										<div class="row">
       											<div class="col-sm-3 col-md-3 col-lg-6">
       												<a><i class="fa fa-users mt-4 ml-4"  aria-hidden="true" style="font-size:2.5vw !important;"></i></a><br>
       											</div>           											 	
       											<div class="col-sm-3 col-md-3 col-lg-6 ">
       											<%
       													int cnt1 = Userdao.getallUsersCnt();
       												%>
       												<h2 class=" mt-4 ml-4 name_cnt"><%=cnt1 %></h2>
												</div>
       										</div>       										
       										<h3>           											
       											<a href="viewuser.jsp" class="name_class">Total Users</a>
       										</h3>           									
       									</div>
       								</div>
       								
       								<div class="col-sm-3 col-md-3 col-lg-3">           						           								
       									<div class="side">
       										<div class="row">
       											<div class="col-sm-3 col-md-3 col-lg-6">
       												<a><i class="fa fa-users mt-4 ml-4"  aria-hidden="true" style="font-size:2.5vw !important;"></i></a><br>
       											</div>           											 	
       											<div class="col-sm-3 col-md-3 col-lg-6 ">
       												<%
       													int cnt2 = DealerRegisterdao.getallDealersCnt();
       												%>
       												<h2 class=" mt-4 ml-4 name_cnt"><%=cnt2 %></h2>
												</div>
       										</div>       										
       										<h3>           											
       											<a href="viewdealers.jsp" class="name_class">Total Dealer</a>
       										</h3>           									
       									</div>
       								</div>
       								
       								<div class="col-sm-3 col-md-3 col-lg-3">           						           								
       									<div class="side">
       										<div class="row">
       											<div class="col-sm-3 col-md-3 col-lg-6">
       												<a><i class="fa fa-shopping-cart mt-4 ml-4"  aria-hidden="true" style="font-size:2.5vw !important;"></i></a><br>
       											</div>           											 	
       											<div class="col-sm-3 col-md-3 col-lg-6 ">
       												<%
       													int cnt3 = OrderProductdao.getallOrdersCnt();
       												%>
       												<h2 class=" mt-4 ml-4 name_cnt"><%=cnt3 %></h2>
												</div>
       										</div>       										
       										<h3>           											
       											<a href="viewOrders.jsp" class="name_class">Orders</a>
       										</h3>           									
       									</div>
       								</div>
       								
       								<div class="col-sm-3 col-md-3 col-lg-3">           						           								
       									<div class="side">
       										<div class="row">
       											<div class="col-sm-3 col-md-3 col-lg-6">
       												<a><i class="fa fa-shopping-cart mt-4 ml-4"  aria-hidden="true" style="font-size:2.5vw !important;"></i></a><br>
       											</div>           											 	
       											<div class="col-sm-3 col-md-3 col-lg-6 ">
       											<%
       													int cnt4 = ORPdao.getallRentOrdersCnt();
       												%>
       												<h2 class=" mt-4 ml-4 name_cnt"><%=cnt4 %></h2>
												</div>
       										</div>       										
       										<h3>           											
       											<a href="viewRentOrders.jsp" class="name_class ">Rent Orders</a>
       										</h3>           									
       									</div>
       								</div>    
       								
       								
     								<div class="col-sm-3 col-md-3 col-lg-3">           						           								
     									<div class="side">
     										<div class="row">
     											<div class="col-sm-3 col-md-3 col-lg-6">
     												<a><i class="fa fa-shopping-cart mt-4 ml-4"  aria-hidden="true" style="font-size:2.5vw !important;"></i></a><br>
     											</div>           											 	
     											<div class="col-sm-3 col-md-3 col-lg-6 ">
     											<%
       													int cnt5 = CustomeOPdao.getallCustomOrdersCnt();
       												%>
     												<h2 class=" mt-4 ml-4 name_cnt"><%= cnt5 %></h2>
												</div>
     										</div> 
     										<h3>           											
     											<a href="viewCustomizeOrders.jsp" class="name_class ">Customize Orders</a>
     										</h3>           									
     									</div>
       								</div>
       								    
       								
       								<div class="col-sm-3 col-md-3 col-lg-3">           						           								
     									<div class="side">
     										<div class="row">
     											<div class="col-sm-3 col-md-3 col-lg-6">
     												<a><i class="fa fa-laptop mt-4 ml-4"  aria-hidden="true" style="font-size:2.5vw !important;"></i></a><br>
     											</div>           											 	
     											<div class="col-sm-3 col-md-3 col-lg-6 ">
     												<%
       													int cnt6 = Productdao.getallProductsCnt();
       												%>
     												<h2 class=" mt-4 ml-4 name_cnt"><%=cnt6 %></h2>
												</div>
     										</div>       										
     										<h3>           											
     											<a href="viewproduct.jsp" class="name_class ">Products</a>
     										</h3>           									
     									</div>
       								</div>       
       								<div class="col-sm-3 col-md-3 col-lg-3">           						           								
     									<div class="side">
     										<div class="row">
     											<div class="col-sm-3 col-md-3 col-lg-6">
     												<a><i class="fa fa-laptop mt-4 ml-4"  aria-hidden="true" style="font-size:2.5vw !important;"></i></a><br>
     											</div>           											 	
     											<div class="col-sm-3 col-md-3 col-lg-6 ">
     												<%
       													int cnt7 = OrderStatusdao.getallOrdersCnt();
       												%>
     												<h2 class=" mt-4 ml-4 name_cnt"><%=cnt7 %></h2>
												</div>
     										</div>       										
     										<h3>           											
     											<a href="viewOrderStatus.jsp" class="name_class ">Order Status</a>
     										</h3>           									
     									</div>
       								</div>
       								<div class="col-sm-3 col-md-3 col-lg-3">           						           								
     									<div class="side">
     										<div class="row">
     											<div class="col-sm-3 col-md-3 col-lg-6">
     												<a><i class="fa fa-laptop mt-4 ml-4"  aria-hidden="true" style="font-size:2.5vw !important;"></i></a><br>
     											</div>           											 	
     											<div class="col-sm-3 col-md-3 col-lg-6 ">
     												<%
       													int cnt8 = ORPStatusdao.getallRentOrdersCnt();
       												%>
     												<h2 class=" mt-4 ml-4 name_cnt"><%=cnt8 %></h2>
												</div>
     										</div>       										
     										<h3>           											
     											<a href="viewRentOrderStatus.jsp" class="name_class ">Rent Order Status</a>
     										</h3>           									
     									</div>
       								</div>
       								<div class="col-sm-3 col-md-3 col-lg-3">           						           								
     									<div class="side">
     										<div class="row">
     											<div class="col-sm-3 col-md-3 col-lg-6">
     												<a><i class="fa fa-laptop mt-4 ml-4"  aria-hidden="true" style="font-size:2.5vw !important;"></i></a><br>
     											</div>           											 	
     											<div class="col-sm-3 col-md-3 col-lg-6 ">
     												<%
       													int cnt9 = CustomOPStatusdao.getallCustomOrdersCnt();
       												%>
     												<h2 class=" mt-4 ml-4 name_cnt"><%=cnt9 %></h2>
												</div>
     										</div>       										
     										<h3>           											
     											<a href="viewCustomOrderStatus.jsp" class="name_class ">Custom Order Status</a>
     										</h3>           									
     									</div>
       								</div>      
       								
       								<!-- ===== -->     								
       									<div class="col-sm-3 col-md-3 col-lg-3">           						           								
     									<div class="side">
     										<div class="row">
     											<div class="col-sm-3 col-md-3 col-lg-6">
     												<a><i class="fa fa-laptop mt-4 ml-4"  aria-hidden="true" style="font-size:2.5vw !important;"></i></a><br>
     											</div>           											 	
     											<div class="col-sm-3 col-md-3 col-lg-6 ">
     												<%
       													int cnt10 = DealerStockdao.getAllDealerStock();
       												%>
     												<h2 class=" mt-4 ml-4 name_cnt"><%=cnt10 %></h2>
												</div>
     										</div>       										
     										<h3>           											
     											<a href="dealerStock.jsp" class="name_class ">Dealer Stock</a>
     										</h3>           									
     									</div>
       								</div> 
           							</div>
           						</div>           						
           					</div>             
        				</section>
      				</section>
		</section>  
	 <jsp:include page="script.jsp"></jsp:include>
	</body>
</html>