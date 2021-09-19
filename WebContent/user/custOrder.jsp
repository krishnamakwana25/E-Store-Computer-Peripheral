<%@page import="DAO.Userdao"%>
<%@page import="bean.Userbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.CustomOrderBean" %>
<%@page import="DAO.CustOrderdao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<head>
<meta charset="ISO-8859-1">
<title>Custom Order </title>
<script src="resources/js/sweetalert2.all.min.js"  type="text/javascript"></script>
<link href="resources/css/payment_method.css" rel="stylesheet" type="text/css" media="all" />
<link href='//fonts.googleapis.com/css?family=Fugaz+One' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Alegreya+Sans:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<%
	Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
	int total=0,id;
	int qty=0;
	int price=0;
	int subtotal=0;
	String pcname="",catname="";
	
	List<CustomOrderBean>list=CustOrderdao.getallOrdersByUserId(ub.getUserid());							
	for(CustomOrderBean CustOrder: list)								    	          			
	{
		pcname = CustOrder.getPCName();
		id=CustOrder.getUser_id();
		qty=CustOrder.getQuantity();
		price=CustOrder.getCustproprice();
		subtotal = (qty) * (price);
		total +=(qty) * (price);
	}
%>
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
</style>

</head>
<body onload="preloader1()">
<div id="loading"></div>

