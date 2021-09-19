<%@page import="bean.Userbean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Userdao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Manage Users</title>
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
            <h1 class="table_heading  mt-4">User Information</h1>
            <div class="row">
         	  <!-- Form controls -->
	                  <div class="col-lg-12">
    	                 <div class="panel panel-bd lobidrag">
        	                <div class="panel-bodyclass" id="example_wrapper">
            	              <table  id="example1" border="1" class="table table-responsive table-hover">
            	              <thead class="thead_cls">
                	          	<tr>
                    	      		<th> User Id </th>
                        	  		<th> User Name </th>
                        	  		<!-- <th> Password </th> -->                        	  
                        	  		<th> E-mail </th>
                        	  		<th> Mobile No. </th>
                        	  		<th> Address </th>                        	  		
                        	  		<th> Area</th>
                        	  		<th> City</th>
                        	  		<th> State</th>
                        	  		<th> Photo</th>
                        	  	<!-- 	<th> Update</th> -->
                        	  		<th> Status</th>          	  		
                        	  	</tr>
                        	  	</thead>
                        	  	<tbody class="tbody_class">
                        	  		<%
        	                  		Userdao ud = new Userdao();
            	              		List<Userbean> list = ud.getallUser();
                	          		for(Userbean user: list)
                    	      		{
                        	  	%>
                          			<tr>
                          				<td><% out.println(user.getUserid()); %></td>
                          				<td><% out.println(user.getUsername());%></td>
             							<%-- <td><% out.println(user.getPassword()); %></td>  --%>            						
                          				<td><% out.println(user.getMail());%></td>
                          				<td><% out.println(user.getMobnum()); %></td>
                          				<td><% out.println(user.getAdd());%></td>                          				
                          				<td><% out.println(user.getAreaname()); %></td>
                          				<td><% out.println(user.getCityname());%></td>
                          				<td><% out.println(user.getStatename()); %></td>
                          				<td><img src="../uploadimg/<% out.println(user.getPhoto()); %>" style="height:70px; width:70px;border-radius:50%;" class="rounded-circle"></td>            	          		    	                              			
                              			<td>
                              			<%                              			
                	              		boolean check =  Userdao.isUserActive(user.getUserid());
                    	          		{
                    	          			System.out.println("check : "+check);
                    	          			if(check)
                    	          			{                    	          				
                    	          		%>
                    	          			<form method="post" action="<%=application.getContextPath()%>/Usercontroller">
		                              			<input type="hidden" name="id" value="<%=user.getUserid()%>">
		                                 		<input type="submit" class="btn btn-lg  btn-primary" name="action" value="Active"> <!-- delete -->
	                              			</form>	                              			
                              			<%
                    	          			}
                    	          			else
                    	          			{
                    	          		%>
                    	          			<form method="post" action="<%=application.getContextPath()%>/Usercontroller">
		                              			<input type="hidden" name="id" value="<%=user.getUserid()%>">
		                                 		<input type="submit" class="btn btn-lg btn-danger" name="action" value="InActive">		
	                              			</form>
                    	          		<%
                    	          			}
                        	      		}
                              			%>
                              			</td>                                
	                          		</tr>
    	                      	<%
        	                  		}
            	          		%>
            	          		  </tbody> 
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