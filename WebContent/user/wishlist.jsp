<%@page import="DAO.Userdao"%>
<%@page import="bean.Userbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Wishlistbean" %>
<%@page import="DAO.Wishlistdao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- SWEET ALERT -->
<script src="resources/js/sweetalert2.all.min.js"  type="text/javascript"></script>
<!-- SWEET ALERT OVER-->
<%
	Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));	
	int cnt=0;
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Wishlist</title>
</head>
<body onload="preloader1()">
<div id="loading"></div>
 
<jsp:include page="header1_user.jsp"></jsp:include>
<div class="container">
			<% int cnt1=0;%>
			<%       
					cnt1=Wishlistdao.getCount(ub.getUserid());													
		  			if(cnt1 != 0)
		  			{
	         %>     	
	<table id="cartTable" border="2" class="table table-responsive table-hover " table-layout="inherit">
	<thead class="thead_cls">
		<tr>
			<th   style=" text-align: center;">Sr. No</th>
			<th> Product</th>
			<th> Product Name</th>
			<th> Price</th>
			<th> Add to Cart</th>
			<th  style=" text-align: center;">Remove</th>
		</tr> 
	</thead>
		<%					
				List<Wishlistbean>list=Wishlistdao.getWishListByUserId(ub.getUserid());							
    	          		for(Wishlistbean wb: list)
        	      		{
           	%>					
					<tbody>
						<tr class="cartdata">
						 <td  style=" text-align: center;"><%=++cnt	%></td>
							<td data-th="Product" style="width:250px;">
								<div class="row">
									<div class="col-sm-8 hidden-xs img1"><img src="../uploadimg/<%=wb.getProductPhoto1()%>" style="width:150px"   class="img img-responsive"></div>
								</div>
							</td>
							<td data-th="Product" style="width:250px;height:100px;">
								<div class="row">								
									<div class="col-sm-10">
										<h4 class="nomargin"><% out.println(wb.getProductName());%>															
									</div>
								</div>
							</td>							
							<td name="price" data-th="Price" class="product-price" style="width:170px;">
								&#8377; <% out.println(wb.getProductPrice());%>
							</td>
							
							<td style="width:150px;">							
							<form action="<%=application.getContextPath()%>/Cartcontroller"  method="post">
           	  						<input type="hidden" name="pid" id="pid" value="<% out.println(wb.getProductid());%>">         	  
	           	  					<input type="hidden" name="qty" value="1" min="1" max="50">                	  	
									<input type="submit" class="item_add btn btn-sm btn-primary float-left" name="action" value="Add to Cart">									
							</form>	
							</td>
							<td class="actions" data-th=""  style="width:150px;">				
								<form action="<%=application.getContextPath()%>/WishlistController" method="post" style="padding-top: 8px;padding-left: 10px;float: left;">
									<input type="hidden" name="proid" id="proid" value="<% out.println(wb.getProductid());%>">
									<button type="hidden" type="submit" name="action" value="wishlist" class="btnwishlist ml-4" onclick="wishlistFun()">
										<a class="like">
											<i class="fa fa-heart  " aria-hidden="true" style="color:red;font-size: x-large;" ></i>
										</a>
									</button>
								</form>																
							</td>
						</tr>
					</tbody>		
			<%
        	      			}
			%>
          	       <tfoot>		
          	       <tr>
          	        <td>          	      
          	          <a href="index1_user.jsp" class="btn btn-primary btn-lg btn-block">Back</a>
          	        </td>
					</tr>							  
					</tfoot>																																	
				</table>
			<% 		
						}
						else
						{
			%>
							<div  style=" text-align: center;">
								<img src=resources/images/empty_wishlist1.png>								
								<div class="wishlist1 animated mb-5"  style="margin-bottom:50px;height:40;width:130;fill:ttransparent;">
										<a href="index1_user.jsp">Shop Now</a>				
								</div>
							</div> 
			<%
						}	
			%>				
</div>
<jsp:include page="footer_user.jsp"></jsp:include>

<%-- <jsp:include page="script.jsp"></jsp:include> --%>
<script type="text/javascript">
	$(".dltbtn").click(function(e){
		e.preventDefault();
		var element=$(this);
		
		Swal.fire({
			title: 'Are you sure you want to delete ? ',
			text: "You won't be able to revert this !",
			icon:'warning',
			showCancelButton:true,
			confirmButtonColor:'#3085d6',
			cancelButtonColor:'#d33',
			confimButtonText: 'Yes, delete it !',
		}).then((result)=> {
			if(result.value){
				cid=element.attr('id');
				$.ajax({
					url:"../WishlistController",
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
						window.location.href="wishlist.jsp";
					}
				})
			}
		})
	});
</script>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

<!--quantity-->
</body>
</html>