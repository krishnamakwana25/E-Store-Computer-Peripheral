<%@ page language="java" contentType="text/html; charset=ISO-8859-1"    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Userbean" %>
<%@page import="DAO.Userdao" %>    
<%@ page import="DAO.Rentproddao" %>
<%@ page import="bean.Rentprodbean" %>  
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<head>
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
	background-color:#ff8c00; /*#ff8600    #ff7f50*/
	padding-top:9px;
}
.rentprice, .durationval, .rentqty, .deposite, .total
{
	text-align: center;
	font-size: 1vw;
	border:none !important;
}
.deposite1
{
	text-align: center;
	font-size: 1vw;
	border:none !important;
	background-color:  #2f4f4f;
}
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Print Estimate</title>
<link rel="stylesheet" href="">
<script src="resources/js/sweetalert2.all.min.js" type="text/javascript"></script>
<jsp:include page="script.jsp"></jsp:include>
</head>
<body onload="preloader1()">
<div id="loading"></div>

<jsp:include page="header1_user.jsp"></jsp:include>
<%
	int rqty = Integer.parseInt(request.getParameter("rentqty"));
	Rentprodbean rpb = Rentproddao.getRentProductById((Integer) session.getAttribute("rid"));
	Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
%>
<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">	
			<ol class="breadcrumb breadcrumb1 animated wow " data-wow-delay=".5s">
				<li><a href="index1_user.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<!-- <li><a href="PCOnRentByUserID.jsp">Rent Products</a></li> -->
				<li><a href="PCOnRentByUserID.jsp">Rent Products </a></li>
				<li class="active">Rent Form</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->

