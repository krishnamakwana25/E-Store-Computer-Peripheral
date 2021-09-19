<%@page import="bean.Productbean" %>
<%@page import="DAO.Productdao" %>
<%@page import="bean.ORPbean" %>
<%@page import="DAO.ORPdao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Rent Orders</title>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<%
	Adminbean ub = Admindao.getAdminById((Integer) session.getAttribute("aid"));
%>
 <jsp:include page="head.jsp"></jsp:include>
</head>
 <style type="text/css">
 	td.col_a
 	{
 		max-width:200px;
 		overflow: hidden;
 		text-overflow: ellipsis;
 		white-space: nowrap;
 	}
 </style>
<body onload="PreLoader()">
 <div id="loading"></div>  
  <section id="container" >     
      <!--header start-->
     <jsp:include page="header.jsp"></jsp:include>
      <!--header end-->     
      <!--sidebar start-->       
       <jsp:include page="sidebar.jsp"></jsp:include>       
       <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
            <h1 class="table_heading mt-4">Rent Order Information</h1>
            <div class="row">        
         	  <!-- Form controls -->
	                  <div class="col-lg-12">
    	                 <div class="panel panel-bd lobidrag">
        	                <div class="panel-bodyclass" id="example_wrapper">
            	              <table  id="example1" border="1"class="table table-responsive-lg table-hover">
            	               <thead class="thead_cls">
                	          	<tr>
                	          		<th> User Id</th>
                	          		<th> User Name</th>
                	          		<th> Rent Order Id</th>                	          		
                    	      		<th> Product Id </th>
                        	  		<th> Product Name </th>                        	  		                        	  		
                        	  		<th> Rent Per Month </th>
                        	  		<th> Duration</th>
                        	  		<th> Total Amount</th>
                        	  		<th> Shipping Address</th>
                        	  		<th> Payment Type </th>
                        	  		<th> Delete</th> 
	                          	</tr> 
	                          	</thead>	                          
    	                      	<%    	                   		  
            	              		List<ORPbean> list = ORPdao.getallORP();
                	          		for(ORPbean order: list)
                    	      		{
                        	  	%>
                          			<tr>
                          				<td><% out.println(order.getUserid());%></td>
                          				<td><% out.println(order.getUsername());%></td>                          			
                          				<td><% out.println(order.getUserRentOrderid());%></td>
                          				<td><% out.println(order.getRentProid());%></td>
                          				<td><% out.println(order.getRentProName());%></td>                         				
                          				<td><% out.println(order.getPrice());%></td>
                          				<td><a style="font-weight: bold;"><%out.println(order.getDuration());%> Month</a><br><a style="font-size:13px !important;">(<%out.println(order.getBookDate());%>) To<br>(<%out.println(order.getEndDate());%>)</a></td>
                          				<td><%out.println(order.getOrderTotal()); %></td>
                          				<td><%out.println(order.getAddress()); %></td>
                          				<td><%out.println(order.getPaymnetType()); %></td>                          				
                          				<td>
                              			<form method="post" action="<%=application.getContextPath()%>/RentProdController1">                              			
                          				<input type="hidden" name="id" value="<%=order.getORPid()%>">
                          				<input type="hidden" name="email" value="<%=order.getMail()%>">
                          				<input type="hidden" name="userid" value="<%=order.getUserid()%>">
                          				<input type="hidden" name="username" value="<%=order.getUsername()%>">
                          				<input type="hidden" name="userorderid" value="<%=order.getUserRentOrderid()%>">
                          				<input type="hidden" name="proid" value="<%=order.getRentProid()%>">
                          				<input type="hidden" name="productname" value="<%=order.getRentProName()%>">
                                 		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Delete Rent Order">
                                 		</form>
                                 		</td>	
	                          		</tr>
    	                      	<%
        	                  		}
            	          		%>
                	          </table>
                    	    </div>
	                     </div>
    	              </div>                           
             </div><!-- row -->              
        </section>
      </section>
  </section>  
	 <jsp:include page="script.jsp"></jsp:include>  
     </body>
</html>