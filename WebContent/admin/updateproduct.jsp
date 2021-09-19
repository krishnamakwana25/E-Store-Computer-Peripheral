<%@page import ="DAO.Productdao" %>
<%@page import ="bean.Productbean" %>
<%@page import="bean.Subcategorybean" %>
<%@page import="DAO.Subcategorydao" %>    
<%@ page import="DAO.Maincategorydao" %>
<%@ page import="bean.Maincategorybean" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Update Products</title>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<%
	Productbean pb= Productdao.getProductById(Integer.parseInt(request.getParameter("id")));
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
            <h1 class="mt-4">Update Product</h1>
            <div class="row">
            	  <div class="col-sm-12">
                     <div class="panel panel-bd lobidrag">
                     <h1></h1>
                        <div class="panel-body">
                           <form class="col-lg-12" method="post" action="<%=application.getContextPath()%>/ProductController" data-parsley-validate="true">
                              <div class="form-group">
                              
                              <label>Product Id : <a style="font-weight: bold;"><%=pb.getProductid()%></a></label>
                              <hr>
                                 <input type="text" hidden="" class="form-control" placeholder="Id" name="updateproid" value="<%=pb.getProductid()%>">
                                 <label>Main Category</label>
                         	     <select class="form-control" required="required" id="updatemaincat" name="updatemaincat">    
										<%
										Maincategorydao md= new Maincategorydao();
										List<Maincategorybean> list3 = md.getallMaincategory();
										for(Maincategorybean maincat: list3)
										{
										%>
									     	 <option value="<%=maincat.getMaincatid()%>"  <% if(pb.getMaincatid() == maincat.getMaincatid()) out.println("selected"); %>> 
									     	 <%=maincat.getMaincatname() %></option>	
										<%
										}
										%>
								</select><br>
								<label>Sub Category</label>
                                  <select class="form-control" required="required" id="updatesubcat" name="updatesubcat">       
										<%			
										Subcategorydao sd = new Subcategorydao();
										List<Subcategorybean> list1 = sd.getallSubcategory();
										for(Subcategorybean subcat: list1)
										{
										%>
									     	 <option value="<%=subcat.getSubcatid()%>" <% if(pb.getSubcatid() == subcat.getSubcatid()) out.println("selected"); %>>
									     	 <%=subcat.getSubcatname() %></option>	
										<%
										}
										%>
								 </select><br>
								 </div>
						  	 <div class="fom-control">
            	           	<label>Product Name</label>
								<input type="text" class="form-control" placeholder="Product Name" name="updateproname" data-parsley-minlength="3" data-parsley-maxlength="50" value="<%=pb.getProductName()%>"><br>
                            <label>Price</label>
                                 <input type="text" class="form-control" min= "1" placeholder="Product Price" name="updateproprice" value="<%=pb.getProductPrice()%>"  data-parsley-type="integer" data-parsley-error-message="Price Must be in numbers"><br>
                            <label>Quantity</label> 
                                 <input type="text" class="form-control" min= "1" placeholder="Product Quantity" name="updateqty" value="<%=pb.getProductQty1()%>"  data-parsley-type="integer" data-parsley-error-message="Quantity Must be in numbers"><br>
                           <label>Specification</label>                            
                                 <input type="text" class="form-control"name="updateprospecification" data-parsley-trigger="keyup" data-parsley-maxlength="3000" value="<%=pb.getProductSpecification1()%>"><br>
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