<div class="container-fluid rentform1">
	<div class="row">
		<div class="col-sm-8 col-md-8 col-lg-8">			
			<div class="rentform rentform1">		
				<h3 class="animated wow " data-wow-delay=".5s">Rent Form Here</h3>
				<div class="rentform1" data-wow-delay=".5s">    
					<form class="animated wow" data-wow-delay=".5s" method="post" data-parsley-validate>
					<div class="form-group">   
							<input type="text" name="usernm" id="usernm" placeholder="User Name" value="<%=ub.getUsername() %>" readonly><br>
							<input type="email" name="email" id="email" placeholder="Email Address" value=<%=ub.getMail() %> readonly><br>
							<input type="text" name="pronm" id="pronm" placeholder="Product Name"value="<%=rpb.getRentProName()%>" readonly><br>
							<input type="text" name="proprice" id="proprice" placeholder="Price" value="<%=rpb.getRentProductPrice()%>" readonly><br>			
							<input type="text" name="proqty" id="proqty" placeholder="Quantity" value="<%=rqty%>" required data-parsley-type="integer" required data-parsley-trigger="change" data-parsley-minlength="1" max="<%=rpb.getRentProductQty1()%>" data-parsley-type="integer"> 							
							<br><br>		
							<select class="form-control" required id="selectduration" name="selectduration" data-parsley-trigger="change" onchange="DurationFun();">    
		                      	  	<option value=" ">Please Select Duration</option>    
		                          	<option value="1">1 Month</option>
		                          	<option value="2">2 Month</option>
		                          	<option value="3">3 Month</option>
		                          	<option value="4">4 Month</option>
		                          	<option value="5">5 month</option>
		                          	<option value="6">6 month</option>
		                          	<option value="12">12 month</option>
		          	        </select><br>       		       
		          	           	      
		          	        <% 
								int proid = rpb.getRentProid();
								int q = Rentproddao.GetTotalQTY(proid);
								if(q != 0)
								{
							%>   
						<!-- 	<input type="submit" class="submit_1"  value="Continue"> -->							
		          	    <!--     <input class="submit_1" type="submit" value="Continue" name="action" id="btnregister"><br> -->
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
						<!-- <button id="next_btn" class="btn btn-warning mt-4 w-100 mx-auto " onchange="DurationFun();">Get Estimate</button> -->								
					</form>
				</div>					
			</div>			
		</div>
		<div class="col-sm-4 col-md-4 col-lg-4">
			<div class="form1_img1 mt-5">
				 <img alt="image" src="resources/images/rentimg.jpg" width="100%" height="100%" class="img img-responsive">
			</div>
		</div>
	</div>
</div>

<div class="container rentform2 mb-3" style="display:none;">	
		<button id="next_btn" class="btn btn-warning mt-4 w-100 mx-auto ">Get Estimate</button>
		<div class="row mt-3 pt-3 my_reciept" style="display: none;">
			<div class="col-lg-1"></div>
			<div class="col-lg-10">
				<div class="estimate" style="overflow-x: auto;">
				<form  action="<%=application.getContextPath()%>/RentOrderController" method="post" data-parsley-validate="true">
					<table class="table table-bordered" style="table-layout: fixed;">						
						<thead class="bg-info text-white font-weight-bold">
							<tr>
								<th class="bg-info text-white font-weight-bold" style="font-size: 1.3vw;"><h5>Product Estimate Details</h5></th>
								<input type="hidden" name="rid" value=<%=rpb.getRentProid() %>>
								<input type="hidden" name="unm" id="unm" value="<%= ub.getUsername()%>">				
								<input type="hidden" name="mobileno" id="mobileno" value="<%= ub.getMobnum()%>">
								<input type="hidden" name="address" id="address" value="<%= ub.getAdd()%>">	
								<th colspan="2"><button type="button" class="btn btn-warning float-left" id="goback"> <i class="fa fa-arrow-left"></i> Go Back</button>
								<!-- <button type="button" class="btn btn-warning float-right" name="action" value="Continue">Continue <i class="fa fa-arrow-right"></i></button> -->
								 <input class="btn btn-warning float-right" type="submit" value="Continue" name="action" name="btnregister" id="btnregister"><!--  <i class="fa fa-arrow-right"></i><br> -->
								</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td rowspan="6">
									<div class="est_img m-auto">
										<img src="../uploadimg/<%=rpb.getRentProPhoto1() %>" height="100%" width="100%" alt="img">
									</div>
								</td>
								<td name="pronm" id="pronm"><h6 >Product Name</h6></td>
								<td style="text-align: center; font-size: 1vw"><% out.println(rpb.getRentProName()); %></td>

							</tr>
							<tr>
								<td><h6>Rent per Month</h6></td>
								<td><input type="text" class="rentprice" name="rentprice" id="rentprice" readonly></td>
							</tr>
							<tr>
								<td><h6>Selected Duration(Months)</h6></td>
								<td><input type="text" class="durationval"  id="durationval" name="durationval" readonly></td>
							</tr>
							<tr>
								<td><h6>Quantity</h6></td>										
								<td><input type="text" class="rentqty" id="rentqty" name="rentqty" readonly></td>
							</tr>

							<tr>
								<td><h6>Total</h6></td>
								<td><input type="text" class="total"  id="renttotal" name="total" readonly></td>
							</tr>
							
							<tr>
								<td><h6>Deposite<a class="text-danger text-left m-2">* For Security Reason *</a></h6></td>
								<td><input type="text" class="deposite" name="deposite" id="deposite" readonly></td>
								
							</tr>
							
							<tfoot class="bg-dark text-white font-weight-bold">
							<tr>
								<td colspan="2" class="text-center" style="font-size: 1.5vw;color:white;">
								<h3>Total Rent</h3>
								</td>
								<td><input class="deposite1" name="deposite1" id="deposite1" readonly  style="font-size:20px;color:white;"></td>							
							</tr>
						</tfoot>						
					</tbody>
				</table>
				</form>
			 </div>
		   </div>
		<div class="col-lg-1"></div>
	</div>
</div>	
<!-- footer -->
<jsp:include page="footer_user.jsp"></jsp:include>
<!-- //footer -->
<script type="text/javascript">
function DurationFun()
{	
	var d = $('#selectduration').val();
	if(d==" ")
	{
		 Swal.fire({
				title: 'Thank You for your request ',
				text: "Please Select a Duration For Order this Product",
				icon:'info',	
				
			
				}) 			
	}
	else
	{
		 Swal.fire({
				title: 'Thank You for your request ',
				text: "Duration Selected Succesfully..!",
				icon:'success',
				showCancelButton:false,
				confirmButtonColor:'#3085d6',
				cancelButtonColor:'#d33',
				confimButtonText: 'Get Estimate !',
				}) 
		$(".submit_1").hide();		
		$('.rentform1').hide();			
		$('.rentform2').show(); 
	}	
}	

jQuery(document).ready(function($) 
{
	var duration, qty, price, total, deposite ;
	$('#next_btn').click(function(event) 
	{		
		duration = $('#selectduration').val();
		qty = $('#proqty').val();
		price = $('#proprice').val();
		total = duration * qty * price ;
		deposite = total * 2;
		$('.my_reciept').slideDown(2000);
			
		$('#durationval').val(duration);
	
		$('#rentqty').val(qty);
	
		$('#rentprice').val(price);
		 
		$('#renttotal').val(total);
		
		$('#deposite').val(total);
		
		$('#deposite1').val(deposite);

	});
	
	$('#goback').click(function ()
	{
		$('.rentform1').slideDown(2000);
		$('.rentform2').hide();
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