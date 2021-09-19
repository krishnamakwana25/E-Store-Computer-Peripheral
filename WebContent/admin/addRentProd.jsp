<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Add Rent Products</title>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
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
            <h1 class="mt-4">Add Rent Product</h1>
            <div class="row">
    		   <!-- Form controls -->
                  <div class="col-sm-12">
                     <div class="panel panel-bd lobidrag">
                        <div class="panel-body">
                           <form class="col-lg-12" method="post" action="<%=application.getContextPath()%>/RentProdController1" enctype = "multipart/form-data" data-parsley-validate="" >                             
            	          	<div class="form-group">
                                 <label>Rent Product Name</label>
                                 <input type="text" name="rentproductname"class="form-control" placeholder="Enter Product Name" required autofocus>
                              </div>
                              <div class="form-group">
                                 <label>Product Photo1</label>
                                 <input type="file" name="rentproductphoto1" id="productphoto1" required="required">                                 
                              </div>
                                <div class="form-group">
                                 <label>Product Photo2</label>
                                 <input type="file" name="rentproductphoto2" id="productphoto2">                                 
                              </div>
                                
                              <div class="form-group">
                                 <label>Price</label>
                                 <input type="text" name="rentproductprice" min= "1" id="productprice"class="form-control" placeholder="Enter Price" required  data-parsley-type="integer" data-parsley-error-message="Rent Price Must be in numbers">
                              </div>
                              <div class="form-group">
                                 <label>Quantity</label> 
                                 <input type="text" name="rentproductqty" min= "1" id="productqty" class="form-control" placeholder="Enter quantity" required data-parsley-minlength="1" data-parsley-type="integer" data-parsley-error-message="Quantity Must be in numbers">
                              </div>
                              <div class="form-group">
                                 <label>Specification</label>
                                 <textarea class="form-control" name="rentproductspecification" rows="3" required ></textarea>
                              </div>
                            	<div class="form-group">
                                 <label>Description</label>
                                 <textarea class="form-control" name="rentproductdescription" rows="3" required></textarea>
                              </div>                              
                              <div class="reset-button">
                                 <input type="submit"  class="btn btn-lg btn-primary" name="action" value="Insert">
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
             </div>
         <!-- row -->              
        </section>
      </section>
      <!--main content end-->
      <!--footer start-->      
      <!--footer end-->
  </section>  
	 <jsp:include page="script.jsp"></jsp:include>  
     </body>
</html>