<jsp:include page="header1_user.jsp"></jsp:include>
<div class='container'>
    <div class='row' style='padding-top:25px; padding-bottom:25px;'>
        <div class='col-md-12'>
            <div id='mainContentWrapper'>
            	<div class="col-lg-1"></div>
                <div class="col-md-10">
                    <h2 style="border-bottom :5px;text-align: center;font-size:25px !important;width: 100%;background-color: ;color:black; ;font-weight: bolder;">
                        Re-View Your Order & Complete Checkout
                    </h2>
                    <hr/>
                    <a href="CustomizeProductById.jsp" class="btn btn-info" style="width: 100%;">Add More Products & Services</a>
                    <hr/>
                    <div class="shopping_cart">
                    <!-- =====================================ORDER CMPLT====================================== -->
                        <form class="form-horizontal" role="form" action="<%=application.getContextPath() %>/CustOrderController" method="post" id="payment-form">
                            <div class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="font-size:25px !important;text-align: center;background-color: #ea8c19;color: white;font-weight: bolder;">
                                        <h4 class="panel-title">
                               					 <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><h2>Re-View
                                                Your Order</h2></a>
                                        </h4>
                                    </div>									      	
                                    <div id="collapseOne" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <div class="items">
                                                <div class="col-lg-12">                                                
										      	 <table border="1" class="table table-striped">
                                                     <tr>
									                	<td data-th="Product" >
															<div class="row">
																 <div><img src="resources/images/custom.jpg" style="height:170px; width:500px" class="img img-responsive"></div>
																  
															</div>
														</td>
														<td style="width:100px;">
															<ul style="font-size: 18px;">
																<li class="font-weight-bold"><b>Name of your PC: <% out.println(pcname);%></b></li> 
                                                            	<li>Total Price : <b> <% out.println(total);%>&#8377;</b></li><br><br>
                                                            </ul>
														</td>
                                                        <td style="width:100px;">
                                                            <ul style="font-size: 18px;">
                                                                
                                                                <!--  <li class="font-weight-bold">Categories :  Items Name</li> -->                                                               
                                                                      <%                                                	
														              	List<CustomOrderBean>list4=CustOrderdao.getallOrdersByUserId(ub.getUserid());							
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
										    	          					<a style="font-size: 16px !important;"><td><%out.println(catname);%></td><td><% out.println(CustOrder.getProname());%></td><td style="width:100px;"><%out.println(CustOrder.getCustproprice());%>&#8377;</td></a>
										    	          					</tr>	  
										    	          			  	<%
													        	      		}
																		%>                                                                                                                                                                             
                                                            </ul>                                                               
                                                        </td>
	                                                    <td style="width:200px;">
	                                                         <form method="post" action="<%=application.getContextPath()%>/CustOrderController">
	                                                              <input type="submit" class="btn btn-warning btn-md mt-1 dltbtn" name="action" value="Re-List"  title="Remove Items & Re-List">                                                          		                                                                                                                                                                                                                                                                    
	                                                         </form>		                                                     
	                                                     </td>    
	                                                     <td style="width:auto;"> </td>
	                                                     <td></td>
                                                        </tr>                                          
                                                    </table>                           
                                                </div>                                                
                                            </div> 
                                        </div>
                                    </div>                                    
                                </div>
                            </div>
                            </form>    
                            <!-- =====================================ORDER CMPLT====================================== -->  
                            <!-- =====SHIPPING INFORMATION======= -->
                           <jsp:include page="custShippingInfo.jsp"></jsp:include>
                            <!-- =====SHIPPING INFORMATION OVER======= -->
                            
                               <!-- =====PAYMENT INFORMATION======= -->
                           <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <div style="text-align: center;"><a data-toggle="collapse"
                                                                            data-parent="#accordion"
                                                                            href="#collapseThree"
                                                                            class=" btn   btn-success" id="payInfo"
                                                                            style="width:100%;display: none;" onclick="$(this).fadeOut();  
                   document.getElementById('collapseThree').scrollIntoView()">Enter Payment Information</a>
                                        </div>
                                    </h4>
                         	    </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                            <b>Payment Information</b>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <span class='payment-errors'></span>
                                 	    <fieldset>                                                                            
                                         <div class="content">		
												<script src="resources/js/easyResponsiveTabs.js" type="text/javascript"></script>
												<script type="text/javascript">
													$(document).ready(function () {
														$('#horizontalTab').easyResponsiveTabs({
															type: 'default', //Types: default, vertical, accordion           
															width: 'auto', //auto or any width like 600px
															fit: true   // 100% fit in a container
														});
													});													
												</script>	
												
											<div class="sap_tabs">
													<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
														<div class="pay-tabs" style="height: 242px;width: 500px;">
															<h2><!-- Select  -->Payment Method</h2>
															<input type="radio" name="COD" id="COD" class="COD" value="Cash On Delivery">Cash On Delivery																
														</div>
													</div>
											<%                                                	
											List<CustomOrderBean>list2=CustOrderdao.getLastProducts(ub.getUserid());							
					    	          		for(CustomOrderBean CustOrder: list2)								    	          			
					        	      		{
									      	%>	
										      	<%	if(ub.getUserid() == CustOrder.getUser_id())
						           					{ 
						           				%>											 
												<form method="post" action="<%= application.getContextPath()%>/CustomeOPController">
													<input type="hidden" name="CustOrderid" id="CustOrderid" value="<%= CustOrder.getCustorderid()%>">        
													<input type="hidden" name="userid" id="userid" value="<%= CustOrder.getUser_id()%>">
													<input type="hidden" name="username" id="username" value="<%= ub.getUsername()%>">
													<input type="hidden" name="pcname" id="pcname" value="<%= pcname%>">
													<input type="hidden" name="orderdate" id="orderdate" value="<%= CustOrder.getBook_date()%>">
													<input type="hidden" name="totalprice" id="totalprice" value="<%= total%>">
													<input type="hidden" type="radio" name="COD" id="COD" class="COD" value="Cash On Delivery" required>
											 	 <%
								        	      	}
												 %>	
											<%
							        	     }
											%>																								  
													<input type="submit" name="action" class="btn btn-success btn-lg paynow" style="width:100%;" disabled value="Place Order" onclick="validate()"><br/>
								                 </form>	     
							                       <div style="text-align:left;"><br/>
							                           By submitting this order you are agreeing to our <a href="Terms_ConditionsByUser.jsp">terms of service</a>.
							                           If you have any questions about our products or services please contact us
							                   		    before placing this order.
							                       </div>
												</div>																							
											</div>                                          
                                        </fieldset>                                       
                                    </div>
                                </div>
                            </div>
                            <!-- =====PAYMENT INFORMATION OVER======= -->                                                                           
						</div>
                </div>      
                <div class="col-lg-1"></div>         
            </div>
        </div>
    </div> 					
</div>			
<!-- footer -->
<jsp:include page="footer_user.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function() 
	{
		$('.COD').click(function () 
			{
				$('.paynow').attr('disabled',false); 				
			});	
	});	

	function validate()
	{
		Swal.fire({
			title: 'Order Confirmation ',
			text: "Your order has been succesfully placed !",
			icon:'success',	
			showCancelButton:false,
			confirmButtonColor:'#3085d6',
			confirmButtonText:'Continue Shopping',
		}).then((result)=> {
			if(result.value){
				$.ajax({
					success:function(data){							
						window.location.href="index1_user.jsp";
					}
				}) 
			}
			else
			{
				window.location.href="index1_user.jsp";
			}
		})
	}
