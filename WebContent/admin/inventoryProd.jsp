<%@page import="bean.Productbean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Productdao" %>
<%@page import="bean.Maincategorybean" %>
<%@page import="DAO.Maincategorydao" %>
<%@page import="bean.Subcategorybean" %>
<%@page import="DAO.Subcategorydao" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Product Inventory</title>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<%
	Adminbean ub = Admindao.getAdminById((Integer) session.getAttribute("aid"));
%>
 <jsp:include page="head.jsp"></jsp:include>
 <style type="text/css">
 	td.col_a
 	{
 		max-width:200px;
 		overflow: hidden;
 		text-overflow: ellipsis;
 		white-space: nowrap;
 	}
 </style>
 </head>
<body onload="PreLoader()">
 <div id="loading"></div>
  <section id="container" >
     <jsp:include page="header.jsp"></jsp:include>
       <jsp:include page="sidebar.jsp"></jsp:include>  
       <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
            <h1 class="table_heading mt-4">Product Inventory</h1>
            <div class="row">
                  <div class="col-lg-12">
   	                 <div class="panel panel-bd lobidrag">
       	                <div class="panel-bodyclass" id="example_wrapper">
           	              <table  id="example1" border="1"class="table table-responsive-lg table-hover">
           	               <thead class="thead_cls">
               	          	<tr>
                   	      		<th> Product Id </th>
                       	  		<th> Product Name </th>                        	  		                       	  		
                       	  		<th> Product Price </th>
                       	  		<th> Product Quantity</th>                       	  		
                       	  		<th> Update</th>
                       	  		<th> Delete</th>
                          	</tr> 
                          	</thead>                          	
   	                      	<%
   	                      		Productdao pd= new Productdao();
           	              		List<Productbean> list = pd.getallProduct();
               	          		for(Productbean product: list)
                   	      		{
                       	  	%>
                         			<tr>
                         				<td><% out.println(product.getProductid());%></td>
                         				<td><% out.println(product.getProductName());%></td>                         				
                         				<td><% out.println(product.getProductPrice());%></td>
                         				<td><%out.println(product.getProductQty1()); %></td>                         				
                         				<td>
                             			<form method="post" action="<%=application.getContextPath()%>/ProductController">
                             			<input type="hidden" name="id" value="<%=product.getProductid()%>">
                                		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Edit Inventory">
                                		</form>
                                		</td>                         				
                         				<td>
                             			<form method="post" action="<%=application.getContextPath()%>/ProductController">
                         				<input type="hidden" name="id" value="<%=product.getProductid()%>">
                                		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Delete">
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
             </div>
        </section>
      </section>   		
  </section>  
	 <jsp:include page="script.jsp"></jsp:include>  
     </body>
</html>

