<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<title>Online Shopping site in India : Laptop,CCTV,Printer...</title>
 <jsp:include page="head.jsp"></jsp:include>
  <body>  
  <% if(request.getParameter("msg") != null){
		   	 if(request.getParameter("msg").equals("failed")){%>
			<div style="opacity: 70%;" class="alert alert-danger alert-dismissible fade show text-center h5" role="alert"><strong style="opacity: 100% !important;">Login Failed...!</strong><a style="opacity: 100% !important;">Email or Password incorrect.</a><button type="button" class="close" data-dismiss="alert"  aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
		<% } }
%>	
 <section id="container" >
      <section id="main-content">
          <section class="wrapper">         
            <div class="row">
           		 <div class="col-sm-2"></div>                              
                  	<div class="col-sm-6 font_size_md">         
               			<div class="panel panel-bd lobidrag">
                        	<div class="panel-body ">               
	                        	 <div style="height:200px; width:200px; margin:0px auto;">
			                          <img alt="" class="img img-responsive" src="resources/img/loginprofile.jpg" height="200px" width="200px"> 
			                     </div>                          
                           		<form action="<%=application.getContextPath()%>/AdminController" class="col-lg-12" id=""  method="post" data-parsley-validate="true" class="font_size_md">
		                              <h1 align="center">Log in</h1>		                             
		                              <div class="form-group">
		                                 <label>Email Address</label>
		                                 <input data-parsley-type="email" id="username" autocomplete="off" name="email"class="form-control" autocomplete="on" autofocus placeholder="Enter Email Address" required="required" data-parsley-trigger="change" data-parsley-error-message="Please Enter Valid E-mail" data-parsley-pattern="^[a-z0-9@.]+$">
		                              </div>
		                               <div class="form-group">
		                                 <label>Password</label>
		                                 <input type="password" name="password" id="password" class="form-control" placeholder="Enter Password" required="required" data-parsley-minlength="6" data-parsley-maxlength="20" data-parsley-pattern="^[a-zA-Z0-9!@#$%&*]+$" data-parsley-error-message="Please Enter Valid Password"><br>
		                                  <input type="checkbox" onclick="myFunction()">Show Password
		                              </div>    
		                              <div class="reset-button">
		                               <input type="submit" name="action" id="login"class="btn btn-lg btn-theme btn-block"  value="Login" > <!-- onclick="validate()" -->
		                              </div>                       
		                               <label class="checkbox">
				            		    <span class="pull-right">
				                    		<a href="#" class="forgot-password-link forgotpwd" data-toggle="modal" data-target="#forgot_password_form"> Forgot Password?</a>
									     </span>
							            </label>
							     </form>         
                       		</div>
                     	</div>            
                  	</div>      
                 	<div class="col-sm-2"></div> 
             	</div>            
        	</section>
      	</section>
  	</section>
  <!-- FORGOT PASSWORD -->
<div class=" modal" id="forgot_password_form" style="margin-top:100px;">                                                     
    <div class="modal-dialog modal-md">
      	<div class="modal-content">                                  	                                  
      		<form method="post" action="<%=application.getContextPath()%>/AdminProfileController" data-parsley-validate="true">
       			<div class="modal-header mb-3">
					<h4 class="" style="font-size:2vw ! important;">Password assistance</h4><!-- modal-title 	 -->
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>  
				 <div class="modal-body">
		           <p style="font-size: 1.2vw ! important">Enter your e-mail address below to reset your password.</p>
		           <input data-parsley-type="email" name="Email" placeholder="Email" autofocus autocomplete="off" class="form-control placeholder-no-fix" required data-parsley-trigger="change" data-parsley-error-message="Please Enter Valid E-mail" data-parsley-pattern="^[a-z0-9@.]+$">
		           <p class="font-weight-bold" style="font-size:15px ! important;">Enter the email address associated with your E-Store account.</p>
		       </div>	
		        <div class="modal-footer">
		          <button data-dismiss="modal" class="btn btn-default" type="button" name="#">Cancel</button>		          
				<input type="submit" name="action" class="btn btn-danger" value="Submit">			
		      </div>								
			</form>                     	
		</div>
	</div>
</div>  
  <!-- FORGOT PASSWORD OVER -->
	 <jsp:include page="script.jsp"></jsp:include>	 	 
	 <!--BACKSTRETCH-->
    <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
    <script type="text/javascript" src="resources/js/jquery.backstretch.min.js"></script>
    <script>
        $.backstretch("resources/img/bgloginimg2.jpg", {speed: 800,opacity:0});
    </script>	 
<script type="text/javascript">
function myFunction() {
	  var x = document.getElementById("password");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
</script>
     </body>
 </html>