<%@page import="DAO.Userdao"%>
<%@page import="bean.Userbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.CustomListBean" %>
<%@page import="DAO.CustListDao" %>
<%@page import="bean.Orderbean" %>
<%@page import="bean.CustomOrderBean" %>
<%@page import="DAO.Orderdao" %>
<%@page import="DAO.CustOrderdao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.pcname
{
	box-shadow:0px 2px 8px grey;
	width:30px !important;
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
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<title>My List</title>
<jsp:include page="script.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- SWEET ALERT -->
<script src="resources/js/sweetalert2.all.min.js"  type="text/javascript"></script>
<!-- SWEET ALERT OVER-->
<%
	 Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
		int mainTotal = 0,cnt1 = 0, qty,price,subtotal=0,qty1,c=0;
		String name = "";
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Custom Cart List</title>
</head>
<body onload="preloader1()">
<div id="loading"></div>

<jsp:include page="header1_user.jsp"></jsp:include>
<div class="container">
	<%       
		c=CustListDao.getCount(ub.getUserid());													
 		if(c != 0)
 		{
	%>     
	<table id="cartTable" border="2" class="table table-responsive-lg table-hover" style="table-layout: fixed;"> 
	<thead class="thead_cls">
		<tr>
			<th style=" text-align: center;">Sr. No</th>
			<th> Product</th>
			<th> Product Name</th>
			<th style="text-align: center;"> Price</th>
			<th style=" text-align: center;"> Quantity</th>
			<th style=" text-align: center;"> SubTotal </th>                        	  		
			<th style=" text-align: center;">Remove</th>
		</tr> 
	</thead>					
			<%
	              	List<CustomListBean>list=CustListDao.getCustListByUserId(ub.getUserid());							
    	          		for(CustomListBean custlist: list)
        	      		{
           	%>					
					<tbody>
						<tr class="cartdata">
						 <td style="text-align: center;"><%=++cnt1%></td>
							<td data-th="Product">
							<img src="../uploadimg/<%=custlist.getProphoto1()%>" style="width:150px;height:auto;" height="100%" class="img img-responsive">
							</td>
							<td data-th="Product">
								<h4 class="nomargin"><% out.println(custlist.getProname());%>							
							</td>							
							<td name="price" data-th="Price" class="product-price"><p class="ml-5">&#8377;<% out.println(custlist.getCustproprice());%></p></td>
							<td style="width:170px;">	
								<div class="quantity"  style="margin-left:20px;">									 
								<div class="product-quantity">  <%--<%=cart.getProductQty()%> --%>
								<div class="form-group">
								<input type="text" class="form-control" disabled value="<% out.println(custlist.getQty());%>" name="qty" style="margin-left:20px;text-align:center;width:50px;">																	
								<input type="hidden" class="product-quantity" name="cid" id="cid" value="<%=custlist.getCustomizeprodid()%>">
								<input type="hidden" type="submit" class="btn btn-primary" name="action" value="Update">
								</div>						                           																	
								</div>
								</div>																													  														
							</td>			
							<%
									 qty=custlist.getQty();
									price=custlist.getCustproprice();
									subtotal = qty * price ;
									custlist.setSubtotalprice(subtotal);
							%>							
						<td class="ml-5 "><label class=" ml-5" ><%=subtotal = (qty) * (price)%></label></td>						
							
							<%mainTotal +=(qty) * (price);
							custlist.setTotalprice(mainTotal);
							%>							
							<td class="actions" data-th="">					
	                        <form method="post" action="<%=application.getContextPath()%>/CustListController">
	                             <input type="submit" class="btn btn-warning btn-md mt-1 ml-4" name="action" value="Re-List"  title="Remove Items & Re-List">                                                          		                                                                                                                                                                                                                                                                    
	                        </form>		                                                     														
							</td>
						</tr>
					</tbody>		
					<%
       	      			}
          	        %>			
          	        						
					<tfoot>
					<%
	              	List<CustomListBean>list1=CustListDao.getCustListByUserId(ub.getUserid());							
    	          		for(CustomListBean custlist: list1)
        	      		{
           			%>			
           				<%	if(ub.getUserid() == custlist.getUser_id())
           					{ 
           				%>
							<form action="<%=application.getContextPath()%>/CustOrderController" method="post" >
								<input type="hidden" name="cartid" id="cartid" value="<%= custlist.getList_id()%>">
								<input type="hidden" name="proid" id="proid" value="<%=custlist.getCustomizeprodid()%>">
								<input type="hidden" name="price" id="price" value=<%=custlist.getCustproprice()%>>
								<input type="hidden" name="qty1" id="qty1" value=<%=custlist.getQty()%>>								
								 <input type="hidden" name="totalamt" id="totalamt" value=<%=mainTotal %>>
								<input type="hidden" name="userid" id="userid" value="<%= custlist.getUser_id()%>">
								<input type="hidden" name="unm" id="unm" value="<%= ub.getUsername()%>">				
								<input type="hidden" name="mobileno" id="mobileno" value="<%= ub.getMobnum()%>">
								<input type="hidden" name="address" id="address" value="<%= ub.getAdd()%>">								
           				 <%
           					}
           				
           				 %>					
				   	 <%
    	      			}
          	         %>	
          	 				<tr>
          	 					<td>
								<a href="CustomizeProductById.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
								<td colspan="1"></td>								
          	 					<td class="">          	 					
          	 						<div class="form-group ">
          	 						<%
          	 						List<CustomOrderBean>list2=CustOrderdao.getAllOrdersPCName();							
          	    	          		for(CustomOrderBean custlist: list2)
          	        	      		{
          	    	          			 name = custlist.getPCName();
          	           				%>
          	           				<%
 									}
          	 						%>	
	          	           				<input type="hidden" class="pcnmae1" id="checkpcname1" value = "<%= name%>">
          	 							<label class="font-weight-bold">PC Name : </label>
          	 							<input type="text" name="pcname" id="checkpcname" class="form-dontrol" placeholder="Give name to the your PC" required size="20">
          	 						</div>
          	 						
          	 					</td>
          	 					<td colspan="1"></td>	          	 															
								<td class="totals-value font-weight-bold" style="font-size: 20px; color:#808080;" name="maintotal" id="cart-total" >
								Grand Total : 
								<td class="font-weight-bold" style="font-size:21px; color:#808080; "><u><%=mainTotal %></u></td>																																														 
								 <td>
									 <input type="submit" class="btn btn-success btn-block" name="action" value="Checkout" onclick="CheckPCName();">
			                    </td>											
							</tr>											
							 </form>					 												  	
					</tfoot>									
				</table>
			<% 		
					}
					else
					{
			%>
						<div  style=" text-align: center;">
							<img src=resources/images/empty_cart1.png >
							<p style="font-weight: bolder;font-family: Helvetica;font-size:40px;">Your Cart is Currently Empty</p>
							<p class="mt-25" style="color: silver;margin-bottom: 20px;font-size: 15px;">Before proceed to checkout you must add some products to your<br> shopping cart.You will find a lot of interesting products on our Home Page.</p>	
							<div class="register-home animated mb-5"  style="margin-bottom:50px;height:40;width:130;fill:ttransparent;">
									<a href="CustomizeProductById.jsp">Shop Now</a>				
								</div>
						</div> 
			<%
					}	
			%>				
</div>
<jsp:include page="footer_user.jsp"></jsp:include>
<!--quantity-->
</body>
<script>
		function CheckPCName()
		{
			var pnm1 ,pnm2 ;
			pnm1 = $('#checkpcname').val();
			pnm2 = $('#checkpcname1').val();
			if(pnm1 == pnm2)
			{
				alert("This name is already taken,Please take another name for your PC");		
				event.preventDefault();
			}
			else if(pnm1 != pnm2)
			{
				alert("Success..!");		
			}
		}
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>
</html>