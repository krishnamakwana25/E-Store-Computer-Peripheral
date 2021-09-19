<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>   
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="DAO.CustCatdao" %>
<%@ page import="bean.CustomCatbean" %>
<%@ page import="DAO.CustCatdao" %>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Add Customize Products</title>
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
            <h1 class="mt-4">Add Customize Product</h1>
            <div class="row">
    		   <!-- Form controls -->
                  <div class="col-sm-12">
                     <div class="panel panel-bd lobidrag">
                        <div class="panel-body">
                           <form class="col-lg-12" method="post" action="<%=application.getContextPath()%>/CustProdController" enctype = "multipart/form-data" data-parsley-validate="" >                             
                             <div class="form-group">
                            	<label>Custom Category Name </label>
                        	  	<select class="form-control" required="required" id="selectcustcat" name="selectcustcat" >      
                        	  	<option value=" ">Please Select</option>    
                            	<%
                            		CustCatdao cd= new CustCatdao();
            	              		List<CustomCatbean> list = cd.getallCustomecategory();
                	          		for(CustomCatbean custcat: list)
                    	      		{
                        	  	%>
                        	  	     	 <option value="<%=custcat.getCustmaincatid()%>" ><%=custcat.getCustcatname()%></option>	
                            	<%
        	                  		}
            	          		%>
            	          		</select>
            	          	</div>
            	          	  <div class="form-group">
                                 <label>Product Name</label>
                                 <input type="text" name="custproname" id="custproname" class="form-control" placeholder="Enter Product Name" required autofocus>
                              </div>
                              <div class="form-group">
                                 <label>Product Photo1</label>
                                 <input type="file" name="custprophoto1" id="custprophoto1" required="required">                                 
                              </div>
                                <div class="form-group">
                                 <label>Product Photo2</label>
                                 <input type="file" name="custprophoto2" id="custprophoto2" required="required">                                 
                              </div>
                                <div class="form-group">
                                 <label>Product Photo3</label>
                                 <input type="file" name="custprophoto3" id="custprophoto3" required="required">                                 
                              </div>
                                <div class="form-group">
                                 <label>Product Photo4</label>
                                 <input type="file" name="custprophoto4" id="custprophoto4" required="required">                                 
                              </div>
                              <div class="form-group">
                                 <label>Price</label>
                                 <input type="text" name="custproprice" id="custproprice"class="form-control" placeholder="Enter Price" required min="1" data-parsley-type="integer" data-parsley-error-message="Price Must be in numbers">
                              </div>
                              <div class="form-group">
                                 <label>Quantity</label> 
                                 <input type="text" name="custproqty" id="custproqty" class="form-control" placeholder="Enter quantity" required min="1" data-parsley-type="integer" data-parsley-error-message="Quantity Must be in numbers">
                              </div>
                              <div class="form-group">
                                 <label>Specification</label>
                                 <textarea class="form-control" name="custprospecification" rows="3" required ></textarea>
                              </div>
                           	 <div class="form-group">
                                 <label>Description</label>
                                 <textarea class="form-control" name="custproddescription" rows="3" required></textarea>
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
  </section>  
	 <jsp:include page="script.jsp"></jsp:include>  
     </body>
</html>
