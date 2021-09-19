<%@page import ="DAO.Rentproddao" %>
<%@page import ="bean.Rentprodbean" %>  
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Update Rent Products</title>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<%
	Rentprodbean rpb= Rentproddao.getRentProductById(Integer.parseInt(request.getParameter("id")));
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
            <h1 class="mt-4">Update Rent Product</h1>
            <div class="row">
            	  <div class="col-sm-12">
                     <div class="panel panel-bd lobidrag">
                     <h1></h1>
                        <div class="panel-body">
                           <form class="col-lg-12" method="post" action="<%=application.getContextPath()%>/RentProdController1" data-parsley-validate="true">
                              <div class="form-group">
                              <label>Product Id : <a style="font-weight: bold;"><%=rpb.getRentProid()%></a></label>
                              <hr>
                                 <input type="text" hidden="" class="form-control" placeholder="Id" name="updateproid" value="<%=rpb.getRentProid()%>">
                               </div>
							 <div class="fom-control"> 
							 <label>Rent Product Name</label>           	        
								<input type="text" class="form-control" placeholder="Product Name" name="updaterentproname" data-parsley-minlength="3" data-parsley-maxlength="50" value="<%=rpb.getRentProName()%>"><br>
                             <label>Rent Per Month</label>
                                <input type="text" class="form-control" placeholder="Product Price" name="updaterentproprice" value="<%=rpb.getRentProductPrice()%>" data-parsley-type="integer" data-parsley-error-message="Rent Price Must be in numbers" min= "1"><br>
                             <label>Quantity</label>
                                <input type="text" class="form-control" placeholder="Product Quantity" name="updaterentqty" value="<%=rpb.getRentProductQty1()%>" data-parsley-type="integer" data-parsley-error-message="Quantity Must be in numbers" min= "1"><br>                                  
                             <label>Specification</label>
                                 <input type="text" class="form-control"name="updaterentprospecification" data-parsley-trigger="keyup" data-parsley-maxlength="3000" value="<%=rpb.getRentProductSpecification1()%>"><br>
                              </div>
                              <div class="reset-button">
                              <input type="submit" class="btn btn-lg btn-info" name="action" value="Update">
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
