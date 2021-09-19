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
<title>Manage Products</title>
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
            <h1 class="table_heading mt-4">Product Information</h1>
            <div class="row">        
         	  <!-- Form controls -->
	                  <div class="col-lg-12">
    	                 <div class="panel panel-bd lobidrag">
        	                <div class="panel-bodyclass" id="example_wrapper">
            	              <table  id="example1" border="1" class="table table-responsive table-hover">
            	               <thead class="thead_cls">
                	          	<tr>
                    	      		<th> Product Id </th>
                        	  		<th> Product Name </th>                        	  		
                        	  		<th> Sub Category </th>
                        	  		<th> Main Category </th>
                        	  		<th> Product Photo1 </th>
                        	  		<th> Product Photo2 </th>
                        	  		<th> Product Photo3 </th>
                        	  		<th> Product Photo4 </th>
                        	  		<th> Product Price </th>
                        	  		<th> Product Quantity</th>
                        	  		<th> Specification </th>
                        	  		<th> Description </th>
                        	  		<th> Processor </th>
                        	  		<th> RAM </th>
                        	  		<th> Storage HDD  </th>
                        	  		<th> Storage SSD </th>
                        	  		<th> Graphics Card </th>
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
                          				<td><% out.println(product.getSubcatname()); %></td>
                          				<td><% out.println(product.getMaincatname()); %></td>
                          				<td><img src="../uploadimg/<%=product.getProductPhoto1() %>" style="height:50px; width:70px"></td>
                          				<td><img src="../uploadimg/<%=product.getProductPhoto2() %>" style="height:50px; width:70px"></td>
                          				<td><img src="../uploadimg/<%=product.getProductPhoto3() %>" style="height:50px; width:70px"></td>
                          				<td><img src="../uploadimg/<%=product.getProductPhoto4() %>" style="height:50px; width:70px"></td>
                          				<td><% out.println(product.getProductPrice());%></td>
                          				<td><%out.println(product.getProductQty1()); %></td>
                          				<td><% out.println(product.getProductSpecification1());%></td>
                          				<td class="col_a"><% out.println(product.getProductDescription());%></td>
                          				<td><% out.println(product.getProcessorName());%></td>
                          				<td><% out.println(product.getRAM());%></td>
                          				<td><% out.println(product.getStorageHDD());%></td>
                          				<td><% out.println(product.getStorageSDD());%></td>
                          				<td><% out.println(product.getGC());%></td>
                          				<td>
                              			<form method="post" action="<%=application.getContextPath()%>/ProductController">
                              			<input type="hidden" name="id" value="<%=product.getProductid()%>">
                                 		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Edit">
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
             </div><!-- row -->             
        </section>
      </section>
  </section>  
	 <jsp:include page="script.jsp"></jsp:include>  
     </body>
</html>