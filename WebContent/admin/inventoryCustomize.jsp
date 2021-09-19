<%@page import="bean.CustProdBean" %>
<%@page import="DAO.Custproddao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Customize Product Inventory</title>
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
            <h1 class="table_heading mt-4">Customize Product Inventory</h1>
            <div class="row">
        
         	  <!-- Form controls -->
	                  <div class="col-lg-12">
    	                 <div class="panel panel-bd lobidrag">
        	                <div class="panel-bodyclass" id="example_wrapper">
            	              <table  id="example1" border="1"class="table table-responsive-lg table-hover">
            	               <thead class="thead_cls">
                	          	<tr>
                    	      		<th> Customize Product Id </th>
                        	  		<th> Customize Name </th>                        	  		                        	  	
                        	  		<th> Customize Price </th>
                        	  		<th> Customize Quantity</th>                        	  		
                        	  		<th> Update</th>
                        	  		<th> Delete</th>
	                          	</tr> 
	                          	</thead>	                          	
    	                      	<%
    	                      		Custproddao cpd= new Custproddao();
            	              		List<CustProdBean> list = cpd.getallProduct();
                	          		for(CustProdBean custom: list)
                    	      		{
                        	  	%>
                          			<tr>
                          				<td><% out.println(custom.getCustproid());%></td> 
                          				<td><% out.println(custom.getCustproname());%></td>                          				
                          				<td><% out.println(custom.getCustproprice());%></td>
                          				<td><%out.println(custom.getCustproqty()); %></td>                          				
                          				<td>
                              			<form method="post" action="<%=application.getContextPath()%>/CustProdController">
                              			<input type="hidden" name="id" value="<%=custom.getCustproid()%>">
                                 		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Edit Inventory">
                                 		</form>
                                 		</td>
                          				
                          				<td>
                              			<form method="post" action="<%=application.getContextPath()%>/CustProdController">
                          				<input type="hidden" name="id" value="<%=custom.getCustproid()%>">
                                 		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Delete Product">
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

