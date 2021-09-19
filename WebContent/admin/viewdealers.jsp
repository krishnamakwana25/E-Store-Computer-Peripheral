<%@page import="bean.Dealerregisterbean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.DealerRegisterdao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Manage Dealers</title>
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
            <h1 class="table_heading mt-4">Dealer Information</h1>
            <div class="row">
         	  <!-- Form controls -->
	                  <div class="col-lg-12">
    	                 <div class="panel panel-bd lobidrag">
        	                <div class="panel-bodyclass" id="example_wrapper">
            	              <table  id="example1" border="1" class="table table-responsive-lg table-hover">
            	              <thead class="thead_cls">
                	          	<tr>
                    	      		<th> Dealer Id </th>
                        	  		<th> Dealer Name </th>                        	  	                       	  
                        	  		<th> E-mail </th>
                        	  		<th> Mobile No. </th>
                        	  		<th> Address </th>                        	  		
                        	  		<th> Photo</th> 
                        	  		<th> Status</th>
                        	  	</tr>
                        	  	</thead>
                        	  	<tbody class="tbody_class">
                        	  		<%
                        	  		DealerRegisterdao drd = new DealerRegisterdao();
            	              		List<Dealerregisterbean> list = drd.getallDealer();
                	          		for(Dealerregisterbean dealer: list)
                    	      		{
                        	  	%>
                          			<tr>
                          				<td><% out.println(dealer.getDealerid()); %></td>
                          				<td><% out.println(dealer.getDealername());%></td>          						
                          				<td><% out.println(dealer.getDealerMail());%></td>
                          				<td><% out.println(dealer.getContactNo()); %></td>
                          				<td><% out.println(dealer.getAddress());%></td>                          				                          				
                          				<td><img src="../uploadimg/<% out.println(dealer.getPhoto()); %>" style="height:70px; width:70px;border-radius:50%;" class="rounded-circle"></td>             	          		    	
                              			<%-- <td>
                              			<form method="post" action="<%=application.getContextPath()%>/DealerRegisterController">
                              			<input type="hidden" name="dealerid" value="<%=dealer.getDealerid()%>">
                                 		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Delete">		
                              			</form>
                              			</td>	   --%> 
                              			<td>
                              			<%                              			
                	              		boolean check =  DealerRegisterdao.isDealerActive(dealer.getDealerid());
                    	          		{
                    	          			System.out.println("check : "+check);
                    	          			if(check)
                    	          			{                    	          				
                    	          		%>
                    	          			<form method="post" action="<%=application.getContextPath()%>/DealerRegisterController">
		                              			<input type="hidden" name="dealerid" value="<%=dealer.getDealerid()%>">
		                                 		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Active">		
	                              			</form>
                              			<%
                    	          			}
                    	          			else
                    	          			{
                    	          		%>
                    	          			<form method="post" action="<%=application.getContextPath()%>/DealerRegisterController">
	                              			<input type="hidden" name="dealerid" value="<%=dealer.getDealerid()%>">
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
      <!--main content end-->    
  </section>
	 <jsp:include page="script.jsp"></jsp:include>
     </body>
</html>