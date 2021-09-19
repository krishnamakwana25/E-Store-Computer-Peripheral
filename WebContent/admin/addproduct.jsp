<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Subcategorybean" %>
<%@page import="DAO.Subcategorydao" %>    
<%@ page import="DAO.Maincategorydao" %>
<%@ page import="bean.Maincategorybean" %>
<%@ page import="java.util.ArrayList"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Add Products</title>
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
            <h1 class="mt-4">Add Product</h1>
            <div class="row">
    		   <!-- Form controls -->
                  <div class="col-sm-12">
                     <div class="panel panel-bd lobidrag">
                        <div class="panel-body">
                           <form class="col-lg-12" method="post" action="<%=application.getContextPath()%>/ProductController" enctype = "multipart/form-data" data-parsley-validate="" >                             
                            <div class="form-group">
                            	<label>Main Category Name </label>
                        	  	<select class="form-control" required="required" id="selectmaincat" name="selectmaincat" >      
                        	  	<option value=" ">Please Select</option>    
                            	<%
                            		Maincategorydao md= new Maincategorydao();
            	              		List<Maincategorybean> list = md.getallMaincategory();
                	          		for(Maincategorybean maincat: list)
                    	      		{
                        	  	%>
                        	  	     	 <option value="<%=maincat.getMaincatid()%>" ><%=maincat.getMaincatname()%></option>	
                            	<%
        	                  		}
            	          		%>
            	          		</select>
            	          	</div>
                            
                            <div class="form-group">
                            	<label>Sub Category Name </label>
                        	  	<select class="form-control" required="required" id="selectsubcat" name="selectsubcat" >      
                        	  	<option value=" ">Please Select</option>    
                            	<%
                            		Subcategorydao sd= new Subcategorydao();
            	              		List<Subcategorybean> list1 = sd.getallSubcategory();
                	          		for(Subcategorybean subcat: list1)
                    	      		{
                        	  	%>
                        	  	     	 <option value="<%=subcat.getSubcatid()%>" ><%=subcat.getSubcatname()%></option>	
                            	<%
        	                  		}
            	          		%>
            	          		</select>
            	          	</div>            	          	 
            	          	 <div class="fom-control">
            	          	 <label>Specifications</label><br>
                            	<label>Processsor : </label>
                        	  	<select class="" id="selectprocessor" name="selectprocessor" >      
                        	  	<option value=" ">Please Select</option>    
                            	<option value="i3">i3</option>
                            	<option value="i5">i5</option>
                            	<option value="i7">i7</option>
                            	<option value="i9">i9</option>     
								<option value="AMD">AMD</option>                            	                       	
            	          		</select>
            	         
                            	<label>RAM : </label>
                        	  	<select class="" id="selectram" name="selectram" >      
                        	  	<option value=" ">Please Select</option>    
                            	<option value="2 GB">2 GB</option>
                            	<option value="4 GB">4 GB</option>
                            	<option value="8 GB">8 GB</option>
                            	<option value="16 GB">16 GB</option>  
                            	<option value="32 GB">32 GB</option>                          	
            	          		</select>
            	          	
                            	<label>STORAGE HDD : </label>
                        	  	<select class="" id="selecthdd" name="selecthdd" >      
                        	  	<option value=" ">Please Select</option>    
                            	<option value="500 GB HDD">500 GB HDD</option>
                            	<option value="1 TB HDD">1 TB HDD</option>
                            	<option value="2 TB HDD">2 TB HDD</option>                            	                       	
            	          		</select>
            	          
                            	<label>STORAGE SSD : </label>
                        	  	<select class="" id="selectssd" name="selectssd" >      
                        	  	<option value=" ">Please Select</option>                                	
                            	<option value="128 GB SSD">128 GB SSD</option>  
                            	<option value="256 GB SSD">256 GB SSD</option>
                            	<option value="512 GB SSD">512 GB SSD</option>
                            	<option value="1 TB SSD">1 TB SSD</option>                          	
            	          		</select>
            	          	
                            	<label>Graphics Cards : </label>
                        	  	<select class="" id="selectGC" name="selectGC" >      
                        	  	<option value=" ">Please Select</option>    
                            	<option value="2 GB">2 GB</option>
                            	<option value="4 GB">4 GB</option>
                            	<option value="6 GB">6 GB</option>
                            	<option value="8 GB">8 GB</option>
                            	<option value="16 GB">16 GB</option>                              	                          
            	          		</select>
            	          	</div>
            	          	
            	          	<div class="form-group">
                                 <label>Product Name</label>
                                 <input type="text" name="productname"class="form-control" placeholder="Enter Product Name" required autofocus>
                              </div>
                              <div class="form-group">
                                 <label>Product Photo1</label>
                                 <input type="file" name="productphoto1" id="productphoto1" required="required">                                 
                              </div>
                                <div class="form-group">
                                 <label>Product Photo2</label>
                                 <input type="file" name="productphoto2" id="productphoto2" required="required">                                 
                              </div>
                                <div class="form-group">
                                 <label>Product Photo3</label>
                                 <input type="file" name="productphoto3" id="productphoto3" required="required">                                 
                              </div>
                                <div class="form-group">
                                 <label>Product Photo4</label>
                                 <input type="file" name="productphoto4" id="productphoto4" required="required">                                 
                              </div>
                              <div class="form-group">
                                 <label>Price</label>                                 
                                 <input type="text" name="productprice" min= "1" id="productprice"class="form-control" placeholder="Enter Price" data-parsley-type="integer" data-parsley-error-message="Price Must be in numbers">
                              </div>
                              <div class="form-group">
                                 <label>Quantity</label> 
                                 <input type="text" name="productqty" min= "1" id="productqty" class="form-control" placeholder="Enter quantity" required data-parsley-minlength="1" data-parsley-maxlength="3" data-parsley-type="integer" data-parsley-error-message="Quantity Must be in numbers">
                              </div>
                              <div class="form-group">
                                 <label>Specification</label>
                                 <textarea class="form-control" name="productspecification" rows="3" required ></textarea>
                              </div>
                            	<div class="form-group">
                                 <label>Description</label>
                                 <textarea class="form-control" name="productdescription" rows="3" required></textarea>
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
