<%@page import="bean.Rentprodbean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Rentproddao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Rent Inventory</title>
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
            <h1 class="table_heading mt-4">Rent Product Inventory</h1>
            <div class="row">
        
         	  <!-- Form controls -->
	                  <div class="col-lg-12">
    	                 <div class="panel panel-bd lobidrag">
        	                <div class="panel-bodyclass" id="example_wrapper">
            	              <table  id="example1" border="1"class="table table-responsive-lg table-hover">
            	               <thead class="thead_cls">
                	          	<tr>
                    	      		<th> Rent Product Id </th>
                        	  		<th> Product Name </th>                        	  		                        	  	
                        	  		<th> Product Price </th>
                        	  		<th> Product Quantity</th>                        	  		
                        	  		<th> Update</th>
                        	  		<th> Delete</th>
	                          	</tr> 
	                          	</thead>	                          	
    	                      	<%
    	                      		Rentproddao rpd= new Rentproddao();
            	              		List<Rentprodbean> list = rpd.getallProduct();
                	          		for(Rentprodbean rent: list)
                    	      		{
                        	  	%>
                          			<tr>
                          				<td><% out.println(rent.getRentProid());%></td> 
                          				<td><% out.println(rent.getRentProName());%></td>                          				
                          				<td><% out.println(rent.getRentProductPrice());%></td>
                          				<td><%out.println(rent.getRentProductQty1()); %></td>                          				
                          				<td>
                              			<form method="post" action="<%=application.getContextPath()%>/RentProdController1">
                              			<input type="hidden" name="id" value="<%=rent.getRentProid()%>">
                                 		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Edit Inventory">
                                 		</form>
                                 		</td>
                          				
                          				<td>
                              			<form method="post" action="<%=application.getContextPath()%>/RentProdController1">
                          				<input type="hidden" name="id" value="<%=rent.getRentProid()%>">
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

      <!--main content end-->
        </section>
  
	 <jsp:include page="script.jsp"></jsp:include>
  
     </body>
</html>

