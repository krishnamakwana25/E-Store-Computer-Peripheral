<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Maincategorybean" %>
<%@page import="DAO.Maincategorydao" %>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Add Sub Category</title>
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
            <h1 class="mt-4"> Add Sub Category</h1>
            <div class="row">
               <!-- Form controls -->
                  <div class="col-sm-12">
                     <div class="panel panel-bd lobidrag">
                        <div class="panel-body">
                           <form class="col-lg-12" action="<%=application.getContextPath()%>/Subcategorycontroller" data-parsley-validate="true" method="post">
                           <div class="form-group">
                            	<label>Main Category Name </label>
                        	  	<select class="form-control" id="selectmaincategory" name="selectmaincategory" required="required" >      
                        	  	 <option value=" ">Please Select</option> 
                            	<% 
                            		Maincategorydao md= new Maincategorydao();
            	              		List<Maincategorybean> list = md.getallMaincategory();
                	          		for(Maincategorybean maincategory: list)
                    	      		{
                        	  	%>                        	  			
                        	  	     	 <option value="<%=maincategory.getMaincatid()%>" ><%=maincategory.getMaincatname() %></option>	
                            	<%
        	                  		}
            	          		%>
            	          		</select>
            	      		</div>
                              <div class="form-group">
                                 <label>Sub Category Name</label>
                                 <input type="text" name="subcategoryname"  id="subcategoryname" class="form-control" placeholder="Enter Sub Category Name"   required autofocus data-parsley-minlength="2" data-parsley-maxlength="30">
                              </div>
                              <div class="reset-button">
                                 <input type="submit"  class="btn btn-lg btn-primary" name="action" value="Insert">
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