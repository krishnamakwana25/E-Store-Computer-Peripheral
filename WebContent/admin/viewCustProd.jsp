<%@page import="bean.CustProdBean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Custproddao" %>
<%@page import="bean.CustomCatbean" %>
<%@page import="DAO.CustCatdao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Manage Customize Products</title>
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
            <h1 class="table_heading mt-4">Customize Product Information</h1>
            <div class="row">        
         	  <!-- Form controls -->
	                  <div class="col-lg-12">
    	                 <div class="panel panel-bd lobidrag">
        	                <div class="panel-bodyclass" id="example_wrapper">
            	              <table  id="example1" border="1"class="table table-responsive table-hover">
            	               <thead class="thead_cls">
                	          	<tr>
                    	      		<th> Product Id </th>
                    	      		<th> Category </th>
                        	  		<th> Product Name </th>                        	  		
                        	  		<th> Product Photo1 </th>
                        	  		<th> Product Photo2 </th>
                        	  		<th> Product Photo3 </th>
                        	  		<th> Product Photo4 </th>
                        	  		<th> Product Price </th>
                        	  		<th> Product Quantity</th>
                        	  		<th> Specification </th>
                        	  		<th> Description </th>
                        	  		<th> Update</th>
                        	  		<th> Delete</th>
	                          	</tr> 
	                          	</thead>
	                          	
    	                      	<%
    	                      		Custproddao cpd= new Custproddao();
            	              		List<CustProdBean> list = cpd.getallProduct();
                	          		for(CustProdBean Cust: list)
                    	      		{
                        	  	%>
                          			<tr>
                          				<td><% out.println(Cust.getCustproid());%></td>
                          				<td><% out.println(Cust.getCustcatname()); %></td>
                          				<td><% out.println(Cust.getCustproname());%></td>
                          				<td><img src="../uploadimg/<%=Cust.getCustprophoto1() %>" style="height:50px; width:70px"></td>
                          				<td><img src="../uploadimg/<%=Cust.getCustprophoto2() %>" style="height:50px; width:70px"></td>
                          				<td><img src="../uploadimg/<%=Cust.getCustprophoto3() %>" style="height:50px; width:70px"></td>
                          				<td><img src="../uploadimg/<%=Cust.getCustprophoto4() %>" style="height:50px; width:70px"></td>
                          				<td><% out.println(Cust.getCustproprice());%></td>
                          				<td><%out.println(Cust.getCustproqty()); %></td>
                          				<td><% out.println(Cust.getCustprospecification());%></td>
                          				<td class="col_a"><% out.println(Cust.getCustproddescription());%></td>
                          				
                          				<td>
                              			<form method="post" action="<%=application.getContextPath()%>/CustProdController">
                              			<input type="hidden" name="id" value="<%=Cust.getCustproid()%>">
                                 		<input type="submit" class="btn btn-lg btn-primary" name="action" value="Edit">
                                 		</form>
                                 		</td>
                          					
                          				<td>
                              			<form method="post" action="<%=application.getContextPath()%>/CustProdController">
                          				<input type="hidden" name="id" value="<%=Cust.getCustproid()%>">
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