</script>
 <!-- //footer -->
 <script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>
</body>
</html>
<%-- <%@page import="DAO.Userdao"%>
<%@page import="bean.Userbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.CustomOrderBean" %>
<%@page import="DAO.CustOrderdao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<head>
<meta charset="ISO-8859-1">
<title>Custom Order </title>
<script src="resources/js/sweetalert2.all.min.js"  type="text/javascript"></script>
<link href="resources/css/payment_method.css" rel="stylesheet" type="text/css" media="all" />
<link href='//fonts.googleapis.com/css?family=Fugaz+One' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Alegreya+Sans:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<%
	Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
	int total=0,id;
	int qty=0;
	int price=0;
	int subtotal=0;
	String pcname="",catname="";
	
	List<CustomOrderBean>list=CustOrderdao.getallOrdersByUserId(ub.getUserid());							
	for(CustomOrderBean CustOrder: list)								    	          			
	{
		pcname = CustOrder.getPCName();
		id=CustOrder.getUser_id();
		qty=CustOrder.getQuantity();
		price=CustOrder.getCustproprice();
		subtotal = (qty) * (price);
		total +=(qty) * (price);
	}
%>
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
</style>

</head>
<body onload="preloader1()">
<div id="loading"></div>

<jsp:include page="header1_user.jsp"></jsp:include>
<div class='container'>
    <div class='row' style='padding-top:25px; padding-bottom:25px;'>
        <div class='col-md-12'>
            <div id='mainContentWrapper'>
            	<div class="col-lg-1"></div>
                <div class="col-md-10">
                    <h2 style="border-bottom :5px;text-align: center;font-size:25px !important;width: 100%;background-color: ;color:black; ;font-weight: bolder;">
                        Re-View Your Order & Complete Checkout
                    </h2>
                    <hr/>
                    <a href="CustomizeProductById.jsp" class="btn btn-info" style="width: 100%;">Add More Products & Services</a>
                    <hr/>
                    <div class="shopping_cart">
                    <!-- =====================================ORDER CMPLT====================================== -->
                        <form class="form-horizontal" role="form" action="<%=application.getContextPath() %>/CustOrderController" method="post" id="payment-form">
                            <div class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="font-size:25px !important;text-align: center;background-color: #ea8c19;color: white;font-weight: bolder;">
                                        <h4 class="panel-title">
                               					 <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><h2>Re-View
                                                Your Order</h2></a>
                                        </h4>
                                    </div>									      	
                                    <div id="collapseOne" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <div class="items">
                                                <div class="col-lg-12">                                                
										      	 <table border="1" class="table table-striped">
                                                     <tr>
									                	<td data-th="Product" >
															<div class="row">
																 <div><img src="resources/images/custom.jpg" style="height:170px; width:300px" class="img img-responsive"></div> 
															</div>
														</td>
                                                        <td style="width:400px;">
                                                            <ul style="font-size: 18px;">
                                                                <li class="font-weight-bold"><b>Name of your PC: <% out.println(pcname);%></b></li> 
                                                                <li>Total Price : <b> <% out.println(total);%>&#8377;</b></li><br><br>
                                                                 <li class="font-weight-bold">Categories :  Items Name</li>                                                               
                                                                      <%                                                	
														              	List<CustomOrderBean>list4=CustOrderdao.getallOrdersByUserId(ub.getUserid());							
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
										    	          					<li style="font-size: 16px !important;"><%out.println(catname);%> : <% out.println(CustOrder.getProname());%> - <%out.println(CustOrder.getCustproprice());%>&#8377;</li>	  
										    	          			  	<%
													        	      		}
																		%>                                                                                                                                                                             
                                                            </ul>                                                               
                                                        </td>
	                                                    <td>
	                                                         <form method="post" action="<%=application.getContextPath()%>/CustOrderController">
	                                                              <input type="submit" class="btn btn-warning btn-md mt-1 dltbtn" name="action" value="Re-List"  title="Remove Items & Re-List">                                                          		                                                                                                                                                                                                                                                                    
	                                                         </form>		                                                     
	                                                     </td>                                                                 
                                                        </tr>                                          
                                                    </table>                           
                                                </div>                                                
                                            </div> 
                                        </div>
                                    </div>                                    
                                </div>
                            </div>
                            </form>    
                            <!-- =====================================ORDER CMPLT====================================== -->  
                            <!-- =====SHIPPING INFORMATION======= -->
                           <jsp:include page="custShippingInfo.jsp"></jsp:include>
                            <!-- =====SHIPPING INFORMATION OVER======= -->
                            
                               <!-- =====PAYMENT INFORMATION======= -->
                           <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <div style="text-align: center;"><a data-toggle="collapse"
                                                                            data-parent="#accordion"
                                                                            href="#collapseThree"
                                                                            class=" btn   btn-success" id="payInfo"
                                                                            style="width:100%;display: none;" onclick="$(this).fadeOut();  
                   document.getElementById('collapseThree').scrollIntoView()">Enter Payment Information »</a>
                                        </div>
                                    </h4>
                         	    </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                            <b>Payment Information</b>
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <span class='payment-errors'></span>
                                 	    <fieldset>                                                                            
                                         <div class="content">		
												<script src="resources/js/easyResponsiveTabs.js" type="text/javascript"></script>
												<script type="text/javascript">
													$(document).ready(function () {
														$('#horizontalTab').easyResponsiveTabs({
															type: 'default', //Types: default, vertical, accordion           
															width: 'auto', //auto or any width like 600px
															fit: true   // 100% fit in a container
														});
													});													
												</script>	
												
											<div class="sap_tabs">
													<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
														<div class="pay-tabs" style="height: 242px;width: 500px;">
															<h2><!-- Select  -->Payment Method</h2>
															<input type="radio" name="COD" id="COD" class="COD" value="Cash On Delivery">Cash On Delivery																
														</div>
													</div>
											<%                                                	
											List<CustomOrderBean>list2=CustOrderdao.getLastProducts(ub.getUserid());							
					    	          		for(CustomOrderBean CustOrder: list2)								    	          			
					        	      		{
									      	%>	
										      	<%	if(ub.getUserid() == CustOrder.getUser_id())
						           					{ 
						           				%>											 
												<form method="post" action="<%= application.getContextPath()%>/CustomeOPController">
													<input type="hidden" name="CustOrderid" id="CustOrderid" value="<%= CustOrder.getCustorderid()%>">        
													<input type="hidden" name="userid" id="userid" value="<%= CustOrder.getUser_id()%>">
													<input type="hidden" name="username" id="username" value="<%= ub.getUsername()%>">
													<input type="hidden" name="pcname" id="pcname" value="<%= pcname%>">
													<input type="hidden" name="orderdate" id="orderdate" value="<%= CustOrder.getBook_date()%>">
													<input type="hidden" name="totalprice" id="totalprice" value="<%= total%>">
													<input type="hidden" type="radio" name="COD" id="COD" class="COD" value="Cash On Delivery" required>
											 	 <%
								        	      	}
												 %>	
											<%
							        	     }
											%>																								  
													<input type="submit" name="action" class="btn btn-success btn-lg paynow" style="width:100%;" disabled value="Place Order" onclick="validate()"><br/>
								                 </form>	     
							                       <div style="text-align:left;"><br/>
							                           By submitting this order you are agreeing to our <a href="#">terms of service</a>.
							                           If you have any questions about our products or services please contact us
							                   		    before placing this order.
							                       </div>
												</div>																							
											</div>                                          
                                        </fieldset>                                       
                                    </div>
                                </div>
                            </div>
                            <!-- =====PAYMENT INFORMATION OVER======= -->                                                                           
						</div>
                </div>      
                <div class="col-lg-1"></div>         
            </div>
        </div>
    </div> 					
</div>			
<!-- footer -->
<jsp:include page="footer_user.jsp"></jsp:include>
<script type="text/javascript">
	$(document).ready(function() 
	{
		$('.COD').click(function () 
			{
				$('.paynow').attr('disabled',false); 				
			});	
	});	

	function validate()
	{
		Swal.fire({
			title: 'Order Confirmation ',
			text: "Your order has been succesfully placed !",
			icon:'success',	
			showCancelButton:false,
			confirmButtonColor:'#3085d6',
			confirmButtonText:'Continue Shopping',
		}).then((result)=> {
			if(result.value){
				$.ajax({
					success:function(data){							
						window.location.href="index1_user.jsp";
					}
				}) 
			}
			else
			{
				window.location.href="index1_user.jsp";
			}
		})
	}
</script>
 <!-- //footer -->
 <script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>
 
</body>
</html> --%>