<%@page import="DAO.Userdao"%>
<%@page import="bean.Userbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Cartbean" %>
<%@page import="DAO.Cartdao" %>
<%@page import="bean.Orderbean" %>
<%@page import="DAO.Orderdao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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

</style>

<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<jsp:include page="script.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- SWEET ALERT -->
<script src="resources/js/sweetalert2.all.min.js"  type="text/javascript"></script>
<!-- SWEET ALERT OVER-->

<%
	 Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
%>
<%
	int mainTotal = 0,cnt1 = 0, qty,price,subtotal=0,qty1;
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
</head>
<body onload="preloader1()">
<div id="loading"></div>

<jsp:include page="header1_user.jsp"></jsp:include>
<div class="container">
	<% int c=0;%>
	<%       
		c=Cartdao.getCount(ub.getUserid());													
 		if(c != 0)
 		{
	%>     	
	<table id="cartTable" border="2" class="table table-responsive-lg table-hover" style="table-layout: fixed;"> 
	<thead class="thead_cls">
		<tr>
			<th   style=" text-align: center;">Sr. No</th>
			<th> Product</th>
			<th> Product Name</th>
			<th  style="text-align: center;"> Price</th>
			<th  style=" text-align: center;"> Quantity</th>
			<th  style=" text-align: center;"> SubTotal </th>                        	  		
			<th  style=" text-align: center;">Remove</th>
		</tr> 
	</thead>					
			<%
	              	List<Cartbean>list=Cartdao.getCartListByUserId(ub.getUserid());							
    	          		for(Cartbean cart: list)
        	      		{
           	%>					
					<tbody>
						<tr class="cartdata">
						 <td style="text-align: center;"><%=++cnt1%></td>
							<td data-th="Product">
							<img src="../uploadimg/<%=cart.getProductPhoto1()%>" style="width:150px;height:auto;" height="100%" class="img img-responsive">
							</td>
							<td data-th="Product">
								<h4 class="nomargin"><% out.println(cart.getProductName());%>							
							</td>							
							<td name="price" data-th="Price" class="product-price"><p class="ml-5">&#8377;<% out.println(cart.getProductPrice());%></p></td>
							<td data-th="Quantity" style="width:170px;">	
								<div class="quantity"  style="margin-left:20px;">									 
								<div class="product-quantity">  <%--<%=cart.getProductQty()%> --%>
								<form  action="<%=application.getContextPath()%>/Cartcontroller"  method="post" data-parsley-validate="true">
									<div class="form-group">
										<input data-parsley-type="integer" class="form-control" value="<% out.println(cart.getProductQty());%>" name="qty" style="margin-left:20px;text-align:center;width:50px;" max="<%=cart.getProductQty1()%>" min="1">																	
										<input type="hidden" class="product-quantity" name="pid" id="proid" value="<%=cart.getProductid()%>">
										<input type="hidden" type="submit" class="btn btn-primary" name="action" value="Update">
									</div>						                           																	
								</form>
								</div>
								</div>																													  														
							</td>			
							<%
									 qty=cart.getProductQty();
									price=cart.getProductPrice();
									subtotal = qty * price ;
									cart.setProductSubTotalPrice(subtotal);
							%>							
						<td class="ml-5 "><label class=" ml-5" ><%=subtotal = (qty) * (price)%></label></td>						
							
							<%mainTotal +=(qty) * (price);
							cart.setProductTotalPrice(mainTotal);
							%>
							<%-- <form>
							</form> --%>
							<td class="actions" data-th="">				
								<form method="POST">  
									<input type="hidden" name="cid" id="cid" value="<%=cart.getCartid()%>">						 
									<input type="submit" class="btn btn-danger btn-sm sizeofremovebtn dltbtn ml-5" style="margin-left:50px;" id="<%=cart.getCartid()%>" name="action" value="X">
								</form>															
							</td>
						</tr>
					</tbody>		
					<%
       	      			}
          	        %>			
          	        						
					<tfoot>
					<%
	              	List<Cartbean>list1=Cartdao.getCartListByUserId(ub.getUserid());							
    	          		for(Cartbean cart: list1)
        	      		{
           			%>			
           				<%	if(ub.getUserid() == cart.getUserid())
           					{ 
           				%>
							<form action="<%=application.getContextPath()%>/OrderController" method="post" >
								<input type="hidden" name="cartid" id="cartid" value="<%= cart.getCartid()%>">
								<input type="hidden" name="proid" id="proid" value="<%=cart.getProductid()%>">
								<input type="hidden" name="price" id="price" value=<%=cart.getProductPrice() %>>
								<input type="hidden" name="qty1" id="qty1" value=<%=cart.getProductQty()%>>								
								 <input type="hidden" name="totalamt" id="totalamt" value=<%=mainTotal %>>
								<input type="hidden" name="userid" id="userid" value="<%= cart.getUserid()%>">
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
								<a href="index1_user.jsp" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
								<td colspan="3"></td>
								<td class="totals-value font-weight-bold " style="font-size: 20px; color:#808080;" name="maintotal" id="cart-total" >
								Grand Total : 
								<td class="font-weight-bold" style="font-size:21px; color:#808080; "><u><%=mainTotal %></u></td>																																														 
								 <td>
									 <input type="submit" class="btn btn-success btn-block" name="action" value="Checkout">
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
						<a href="index1_user.jsp">Shop Now</a>				
					</div>
			</div> 
<%
		}	
%>
</div>
<jsp:include page="footer_user.jsp"></jsp:include>
<script type="text/javascript">
	/* function MyQtyAlertFun()
	{
		var q = $('#qty').val();
		alert(q);
	} */
	$(".dltbtn").click(function(e){
		e.preventDefault();
		var element=$(this);
		
		Swal.fire({
			title: 'Are you sure you want to remove this product from Cart ? ',
			text: "",
			icon:'question',
			showCancelButton:true,
			confirmButtonColor:'#3085d6',
			cancelButtonColor:'#d33',
			confimButtonText: 'Yes, delete it !',
		}).then((result)=> {
			if(result.value){
				cid=element.attr('id');
				$.ajax({
					url:"../Cartcontroller",
					type: "GET",
					data:{cid,cid},
					success:function(data){
						Swal.fire({
							title:'Deleted!',
							text:'Your data has been deleted.',
							icon:'success',
							showConfirmButton:false,
							timer:1200
						})
						window.location.href="cart.jsp";
					}
				})
			}
		})
	});
</script>
<!--quantity-->
</body>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>
</html>