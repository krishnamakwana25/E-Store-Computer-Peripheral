<%@page import="bean.Citybean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Citydao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Manage City</title>
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
            <h1 class="table_heading mt-4">City Information</h1>
            <div class="row">        
         	  <!-- Form controls -->
	                  <div class="col-sm-12">
    	                 <div class="panel panel-bd lobidrag">
        	                <div class="panel-bodyclass" id="example_wrapper">
            	              <table  id="example1" border="1"class="table table-responsive-sm table-hover">
            	               <thead class="thead_cls">
                	          	<tr>
                    	      		<th> City Id </th>
                        	  		<th> City Name </th>
                        	  		<th> State Name</th>
                        	  		<th> Update</th>
                        	  		<th> Delete</th>
	                          	</tr> 
	                          	</thead>
	                          	
    	                      	<%
    	                      		Citydao cd= new Citydao();
            	              		List<Citybean> list = cd.getallCity();
                	          		for(Citybean city: list)
                    	      		{
                        	  	%>
                          			<tr>
                          				<td><% out.println(city.getCid());%></td>
                          				<td><% out.println(city.getCityname());%></td>
                          				<td><% out.println(city.getStatename()); %></td>
                          				
                          				<td>
                              			<form method="post" action="<%=application.getContextPath()%>/Citycontroller">
                              			<input type="hidden" name="id" value="<%=city.getCid()%>">
                                 		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Edit">
                                 		</form>
                                 		</td>
                          				
                          				<td>
                              			<form method="post" action="<%=application.getContextPath()%>/Citycontroller">
                          				<input type="hidden" name="id" value="<%=city.getCid()%>">
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