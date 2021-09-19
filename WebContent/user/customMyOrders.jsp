<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <!--  -->
<%@page import="bean.CustProdBean" %>
<%@page import="bean.Userbean" %>
<%@page import="DAO.Userdao" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Custproddao" %>
<%@page import="bean.CustomOrderBean" %>
<%@page import="DAO.CustOrderdao" %>
<%@page import="bean.CustomeOPbean" %>
<%@page import="DAO.CustomeOPdao" %>
<%@page import="bean.CustomCancelOrderbean" %>
<%@page import="DAO.CustomCancelorderdao" %>
<%@page import="bean.CustomOpStatusBean" %>
<%@page import="DAO.CustomOPStatusdao" %>
<%@page import="DAO.RateToProductdao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<title>My Customize Order</title>
<style type="text/css">					
.hh-grayBox 
{	
	margin-bottom: 20px;
	padding: 35px;
			margin-top: 20px;
}
.pt45{padding-top:45px;}
.order-tracking{
	text-align: center;
	width: 33.33%;
	position: relative;
	display: block;
}
.order-tracking .is-complete{
	display: block;
	position: relative;
	border-radius: 50%;
	height: 30px;
	width: 30px;
	border: 0px solid #AFAFAF;
	background-color: #f7be16;
	margin: 0 auto;
	transition: background 0.25s linear;
	-webkit-transition: background 0.25s linear;
	z-index: 2;
}
.order-tracking .is-complete:after {
	display: block;
	position: absolute;
	content: '';
	height: 14px;
	width: 7px;
	top: -2px;
	bottom: 0;
	left: 5px;
	margin: auto 0;
	border: 0px solid #AFAFAF;
	border-width: 0px 2px 2px 0;
	transform: rotate(45deg);
	opacity: 0;
}
.order-tracking.completed .is-complete{
	border-color: #27aa80;
	border-width: 0px;
	background-color: #27aa80;
}
.order-tracking.completed .is-complete:after {
	border-color: #fff;
	border-width: 0px 3px 3px 0;
	width: 7px;
	left: 11px;
	opacity: 1;
}
.order-tracking p {
	color: #A4A4A4;
	font-size: 16px;
	margin-top: 8px;
	margin-bottom: 0;
	line-height: 20px;
}
.order-tracking p span{font-size: 14px;}
.order-tracking.completed p{color: #000;}
.order-tracking::before {
	content: '';
	display: block;
	height: 3px;
	width: calc(100% - 40px);
	background-color: #f7be16;
	top: 13px;
	position: absolute;
	left: calc(-50% + 20px);
	z-index: 0;
}
.order-tracking:first-child:before{display: none;}
.order-tracking.completed:before{background-color: #27aa80;}
.out_stock
{
	
	width:100%;
	height:45px;
	bottom:12px;
	left:0px;
	background-color:#dcdcdc; /*#ff8600    #ff7f50*/
	padding-top:9px;
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

.font_size
{
	font-size:20px !important;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
	int pid, opid;
	String pcname = "",catname = "";
%>
<jsp:include page="script.jsp"></jsp:include>
<jsp:include page="header1_user.jsp"></jsp:include>
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body onload="preloader1()">
<div id="loading"></div>
<div class="breadcrumbs mb-2">
	<div class="container">
		<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
			<li><a href="index1_user.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
			<li class="active">My Customize Orders</li>
		</ol>
	</div>
</div>
<div class="container mb-3">
	<h1 class="mb-3">Your Customize Orders</h1>
	<div class="tab">
	  <button class="tablinks" onclick="openCity(event, 'orders')" id="defaultOpen">Orders</button>
	  <button class="tablinks" onclick="openCity(event, 'cancel-orders')">Cancelled Orders</button>
	</div>

	<div id="orders" class="tabcontent">
		<% int cnt=0;%>
		<%       
				cnt=CustomeOPdao.getallCustomOrderCnt(ub.getUserid());													
	  			if(cnt != 0)
	  			{
	  				List<CustomeOPbean>list1=CustomeOPdao.getallCOPByUserId(ub.getUserid());							
			  		for(CustomeOPbean o1: list1)								    	          			
			  		{
		 %> 		
		 			<div class="row p-3 mt-2 " style="height:auto;border:1px solid grey;font-weight:bold;">
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
						<div class="box1">
							<p>Ordered Date</p>
							<p class="mt-2"><%out.println(o1.getCustomOrderPlaceDate()); %></p>
						</div>
					</div>
					<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
						<div class="box2">
							<p>SHIP TO : </p>
							<p class="mt-2 my_name" style="width:155px;cursor:pointer; color:#483d8b;"><%out.println(ub.getUsername()); %></p>
							<div id="my_add">
								<address><%out.println(ub.getAdd()); %></address>
							</div>						
						</div>
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<div class="box3">
						<%                                                	
							List<CustomeOPbean>list2=CustomeOPdao.getallCOPByUserId1(ub.getUserid(),o1.getPCName());							
					  		for(CustomeOPbean cop1: list2)								    	          			
					  		{
							  if(cop1.getCustomProductid() == o1.getCustomProductid()) 
							  {
								  pcname = cop1.getPCName();
						%>
							<p style=" color:#483d8b;">Customize PC Order Id : <%out.println(cop1.getCustomUserOrderid()); %></p>
						<%
							  }
							}
						%>  
						</div>
					</div>      
				</div>
				
					<div class="row pt-4 " style="height:auto;border:1px solid grey;">
						<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
							<div class="box1">
								<img src="resources/images/custom.jpg" style="width:auto;height:180px;" class="img img-responsive">
							</div>
						</div>
					<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
						<div class="row items">
							<p class="font-weight-bold mb-2 mr-2 font_size"><%out.println(pcname); %></p><br><br>					
							<p class="font_size mr-5">&#8377; <%out.println(o1.getCustomProductPrice()); %></p>								
							<button class="btn btn-danger ml-3 mt-1" type="button" data-toggle="modal" data-target="#test2" > Cancel Order</button>
							<button class="btn btn-danger mt-1 ml-3 track1" type="button" id="track1"> Track Your Order</button>							
						</div>
						<div class="row mt-5">							
						<!-- 	<p class="font-weight-bold">Categories :  Items Name</p> -->
							<table border="3" class="table table-responsive">
							 <%                                                	
			              	List<CustomOrderBean>list4=CustOrderdao.getCategories(ub.getUserid(),pcname);							
		    	          		for(CustomOrderBean CustOrder: list4)								    	          			
		        	      		{
		    	          			if(CustOrder.getCustmaincatid() == 1 )
		    	          			{
		    	          				catname = "Processor";
		    	          			}
		    	          			else if(CustOrder.getCustmaincatid() == 2 )
		    	          			{
		    	          				catname = "MotherBoard";
		    	          			}
		    	          			else if(CustOrder.getCustmaincatid() == 3 )
		    	          			{
		    	          				catname = "RAM";
		    	          			}
		    	          			else if(CustOrder.getCustmaincatid() == 4 )
		    	          			{
		    	          				catname = "Storage";
		    	          			}
		    	          			else if(CustOrder.getCustmaincatid() == 5 )
		    	          			{
		    	          				catname = "Graphics Card";
		    	          			}
		    	          			else if(CustOrder.getCustmaincatid() == 6 )
		    	          			{       	
		    	          				catname = "Case";
		    	          			}													    	          		
   	          			  	%>
   	          					<tr>
									 <a><td style="font-size: 15px !important; padding: 0px !important; "><%out.println(catname);%></td> <td style="font-size: 15px !important;padding: 0px !important;">: <% out.println(CustOrder.getProname());%></td><td style="font-size: 15px !important;padding: 0px !important;"><%out.println(CustOrder.getCustproprice());%>&#8377;</td></a>
								</tr>
   	          			  	<%
		        	      		}
		    	          	
								int p = o1.getCustomProductPrice();
								int q = o1.getCustomOrderQty();
								int total = p * q ;
								pid = o1.getCustomProductid();
								opid = o1.getCustomOPid();
							
							int proid = o1.getCustomProductid();
							int q1 = Custproddao.GetTotalQTY(proid);
							if(q1 != 0)
							{}
							else
							{
						%>
								<div class="out_stock">
									<h5 class="text-center font-weight-bold ">Out Of Stock</h5>
								</div>
						<%
							}	
						%>	
						</table>	
						</div>
						<div class="row">
						<div class="col-12 col-md-10 hh-grayBox trackans" id="trackans" style="display:none;">
						<div class="row justify-content-between" >
									<%
										int copid = 0 ;
										String status = "";
										copid = o1.getCustomOPid();
										List<CustomOpStatusBean>list11=CustomOPStatusdao.getCustomOrderStatus(copid, pid, ub.getUserid());							
										for(CustomOpStatusBean osb1: list11)								    	          			
										{
											status = osb1.getStatus();
											System.out.println("status"+status);
											System.out.println("product id "+pid);
											if(status.equalsIgnoreCase("Ordered"))
											{											
									%>
											<div class="order-tracking completed">
												<span class="is-complete"></span>
												<p>Ordered<br></p>
											</div>
											<div class="order-tracking ">
												<span class="is-complete"></span>
												<p>Shipped<br></p>
											</div>
											<div class="order-tracking">
												<span class="is-complete"></span>
												<p>Delivered<br></p>
											</div>								
									<%
											}
											else if(status.equalsIgnoreCase("Shipped"))									 
											{
									%>
											<div class="order-tracking completed">
												<span class="is-complete"></span>
												<p>Ordered<br></p>
											</div>
											<div class="order-tracking completed">
												<span class="is-complete"></span>
												<p>Shipped<br></p>
											</div>
											<div class="order-tracking">
												<span class="is-complete"></span>
												<p>Delivered<br></p>
											</div>		
									<%
											}  
											else if(status.equalsIgnoreCase("Delivered"))
											{											
									%>
											<div class="order-tracking completed">
												<span class="is-complete"></span>
												<p>Ordered<br></p>
											</div>
											<div class="order-tracking completed">
												<span class="is-complete"></span>
												<p>Shipped<br></p>
											</div>
											<div class="order-tracking completed">
												<span class="is-complete"></span>
												<p>Delivered<br></p>
											</div>		
									<%
											}
										}
									%> 																							
									</div>
						</div>
					</div>
					</div>
					<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">																																											
					</div>
					
				</div>
		<%	
		  			}
	  			}
	  			else
	  			{
		 %>
					<div class="out_stock ">
						<h5 class="text-center font-weight-bold" style="color:black ! important;">You didn't have purchase anything</h5>
						<div class="register-home animated mb-5"  style="margin-bottom:50px;height:40;width:130;fill:ttransparent;">
							<a href="CustomizeProductById.jsp">Shop Now</a>				
						</div>
					</div>			
		<%
		  		}	     	 
		%>
	</div>
	
	 <div id="cancel-orders" class="tabcontent">
		<% int cnt1=0;
		String pcname1 = "";
				cnt1=CustomCancelorderdao.getallCustomCancelOrderByCnt(ub.getUserid());			
	  			if(cnt1 != 0)
	  			{
	  	%>	  			
			<a><h2 class="mb-3"> 
				<p class="font-weight-bold float-left mr-1"><%out.println(cnt1); %> cancelled </p> order placed</h2>
			</a>	
		<%          				
			  		List<CustomCancelOrderbean>list3=CustomCancelorderdao.getallCustomcancelOrderByUserId(ub.getUserid());							
			  		for(CustomCancelOrderbean o1: list3)								    	          			
			  		{		  
		%>			
					<div class="row p-3 " style="height:auto;border:1px solid grey;font-weight:bold;">
					 	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
							<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
								<div class="box1">
									<p>Ordered Date</p>
									<p class="mt-2"><%out.println(o1.getCustomOrderPlaceDate()); %></p>
								</div>
							</div>
							<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
								<div class="box3">
							 	<%                                                	
				            		List<CustomeOPbean>list2=CustomeOPdao.getallCOPByUserId(ub.getUserid());							
				 	          		for(CustomeOPbean op1: list2)								    	          			
				     	      		{
				 	          		 if(op1.getCustomProductid() == o1.getCustomProductid()) 
				 	          		 {
				 	          			pcname1 = op1.getPCName();
				 	          			System.out.println(op1.getPCName());
				     			%>
									<p style=" color:#483d8b;">Order Id : <%out.println(op1.getCustomUserOrderid()); %></p>
								<%
					          		  }
				     	      		}
								%>  
								</div>
							</div>  
						</div>    
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"></div>
					</div>
					
					<div class="row pt-4 " style="height:200px;border:1px solid grey;">
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
								<div class="box1">
									<img src="resources/images/custom.jpg" style="width:240px;height:160px;" height="100%" class="img img-responsive">
								</div>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
								<div class="box2">
									<p class="mb-2 font_size font-weight-bold"><%=o1.getPCName() %></p>					
									<p class="mb-2 font_size font-weight-bold">&#8377; <%out.println(o1.getCustomProductPrice()); %></p>
														
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<!-- <p class="mb-2 font_size font-weight-bold"> Categories  :  Items Name</p> -->
						<table border="3" class="table table-responsive">
						 <%                                                	
			              	List<CustomOrderBean>list4=CustOrderdao.getCategories(ub.getUserid(),o1.getPCName());							
		    	          		for(CustomOrderBean CustOrder: list4)								    	          			
		        	      		{
		    	          			if(CustOrder.getCustmaincatid() == 1 )
		    	          			{
		    	          				catname = "Processor";
		    	          			}
		    	          			else if(CustOrder.getCustmaincatid() == 2 )
		    	          			{
		    	          				catname = "MotherBoard";
		    	          			}
		    	          			else if(CustOrder.getCustmaincatid() == 3 )
		    	          			{
		    	          				catname = "RAM";
		    	          			}
		    	          			else if(CustOrder.getCustmaincatid() == 4 )
		    	          			{
		    	          				catname = "Storage";
		    	          			}
		    	          			else if(CustOrder.getCustmaincatid() == 5 )
		    	          			{
		    	          				catname = "Graphics Card";
		    	          			}
		    	          			else if(CustOrder.getCustmaincatid() == 6 )
		    	          			{
		    	          				catname = "Case";
		    	          			}													    	          		
   	          			  	%>
   	          			  		<tr>
									<a ><td style="font-size: 15px !important; padding: 0px !important; "><%out.println(catname);%></td> <td style="font-size: 15px !important;padding: 0px !important;">: <% out.println(CustOrder.getProname());%> </td> <td style="font-size: 15px !important;padding: 0px !important;"><%out.println(CustOrder.getCustproprice());%>&#8377;</td></a>
								</tr>
   	          			  	<%
		        	      		}						
								
								pid = o1.getCustomProductid();
								opid = o1.getCustomOPid();
							
							int proid = o1.getCustomProductid();
							int q1 = Custproddao.GetTotalQTY(proid);
							if(q1 != 0)
							{}
							else
							{
						%>
								<div class="out_stock">
									<h5 class="text-center font-weight-bold ">Out Of Stock</h5>
								</div>
						<%
							}	
						%>	
						</table>	
						</div>
					</div>
		<%
		  			}
	  			}
	  			else
	  			{
		%>
					<div class="out_stock ">
						<h5 class="text-center font-weight-bold" style="color:black ! important;">No cancel orders</h5>					
					</div>		
		<%	  				
	  			}
		%>
	</div> 
	<!-- ************************************************************************************** -->		
</div>
		<!--modal---->
	<div id="test2" class="modal fade" role="dialog" style="margin-top:200px !important">
		<div class="modal-dialog">			
			<div class="modal-content">
				<div class="modal-header bg-danger text-white">
					<h4 class="text-white" style="font-size:2vw ! important;">Cancel Order</h4>
					<button type="button" class="close text-white" data-dismiss="modal">&times;</button>
				</div>
				<form  method="post" action="<%=application.getContextPath()%>/CustomCancelOrderController" accept-charset="utf-8" data-parsley-validate="true">
				<div class="modal-body">
						<div class="form-group">
							<div class='rating-stars text-center'>							
								<select class="form-control" id="reason" name="reason" required="required">       
									<option value=" ">Select the reason</option> 
									<option value="Order created by mistake">Order created by mistake</option>
									<option value="Wrong shipping address">Wrong shipping address</option>
									<option value="Item would not arrive on time">Item would not arrive on time</option>
									<option value="Price is too high">Price is too high</option>
									<option value="Other">Other</option>								                       	
								</select><br>    
							</div>
						</div>
				</div>
				<%                                                	
				List<CustomeOPbean>list3=CustomeOPdao.getallCOPByUserId(ub.getUserid());							
		  		for(CustomeOPbean cop1: list3)								    	          			
		  		{					
				%>
					<input type="hidden" name="customuoid" value="<%= cop1.getCustomUserOrderid()%>">
					<input type="hidden" name="userid" value="<%=cop1.getUserid()%>">
					<input type="hidden" name="username" value="<%=ub.getUsername()%>">
					<input type="hidden" name="pcname" value="<%=cop1.getPCName()%>">
					<input type="hidden" name="customqty" value="<%=cop1.getCustomOrderQty()%>">
					<input type="hidden" name="totalqty" value="<%= cop1.getCustomProductQty1()%>">
				<%
					}
				%> 
				<div class="modal-footer">
					<input type="submit" name="action" class="btn btn-danger" value="Submit">
				</div>
				</form>
			</div>
		</div>
	</div>
	<!----modal done--------->	
<jsp:include page="footer_user.jsp"></jsp:include>
<script type="text/javascript">
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
<!-- ************************************************************************************** -->
<script type="text/javascript">
$('.track1').click(function()
{	
	$('.trackans').fadeToggle(1000);		
}); 	
jQuery(document).ready(function($) 
{
	$('.my_name').hover(function() 
	{
		/* Stuff to do when the mouse enters the element */	
		var next=$(this).next('#my_add').fadeToggle('slow');
		$('#my_add').not(next).hide();
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