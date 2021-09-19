<%@page import="bean.Feedbackbean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Feedbackdao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Manage Feedback</title>
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
            <h1 class="table_heading mt-4">Feedback Information</h1>
            <div class="row">        
         	  <!-- Form controls -->
	                  <div class="col-lg-12">
    	                 <div class="panel panel-bd lobidrag">
        	                <div class="panel-bodyclass" id="example_wrapper">
            	              <table  id="example1" border="1"class="table table-responsive-lg table-hover">
            	               <thead class="thead_cls">
                	          	<tr>
                    	      		<th> Feedback Id </th>
                    	      		<th> Name</th>
                        	  		<th> Email Id </th>
                        	  		<th> Topic</th>
                        	  		<th> Satisfaction</th>
                        	  		<th> Message</th>                        	  	
                        	  		<th> Delete</th>
	                          	</tr> 
	                          	</thead>	                          
    	                      	<%
    	                      		Feedbackdao fd= new Feedbackdao();
            	              		List<Feedbackbean> list = fd.getallFeedback();
                	          		for(Feedbackbean fb: list)
                    	      		{
                        	  	%>
                          			<tr>
                          				<td><% out.println(fb.getFeedbackid());%></td>
                          				<td><% out.println(fb.getName());%></td>
                          				<td><% out.println(fb.getMail());%></td>
                          				<td><% out.println(fb.getFeedbackTopic()); %></td>
                          				<td><% out.println(fb.getFeedbackSatisfaction()); %></td>
                          				<td><% out.println(fb.getFeedbackMessage()); %></td>
                          				<td>
                              			<form method="post" action="<%=application.getContextPath()%>/FeedbackController">
                          				<input type="hidden" name="id" value="<%=fb.getFeedbackid()%>">
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