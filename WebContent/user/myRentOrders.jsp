<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <!--  -->
<%@page import="bean.Productbean" %>
<%@page import="bean.Userbean" %>
<%@page import="bean.ORPStatusBean" %>
<%@page import="DAO.Userdao" %>
<%@page import="DAO.ORPStatusdao" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Productdao" %>
<%@page import="bean.ORPbean" %>
<%@page import="DAO.ORPdao" %>
<%@page import="DAO.Rentproddao" %>
<%@page import="bean.RentOrderCancelbean" %>
<%@page import="DAO.RentOrderCanceldao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<head>
<style type="text/css">
.modal-scrollbar-measure {
  position: absolute;
  top: -9999px;
  width: 50px;
  height: 50px;
  overflow: scroll;
}

.modal-open .modal {
  overflow-x: hidden;
  overflow-y: auto;
}
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
	/* position:absolute; */
	bottom:12px;
	left:0px;
	background-color:#dcdcdc; /*#ff8600    #ff7f50*/
	padding-top:9px;
}
.font_size
{
	font-size:20px !important;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Rent Order</title>
<%
	Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
	int pid = 0 ; 
	int orpid;	
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
			<li class="active">My Rent Orders</li>
		</ol>
	</div>
</div>
<div class="container mb-3">
	<h1 class="mb-3">Your Rent Orders</h1>
	<div class="tab">
	  <button class="tablinks" onclick="openCity(event, 'orders')" id="defaultOpen">Orders</button>
	  <!-- <button class="tablinks" onclick="openCity(event, 'buy-again')">Buy Again</button> -->
	  <button class="tablinks" onclick="openCity(event, 'cancel-orders')">Cancelled Orders</button>
	</div>

	<div id="orders" class="tabcontent" style="height:auto;">
		<% int cnt=0;%>
		<%       
				cnt=ORPdao.getallRentOrderCnt(ub.getUserid());													
	  			if(cnt != 0)
	  			{
	  				List<ORPbean>list=ORPdao.getallORPByUserId(ub.getUserid());							
			  		for(ORPbean orp: list)								    	          			
			  		{
		 %> 		
						<div class="row p-3 mt-2 " style="height:auto;border:1px solid grey;font-weight:bold;">
							<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
								<div class="box1">
									<p class="float-left mr-2">Start Date</p>
									<p class="ml-2"><%out.println(orp.getBookDate()); %></p>
									<p class="float-left mr-2">End Date</p>
									<p class="ml-2"><%out.println(orp.getEndDate()); %></p>
								</div>
							</div>
							<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
								<div class="box2">
									<p>SHIP TO : </p>
									<p class="mt-2" id="my_name" style="cursor:pointer; color:#483d8b;"><%out.println(ub.getUsername()); %></p>
									<div id="my_add">
										<address><%out.println(ub.getAdd()); %></address>
									</div>
								<script type="text/javascript">
								jQuery(document).ready(function($) {
									$('#my_name').hover(function() {
										/* Stuff to do when the mouse enters the element */
										$('#my_add').fadeIn('slow');
									}, function() {
										/* Stuff to do when the mouse leaves the element */
										$('#my_add').fadeOut('slow');
									});
								});
								</script>
								</div>
							</div>
							<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
								<div class="box3">
							 	<%                                                	
							 	List<ORPbean>list1=ORPdao.getallORPByUserId(ub.getUserid());							
						  		for(ORPbean orp1: list1)								    	          			
						  		{
				 	          		  if(orp1.getORPid() == orp.getORPid()) 
				 	          		  {
				     			%>
									<p style=" color:#483d8b;">Rent Order Id : <%out.println(orp1.getUserRentOrderid()); %></p>
								<%
				 	          		  }
				     	      		}
								%>  
								</div>
							</div>      
						</div>
						
						<div class="row pt-4 " style="height:auto;border:1px solid grey;">
							<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
								<div class="box1">
									<img src="../uploadimg/<%=orp.getRentProPhoto1()%>" style="width:170px;height:auto;" height="100%" class="img img-responsive">
								</div>
							</div>
							<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
								<div class="box2 ">
									<p class="mb-2 font_size"><%out.println(orp.getRentProName()); %></p>					
									<p class="mb-2 font_size">&#8377; <%out.println(orp.getPrice()); %>/Month</p>
									<p class="mb-2 font_size">Duration:<%out.println(orp.getDuration()); %>Month</p>
									<p class="mb-2 font_size">Qty:<%out.println(orp.getQuantity()); %></p>
									<%
									  	int p = orp.getPrice();
										orpid = orp.getORPid();
										pid = orp.getRentProid();
										int q = orp.getQuantity();
										int d = orp.getDuration();
										int total = p * q * d ;
									%>
									<p class="mb-1 font_size font-weight-bold">&#8377; <%out.println(total); %></p>
								
								</div>
							</div>
							
							<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
								<div class="box3">
									<div class="row mt-3">
										 <div class="col-lg-4">
										 <% 
											int proid = orp.getRentProid();
											int q1 = Rentproddao.GetTotalQTY(proid);
											if(q1 != 0)
											{
										 %>   
										 	<form method="post" action="<%=application.getContextPath()%>/RentProdController1">
												<input type="hidden" name="rentqty" value="<%=q%>">
												<input type="hidden" name="rentpid" value="<%=orp.getRentProid()%>">
												<input type="hidden" name="price" value="<%=p %>">
												<input type="hidden" name="totalamt" value="<%=total%>">
												<input type="hidden" name="unm" value="<%=ub.getUsername() %>">
												<input type="hidden" name="add" value="<%=ub.getAdd() %>">
												<input type="hidden" name="mobo" value="<%=ub.getMobnum() %>">									
												<input class="btn btn_blue btn-primary mt-1" type="submit" value="Re-Order" name="action">
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
										<div class="col-lg-4">
											<button class="btn btn-danger mt-1" type="button" data-toggle="modal" data-target="#test2" > Cancel Order</button>										
										</div>								
					<!--modal---->
				<div id="test2" class="modal fade" role="dialog" style="margin-top:200px !important">
					<div class="modal-dialog">
						
						<div class="modal-content">
							<div class="modal-header bg-danger text-white">
								<h4 class="text-white" style="font-size:2vw ! important;">Cancel Order</h4>
								<button type="button" class="close text-white" data-dismiss="modal">&times;</button>
							</div>
							<form  method="post" action="<%=application.getContextPath()%>/RentOrderCancelController" accept-charset="utf-8" data-parsley-validate="true">
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
							List<ORPbean>list2=ORPdao.getallORPByUserId(ub.getUserid());							
					  		for(ORPbean orp1: list2)								    	          			
			     	      		{
			     			%>
			     				<input type="hidden" name="ouid" value="<%= orp1.getUserRentOrderid()%>">
								<input type="hidden" name="userid" value="<%=orp1.getUserid()%>">
								<input type="hidden" name="username" value="<%=ub.getUsername()%>">
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
				<div class="col-lg-4"></div>			
				<div class="row">
				<div class="col-lg-4">
					<button class="btn btn-danger mt-1 ml-3 mb-2 track1 " type="button" id="track1"> Track Your Order</button>
				</div>								
											<div class="col-12 col-md-10 hh-grayBox trackans" id="trackans" style="display:none;">
												<div class="row justify-content-between" >
												<%
													String status = "";
													List<ORPStatusBean>list11=ORPStatusdao.getRentOrderStatus(orpid, pid ,ub.getUserid());							
													for(ORPStatusBean osb1: list11)								    	          			
													{
														status = osb1.getStatus();
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
		</div>
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
							<a href="PCOnRentByUserID.jsp">Shop Now</a>				
						</div>
					</div>
		<%	  				
	  			}
		%>
	</div>

	<!-- <div id="buy-again" class="tabcontent">
	  <p>Paris is the capital of France.</p> 
	</div> -->

	<div id="cancel-orders" class="tabcontent">
		<%-- <%int cnt1=0; %>
		<%          			
	  		List<RentOrderCancelbean>list1=RentOrderCanceldao.getallcancelRentOrderByUserId(ub.getUserid());							
	  		for(RentOrderCancelbean o1: list1)								    	          			
	  		{
		%>	
				<% ++cnt1;%>		
		<%
		  	}
		%> --%>
		<% int cnt1=0;%>
		<%       
				cnt1=RentOrderCanceldao.getallCancelRentOrderByCnt(ub.getUserid());													
	  			if(cnt1 != 0)
	  			{
	  	%>	  			
			<a><h2 class="mb-3"> 
				 <p class="font-weight-bold float-left mr-1"><%out.println(cnt1); %> cancelled </p> order placed</h2> 
			</a>	
			<%          				
					List<RentOrderCancelbean>list3=RentOrderCanceldao.getallcancelRentOrderByUserId(ub.getUserid());							
			  		for(RentOrderCancelbean roc1: list3)								    	          			
			  		{			  
			%>									
						 <div class="row p-3 " style="height:auto;border:1px solid grey;font-weight:bold;">
						 	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
									<div class="box1">
										<p>Ordered Date</p>
										<p class="mt-2"><%out.println(roc1.getBookDate()); %></p>
									</div>
								</div>
								
								<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
									<div class="box3">
								 	 <%                                                	
					            		List<ORPbean>list2=ORPdao.getallORPByUserId1(ub.getUserid());							
					 	          		for(ORPbean orp1: list2)								    	          			
					     	      		{
					 	          		 if(orp1.getRentProid() == roc1.getRentProid()) 
					 	          		 {			
					     			%>
										<p style="color:#483d8b;">Order Id : <%out.println(orp1.getUserRentOrderid());%></p>
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
										<img src="../uploadimg/<%=roc1.getRentProPhoto1()%>" style="width:170px;height:auto;" height="100%" class="img img-responsive">
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
									<div class="box2">
										<p class="mb-2 font_size"><%out.println(roc1.getRentProName()); %></p>					
										<p class="mb-2 font_size">&#8377; <%out.println(roc1.getRentProductPrice()); %>/Month</p>
										<p class="mb-2 font_size">Duration:<%out.println(roc1.getDuration()); %>Month</p>
										<p class="mb-2 font_size">Qty:<%out.println(roc1.getRentQty()); %></p>
										<%
										  	int p = roc1.getRentProductPrice();
											int q = roc1.getRentQty();
											int d = roc1.getDuration();
											int total = p * q * d;
										%>
										<p class="mb-2 font-weight-bold font_size">&#8377; <%out.println(total); %></p>					
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"></div>
						</div>
		<%
		  			}
	  			}
	  			else
	  			{
		%>
					<div class="out_stock ">
						<h5 class="text-center font-weight-bold" style="color:black ! important;">No cancel rent orders</h5>					
					</div>	
		<%	  				
	  			}
		%>
	</div>
	<!-- ************************************************************************************** -->		
</div>

<jsp:include page="footer_user.jsp"></jsp:include>
</body>
<script type="text/javascript">
$('.track1').click(function()
{	
	$('.trackans').fadeToggle(1000);		
}); 
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
$(document).ready(function()
{	  
  /* 1. Visualizing things on Hover - See next part for action on click */
  $('#stars li').on('mouseover', function(){
    var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
   
    // Now highlight all the stars that's not after the current hovered star
    $(this).parent().children('li.star').each(function(e){
      if (e < onStar) {
        $(this).addClass('hover');
      }
      else {
        $(this).removeClass('hover');
      }
    });
    
  }).on('mouseout', function(){
    $(this).parent().children('li.star').each(function(e){
      $(this).removeClass('hover');
    });
  });
  
  
  /* 2. Action to perform on click */
  $('#stars li').on('click', function(){
    var onStar = parseInt($(this).data('value'), 10); // The star currently selected
    var stars = $(this).parent().children('li.star');
    
    for (i = 0; i < stars.length; i++) {
      $(stars[i]).removeClass('selected');
    }
    
    for (i = 0; i < onStar; i++) {
      $(stars[i]).addClass('selected');
    }
    
    // JUST RESPONSE (Not needed)
    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
    $('#rateus').val(ratingValue);
    var msg = "";
    if (ratingValue > 1) {
        msg = "Thanks! You rated this " + ratingValue + " stars.";
    }
    else {
        msg = "We will improve ourselves. You rated this " + ratingValue + " stars.";
    }
    responseMessage(msg);    
});
  
});

function responseMessage(msg) {
  $('.success-box').fadeIn(200);  
  $('.success-box div.text-message').html("<span>" + msg + "</span>");
}
</script>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>
<!-- ************************************************************************************** -->
</html>