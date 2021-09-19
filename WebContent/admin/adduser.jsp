<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<%
	Adminbean ub = Admindao.getAdminById((Integer) session.getAttribute("aid"));
%>
 <jsp:include page="head.jsp"></jsp:include>
  <body>
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
            <div class="row">
      <!-- Form controls -->
                  <div class="col-sm-12  font_size_md">
                     <div class="panel panel-bd lobidrag">
                        <div class="panel-body ">
                           <form class="col-lg-12" method="post" action="<%=application.getContextPath()%>/Usercontroller" data-parsley-validate="true" enctype="multipart/form-data"> 
                           <h1 class="mt-4">Add User</h1>
                              <div class="form-group">
                                 <label>User Name</label>
                                 <input type="string" name="usernm"class="form-control" placeholder="Enter Your Name" required autofocus  data-parsley-length="[3,20]" >
                              </div>
                              <div class="form-group">
                                 <label>Photo</label><br>
                                 <input type="file" name="userimg" id="userimg"required data-parsley-min-file-size="50" data-parsley-max-file-size="250">
                              </div>
                              <div class="form-group">
                                 <label>Gender</label><br>
                                 <label class="radio-inline"><input name="gender" value="0" checked="checked" type="radio">Male</label> 
                                 <label class="radio-inline"><input name="gender" value="1" type="radio">Female</label>
                              </div>
                              <div class="form-group">
                                 <label>Password</label>
                                 <input type="password" name="password" class="form-control" placeholder="Enter Your Password" required="required" 	data-parsley-type="alphanum" data-parsley-minlength="6" data-parsley-error-message="Passwords must be at least 6 characters. ">
                              </div>
                              <div class="form-group">
                                 <label>Email</label>
                                 <input data-parsley-type="email"  name="email" class="form-control" placeholder="Enter Your Email" required>
                              </div>
                              <div class="form-group">
                                 <label>Mobile No </label>
                                 <input data-parsley-type="digits" name="mobileno" class="form-control" placeholder="Enter Your Mobile" required data-parsley-max="10" >
                              </div>
                              <div class="form-group">
                                 <label>Address</label>
                                 <textarea class="form-control" placeholder="Enter Your Address"name ="address"rows="3" required  data-parsley-minlength="3" data-parsley-maxlength="50"></textarea>
                              </div>
                              <div class="form-group">
                                 <label>Area</label>
                                 <input type="text" name="area"class="form-control" placeholder="Enter Your Area" required data-parsley-length="[3,30]">
                              </div>
                              <div class="form-group">
                                 <label>City</label>
                                 <input type="text" name="city"class="form-control" placeholder="Enter Your City" required data-parsley-length="[3,30]">
                              </div>
                              <div class="form-group">
                                 <label>State</label>
                                 <input type="text" name="state"class="form-control" placeholder="Enter Your State" required data-parsley-length="[3,30]">
                              </div>
                                  <div class="form-group">
                              <div class="checkbox">
                              <label>
                              	<input type="checkbox" value="remember-me">Remember Password
                              </label>
                              </div>
                              </div>                 
                              <div class="reset-button">
                                 <input type="submit" class="btn btn-lg btn-primary" name="action" value="Add">
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