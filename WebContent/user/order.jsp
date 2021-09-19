<%@page import="DAO.Userdao"%>
<%@page import="bean.Userbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Orderbean" %>
<%@page import="DAO.Orderdao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<link rel="Icon" type="image/jpg" href="resources/images/logo1.jpg">
<head>
<meta charset="ISO-8859-1">
<title>My Order</title>
<script src="resources/js/sweetalert2.all.min.js"  type="text/javascript"></script>
<link href="resources/css/payment_method.css" rel="stylesheet" type="text/css" media="all" />
<link href='//fonts.googleapis.com/css?family=Fugaz+One' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Alegreya+Sans:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>
<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<%
	Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
	int total=0,id,cnt=0;
	int qty=0;
	int price=0;
	int subtotal=0;
%>
</head>
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
                    <a href="index1_user.jsp" class="btn btn-info" style="width: 100%;">Add More Products & Services</a>
                    <hr/>
                    <div class="shopping_cart">
                    <!-- =====================================ORDER CMPLT====================================== -->
                        <form class="form-horizontal" role="form" action="<%=application.getContextPath() %>/OrderController" method="post" id="payment-form">
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
                                                <%                                                	
									              	List<Orderbean>list=Orderdao.getallOrdersByUserId(ub.getUserid());							
								    	          		for(Orderbean Order: list)								    	          			
								        	      		{
										      	%>	
                                                    <table border="1" class="table table-striped">
                                                      <!--   <table class="table table-responsive table-hover"> -->
                                                     <tr>
	                                                     <%
	                                                     id=Order.getUserid();
														 qty=Order.getProductQty();
														price=Order.getProductPrice();
														subtotal = (qty) * (price);
														total +=(qty) * (price);
														%>	
											                	<td data-th="Product" >
																	<div class="row">
																		<div><img src="../uploadimg/<%=Order.getProductPhoto1()%>" style="height:; width:150px" class="img img-responsive"></div>
																	</div>
																</td>
	                                                            <td style="width:400px;">
	                                                                <ul style="font-size: 18px;">
	                                                                    <li>Name : <% out.println(Order.getProductName());%></li> 
	                                                                    <li>Price : <b> <% out.println(Order.getProductPrice());%>&#8377;</b></li>
	                                                             		<li>Quantity : <% out.println(Order.getProductQty());%></li>                                                                   		  
	                                                                    <li>Total Price : <b> <% out.println(subtotal);%>&#8377;</b></li>                                                                                                                                                                              
	                                                                </ul>                                                               
	                                                            </td>
	                                                            <td>
	                                                            <%
	                                                            cnt = Orderdao.getTotalItem();
	                                                            if(cnt == 1)
                                                            	{
	                                                            	%>
	                                                            	<form method="POST" >                                                         
			                                                           <input type="hidden" name="uid" id="uid" value="<%= Order.getUserid()%>">
			                                                           <input type="hidden" name="delorderid" id="delorderid" value="<%= Order.getOrderid()%>">
			                                                           <input type="hidden" name="orderid" id="orderid" cid="<%= Order.getOrderid()%>">                                                           
			                                                           <input type="submit" class="btn btn-warning btn-md mt-1 dltbtn1" id="<%= Order.getOrderid()%>" name="action" value="X"  title="Remove Item">                                                                                                                                                                                                                                    
		                                                            </form>
	                                                            	<%
                                                            	}
	                                                           else
                                                            	{
	                                                             %>
	                                                               <form method="POST" >                                                         
			                                                           <input type="hidden" name="uid" id="uid" value="<%= Order.getUserid()%>">
			                                                           <input type="hidden" name="delorderid" id="delorderid" value="<%= Order.getOrderid()%>">
			                                                           <input type="hidden" name="orderid" id="orderid" cid="<%= Order.getOrderid()%>">                                                           
			                                                           <input type="submit" class="btn btn-warning btn-md mt-1 dltbtn" id="<%= Order.getOrderid()%>" name="action" value="X"  title="Remove Item">                                                                                                                                                                                                                                    
		                                                            </form>
	                                                             <%
	                                                            }
		                                                         %>
	                                                           </td>                                                                 
                                                        </tr>    
                                                        <hr style="line-height:50px;">                                      
                                                    </table>
                                                    <%
								        	      		}
								          	        %>
                                                </div>                                                
                                            </div> <!-- OVER ORDER -->
                                             <div class="col-lg-12">
                                                    <div style="text-align: center; font-weight: bolder;font-size: 20px;">
                                                        <h2><b>Order Total :</b><span style="color:green;"> <b><%=total %></b></span></h2>
                                                    </div>
                                                </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            </form>    
                            <!-- =====================================ORDER CMPLT====================================== -->  
                            <!-- =====SHIPPING INFORMATION======= -->
                           <jsp:include page="shippingInfoOrder.jsp"></jsp:include>
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
                                         <%--  <jsp:include page="payment_method.jsp"></jsp:include> --%>
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
									              	List<Orderbean>list1=Orderdao.getallOrdersByUserId(ub.getUserid());							
								    	          		for(Orderbean Order: list1)								    	          			
								        	      		{
										      	%>	
											      	<%	if(ub.getUserid() == Order.getUserid())
							           					{ 
							           				%>											 
												<form method="post" action="<%= application.getContextPath()%>/OrderProductController">
														<input type="hidden" name="orderid" id="orderid" value="<%= Order.getOrderid()%>">        
														<input type="hidden" name="userid" id="userid" value="<%= Order.getUserid()%>">
														<input type="hidden" name="username" id="username" value="<%= Order.getUsername()%>">
														<input type="hidden" name="pnm" id="pnm" value="<%= Order.getProductName()%>">
														<input type="hidden" name="pid" id="pid" value="<%= Order.getProductid()%>">
														<input type="hidden" name="orderdate" id="orderdate" value="<%= Order.getBookdate()%>">
														<input type="hidden" name="qty" id="qty" value="<%= Order.getProductQty() %>">
														<input type="hidden" name="price" id="price" value="<%= Order.getProductPrice()%>">
														<input type="hidden" name="total" id="total" value="<%= Order.getProductTotalPrice() %>">
														<input type="hidden" type="radio" name="COD" id="COD" class="COD" value="Cash On Delivery" required>
												 	<%
									        	      		}												
								        	      		}
												%>
																									  
												<input type="submit" name="action" class="btn btn-success btn-lg paynow" style="width:100%;" disabled value="Place Order" onclick="validate()">						
								                   <br/>
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
	$(".dltbtn").click(function(e){
		e.preventDefault();
		var element=$(this);		
		Swal.fire({
			title: 'Are you sure you want to delete this Product ? ',
			text: "",
			icon:'warning',
			showCancelButton:true,
			confirmButtonColor:'#3085d6',
			cancelButtonColor:'#d33',
			confimButtonText: 'Yes, delete it !',
		}).then((result)=> {
			if(result.value){
				orderid=element.attr('id');
				$.ajax({
					url:"../OrderController",
					type: "GET",
					data:{orderid,orderid},
					success:function(data){
						Swal.fire({
							title:'Deleted!',
							text:'Your data has been deleted.',
							icon:'success',
							showConfirmButton:false,
							timer:55000
						})
						window.location.href="order.jsp";
					}
				})
			}
		})
	});

	$(".dltbtn1").click(function(e){
		e.preventDefault();
		var element=$(this);		
		Swal.fire({
			title: 'Are you sure you want to delete this Product ? ',
			text: "",
			icon:'warning',
			showCancelButton:true,
			confirmButtonColor:'#3085d6',
			cancelButtonColor:'#d33',
			confimButtonText: 'Yes, delete it !',
		}).then((result)=> {
			if(result.value){
				orderid=element.attr('id');
				$.ajax({
					url:"../OrderController",
					type: "GET",
					data:{orderid,orderid},
					success:function(data){
						Swal.fire({
							title:'Deleted!',
							text:'Your data has been deleted.',
							icon:'success',
							showConfirmButton:false,
							timer:55000
						})
						window.location.href="index1_user.jsp";
					}
				})
			}
		})
	});
	
	$(document).ready(function() 
	{
		$('.COD').click(function () 
		{
			$('.paynow').attr('disabled',false); 
		
		});	
	});		 
</script>
<script type="text/javascript">
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
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

 <!-- //footer -->
</body>
</html>

