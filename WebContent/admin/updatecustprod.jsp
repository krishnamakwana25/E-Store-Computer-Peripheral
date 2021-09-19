<%@page import ="DAO.Custproddao" %>
<%@page import ="bean.CustProdBean" %>   
<%@ page import="DAO.CustCatdao" %>
<%@ page import="bean.CustomCatbean" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Update Customize Products</title>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<%
	CustProdBean cb= Custproddao.getProductById(Integer.parseInt(request.getParameter("id")));
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
            <h1 class="mt-4">Update Customize Products</h1>
            <div class="row">
            	  <div class="col-sm-12">
                     <div class="panel panel-bd lobidrag">
                     <h1></h1>
                        <div class="panel-body">
                           <form class="col-lg-12" method="post" action="<%=application.getContextPath()%>/CustProdController" data-parsley-validate="true">
                              <div class="form-group">
                              <label>Product Id : <a style="font-weight: bold;"><%=cb.getCustproid() %></a></label>
                              <hr>
                                 <input type="text" hidden="" class="form-control" placeholder="Id" name="updatecustproid" value="<%=cb.getCustproid()%>">
                              </div>
                              <div class="fom-control"> 
                              <label>Main Customize Category</label>
                         	     <select class="form-control" required="required" id="updatecustcat" name="updatecustcat">    
										<%
										CustCatdao cd= new CustCatdao();
										List<CustomCatbean> list3 = cd.getallCustomecategory();
										for(CustomCatbean custcat: list3)
										{
										%>
									     	 <option value="<%=custcat.getCustmaincatid()%>"  <% if(cb.getCustmaincatid() == custcat.getCustmaincatid()) out.println("selected"); %>> 
									     	 <%=custcat.getCustcatname() %></option>	
										<%
										}
										%>
								</select><br>
							<label>Product Name</label> 
								<input type="text" class="form-control" placeholder="Product Name" name="updatecustproname" data-parsley-minlength="3" data-parsley-maxlength="50" value="<%=cb.getCustproname()%>"><br>
                            <label>Price</label>
								<input type="text" class="form-control" placeholder="Product Price" name="updatecustproprice" min="1" value="<%=cb.getCustproprice()%>"  data-parsley-type="integer" data-parsley-error-message="Price Must be in numbers"><br>
							<label>Quantity</label>
								<input type="text" class="form-control" placeholder="Product Quantity" name="updatecustqty" min="1" value="<%=cb.getCustproqty()%>" data-parsley-type="integer" data-parsley-error-message="Quantity Must be in numbers"><br>
							<label>Specification</label>
                                <input type="text" class="form-control"name="updatecustprospecification" data-parsley-trigger="keyup" data-parsley-maxlength="3000" value="<%=cb.getCustprospecification()%>"><br>                                 
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