<%@page import ="DAO.Custproddao" %>
<%@page import ="bean.CustProdBean" %>  
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Update Customize Inventory</title>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<%
	CustProdBean rpb= Custproddao.getProductById(Integer.parseInt(request.getParameter("id")));
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
            <h1 class="mt-4">Update Customize Inventory</h1>
            <div class="row">
            	  <div class="col-sm-12">
                     <div class="panel panel-bd lobidrag">
                     <h1></h1>
                        <div class="panel-body">
                           <form class="col-lg-12" method="post" action="<%=application.getContextPath()%>/CustProdController" data-parsley-validate="true">
                              <div class="form-group">
                              <label>Product Id : <a style="font-weight: bold;"><%=rpb.getCustproid()%></a></label>
                              	<hr>
                                 <input type="text" hidden="" class="form-control" placeholder="Id" name="updatecustomproid" value="<%=rpb.getCustproid()%>">
                              </div>                                 
							<div class="fom-control">       
							<label>Product Name</label>     	          	
								<input type="text" class="form-control" placeholder="Product Name" name="updatecustomproname" data-parsley-minlength="3" data-parsley-maxlength="50" value="<%=rpb.getCustproname()%>"><br>
                            <label>Product Price</label>
                                <input type="text" class="form-control" placeholder="Product Price" name="updatecustomproprice" data-parsley-maxlength="6" value="<%=rpb.getCustproprice()%>"><br>
                            <label>Product Quantity</label>
                                <input type="text" class="form-control" placeholder="Product Quantity" name="updatecustomqty" data-parsley-maxlength="6" value="<%=rpb.getCustproqty()%>"><br>
                              </div>
                              <div class="reset-button">
                              <input type="submit" class="btn btn-lg btn-info" name="action" value="Update Inventory">
                               </div>
                           </form>
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
