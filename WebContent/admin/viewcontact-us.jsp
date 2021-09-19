<%@page import="bean.Contactbean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Contactusdao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Manage Contact Us</title>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<%
	Adminbean ub = Admindao.getAdminById((Integer) session.getAttribute("aid"));
%>
 <jsp:include page="head.jsp"></jsp:include>
</head>
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
            <h1 class="table_heading mt-4">Contact Information</h1>
            <div class="row">        
         	  <!-- Form controls -->
	                  <div class="col-sm-12">
    	                 <div class="panel panel-bd lobidrag">
        	                <div class="panel-bodyclass" id="example_wrapper" >
            	              <table id="example1" border="1"class="table table-responsive-sm table-hover">
            	               <thead class="thead_cls">
                	          	<tr>
                    	      		<th> Contact Us Id </th>
                        	  		<th> Name </th>
                        	  		<th> Email </th>
                        	  		<th> Mobile </th>
                        	  		<th> Message </th>
                        	  		<th> Delete</th>
	                          	</tr> 
	                          	</thead>
	                          	
    	                      	<%
    	                      		Contactusdao cd= new Contactusdao();
            	              		List<Contactbean> list = cd.getallContactus();
                	          		for(Contactbean contact: list)
                    	      		{
                        	  	%>
                          			<tr>
                          				<td><% out.println(contact.getContact_us_id());%></td>
                          				<td><% out.println(contact.getName());%></td>
                          				<td><% out.println(contact.getEmail());%></td>
                          				<td><% out.println(contact.getMobile_no());%></td>
                          				<td><% out.println(contact.getMessage());%></td>
                          				
                          				<td>
                              			<form method="post"  action="<%=application.getContextPath()%>/ContactusController" >
                          				<input type="hidden" name="id" value="<%=contact.getContact_us_id()%>">
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