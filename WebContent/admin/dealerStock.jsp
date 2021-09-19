<%@page import="bean.DealerStockbean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.DealerStockdao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Dealers's Stock</title>
</head>
<%
	Adminbean ub = Admindao.getAdminById((Integer) session.getAttribute("aid"));
%>
 <jsp:include page="head.jsp"></jsp:include>
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
            <h1 class="table_heading  mt-4">Stock Information</h1>
            <div class="row">
         	  <!-- Form controls -->
	                  <div class="col-lg-12">
    	                 <div class="panel panel-bd lobidrag">
        	                <div class="panel-bodyclass" id="example_wrapper">
            	              <table  id="example1" border="1"class="table table-responsive-lg table-hover">
            	              <thead class="thead_cls">
                	          	<tr>
                    	      		<th> Dealer Id </th>
                    	      		<th> Product Id </th>
                        	  		<th> Dealer Name </th>                        	  
                        	  		<th> E-mail Address</th>
                        	  		<th> Contact No. </th>
                        	  		<th> Product Name </th>
                        	  		<th> Stock Qty </th>
                        	  	 	<th> Accept</th>
                        	  		<th> Decline</th>
                        	  	</tr>
                        	  	</thead>
                        	  	<tbody class="tbody_class">
                        	  		<%
                        	  		DealerStockdao ud = new DealerStockdao();
            	              		List<DealerStockbean> list = ud.getStock();
                	          		for(DealerStockbean stock: list)
                    	      		{
                        	  	%>
                          			<tr>
                          				<td><% out.println(stock.getDealerid()); %></td>
                          				<td><% out.println(stock.getProductid());%></td>            						
                          				<td><% out.println(stock.getDealername());%></td>
                          				<td><% out.println(stock.getDealerMail()); %></td>
                          				<td><% out.println(stock.getContactNo());%></td>                          				
                          				<td><% out.println(stock.getProductName()); %></td>
                          				<td><% out.println(stock.getStockQty());%></td>
										<td>
	            	          		    	<form method="post" action="<%=application.getContextPath()%>/DealerStockController">
	            	          		    		<input type="hidden" name="dealername" id="dealername" value="<%=stock.getDealername()%>">
	            	          		    		<input type="hidden" name="email" id="email" value="<%=stock.getDealerMail()%>">            	          		    
		            	          		    	<input type="hidden" name="id" id="id" value="<%=stock.getDealerStockid()%>">
		                                 		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Accept">
	                              			</form>
                              			</td> 
                              			<td>
                              			<form method="post" action="<%=application.getContextPath()%>/DealerStockController">
	                              			<input type="hidden" name="id" value="<%=stock.getDealerStockid()%>">
	                                 		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Decline">		
                              			</form>
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