<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List" %>
<%@page import="DAO.FilterDao" %>        
<%@page import="DAO.Custproddao" %>
<%@page import="bean.CustProdBean" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<meta charset="ISO-8859-1">
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
<body>
<%	
int feature = Integer.parseInt(request.getParameter("Features_id"));
FilterDao fd= new FilterDao();
                        List<CustProdBean> list = fd.getAllCustProdByFilter(feature);
               	       	for(CustProdBean cust: list)
                   	   	{
               			%>
               							
						<div class="mb-3 col-sm-6 col-md-6 col-lg-4">
						<div class="side animated wow slideInUp">
							<div class="img">
								<form method="post" action="<%=application.getContextPath()%>/CustProdController" >
										<input type="hidden" name="productid" id="productid" value="<% out.println(cust.getCustproid());%>">
										<input type="hidden" name="maincatid" value="<%=cust.getCustmaincatid()%>">
										<button type="hidden" type="submit" name="action" value="customquickview" class="btn btn-white">									
											<img src="../uploadimg/<%=cust.getCustprophoto1() %>" width="100%" style="height:150px;" class="mt-2" alt="image">
										</button>
								</form>											
							</div>
							<div class="name mt-2">
								<h4 class="font-weight-bold" style="color:#20b2aa ;"> <% out.println(cust.getCustproname());%></h4>
								<p class="pt-2" style="font-size: 14px; font-family: sans-serif; color: #2f4f4f;"> <% out.println(cust.getCustprospecification());%></p>
							</div>
							<%-- <div class="prc1">		
								<p class="float-left"  style="color:#2f4f4f ; font-size: 20px;">&#8377; <% out.println(product.getProductPrice());%></p>
							</div>	 --%>
							<div class="mt-3 " style="color:#2f4f4f ; font-size: 20px;">
									<h3>&#8377; <% out.println(cust.getCustproprice());%></h3>
							</div>						
							<div class="btn_div p-2">																																						
									<%	 
										int proid = cust.getCustproid();
										int q = Custproddao.GetTotalQTY(proid);
										if(q != 0)
										{
									%> 	
									<form action="<%=application.getContextPath()%>/CustListController"  method="post">
			           	  				<input type="hidden" name="cpid" id="cpid" value="<% out.println(cust.getCustproid());%>">         	  
		    	       	  				<input type="hidden" name="qty" value="1" min="1" max="50">                	  	
										<input type="submit" class="item_add btn btn-primary float-left" name="action" value="Add to List">
									</form>
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
					</div>	
						<%
                   	   	}
						%>	
</body>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

</html>