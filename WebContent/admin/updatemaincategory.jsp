<%@page import ="bean.Maincategorybean" %>
<%@page import ="DAO.Maincategorydao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Update Main Category</title>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<%	
	Maincategorybean mb= Maincategorydao.getMaincategoryById(Integer.parseInt(request.getParameter("id")));	
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
            <h1 class="mt-4">Update Main Category</h1>
            <div class="row">
            	  <div class="col-sm-12">
                     <div class="panel panel-bd lobidrag">
                     <h1></h1>
                        <div class="panel-body">
                           <form class="col-lg-12" method="post" action="<%=application.getContextPath()%>/Maincategorycontroller" data-parsley-validate="true">
                              <div class="form-group">
                              <label>Main Category Id : <a style="font-weight: bold;"><%=mb.getMaincatid()%></a></label>
                              	<hr>
                                 <input type="text" hidden="" class="form-control"placeholder="Id" name="id" value="<%=mb.getMaincatid()%>">
                                 <label>Category Name</label>
                                 <input type="text" class="form-control"placeholder="Main Category" name="updatemaincategory" data-parsley-minlength="3" data-parsley-maxlength="30" value="<%=mb.getMaincatname()%>">
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