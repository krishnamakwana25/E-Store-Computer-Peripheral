<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<title>My Profile</title>
</head>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery-1.8.3.min.js"></script>
<%
	Adminbean ub = Admindao.getAdminById((Integer) session.getAttribute("aid"));
%>
 <jsp:include page="head.jsp"></jsp:include>
<body onload="PreLoader()">
 <div id="loading"></div>
  <section id="container" >
     <jsp:include page="header.jsp"></jsp:include>     
       <jsp:include page="sidebar.jsp"></jsp:include>
      <section id="main-content">
          <section class="wrapper">
            <div class="row">
            	<div class="col-lg-10 ml-3">
	            	<h1 class="mt-4">Personal Information</h1>   
	            	<br>
	            		<div class="">
							<img src="../uploadimg/<% out.println(ub.getPhoto()); %>" class=" " width="200px" height="200px" style="border: 3px solid black;border-radius: 20%;" ><br><br>  
							<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#edit_photo"><i class="fa fa-camera"></i></button><br>
						</div>	 				
	            	<form action="#" method="post" class="font_size_md" data-parsley-validate>
	            		   <div class="row">
	            		  	<div class="col-sm-6 col-md-6 col-lg-6">
	            		  		<label class ="font-weight-bold">First Name<span style="color:red;">*</span></label>
	            		  		<input data-parsley-type="text" class="form-control" id="firstname"name="firstname" required  autocomplete="off" tabindex="2" placeholder="First Name" required value="<%=ub.getFirstName()%>" disabled><br>
            		  		 	<label class ="font-weight-bold">Address<span style="color:red;">*</span></label>
            		  		 	<textarea data-parsley-type="text" col="30" row="5"name="email" class="form-control" placeholder="" required  disabled><%=ub.getAdress() %></textarea>
            		  		 	<label class ="font-weight-bold">Designation<span style="color:red;">*</span></label>            		  		 	
            		  		 	<input type="text" class="form-control" value="Admin" disabled><br>
            		  		 	<button type="button" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#edit_profile"><i class="fa fa-edit"> Edit Profile</i></button><br>
            		  		 	<span class="edit_profile mt-5" data-toggle="modal" data-target="#Change_password_form">Change Password</span><br>   
								<label class="checkbox">
			            		    <span class="pull-left">
			                    		<a href="#" class="forgot-password-link forgotpwd" data-toggle="modal" data-target="#forgot_password_form"> Forgot Password?</a>
								     </span>
						        </label>            		  		 	                                                    		                          
		  					</div>		  					
		  					
	            		  	<div class="col-sm-6 col-md-6 col-lg-6">
	            		  		<div class="form-group">
	            		  		<label class ="font-weight-bold">Last Name<span style="color:red;">*</span></label>
	            		  			<input data-parsley-type="text" id="lastname" name="lastname"class="form-control" autocomplete="off" required placeholder="Last Name" value="<%= ub.getLastName()%>"  disabled>
	            		  		</div>
	            		  		<div class="form-group">
	            		  		<label class ="font-weight-bold">Phone No.<span style="color:red;">*</span></label>
	            		  			<input data-parsley-type="digits" id="mobileno" name="mobileno"class="form-control" autocomplete="off" required placeholder="Phone No." value="<%= ub.getMobileNo()%>" disabled>
	            		  		</div>
	            		  		<div class="form-group">
	            		  		<label class ="font-weight-bold">Email Address<span style="color:red;">*</span></label>
	            		  			<input data-parsley-type="email" id="email" name="email"class="form-control" autocomplete="off" required placeholder="Email" value="<%=ub.getEmail() %>" disabled>
	            		  		</div>	            		  		            
	            		  	</div>
	            		  </div>                                  	      		                                                   
					</form>
            	</div>
            	<div class="col-lg-2"></div>	
             </div>                          	
             <!-- EDIT PROFILE -->
             <!-- Modal for change password -->
<div class=" modal"  id="edit_profile" style="margin-top:100px;">                                                     
		<div class="modal-dialog modal-lg">
			<div class="modal-content">                                  	                                  
		    	<form method="post" action="<%=application.getContextPath()%>/AdminProfileController" class="font_size_md" data-parsley-validate  enctype = "multipart/form-data">
		    	  	<div class="modal-header mb-3">
						<h4 class="font-weight-bold" style="font-size: 2vw ! important">Change Details</h4><!-- modal-title 	 -->
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>           		 
           		  <div class="row">
           		  	<div class="col-lg-1"></div>
           		  	<div class="col-sm-5 col-md-5 col-lg-5">
           		  		<label class ="font-weight-bold">First Name<span style="color:red;">*</span></label>
           		  		<input data-parsley-type="text" class="form-control"name="firstname" required  autocomplete="off" tabindex="2" placeholder="First Name" required value="<%=ub.getFirstName()%>"><br>
      		  		 	<label class ="font-weight-bold">Address<span style="color:red;">*</span></label>
      		  		 	<textarea data-parsley-type="text" col="30" row="5" name="address" class="form-control" placeholder="" required><%=ub.getAdress() %></textarea>
      		  		 	<div class="form-group">
           		  		<label class ="font-weight-bold">Email Address<span style="color:red;">*</span></label>
           		  			<input data-parsley-type="email" name="email" class="form-control" autocomplete="off" required placeholder="Email" value="<%=ub.getEmail() %>">
           		  		</div>
  					</div>
  					
           		  	<div class="col-sm-5 col-md-5 col-lg-5">
           		  		<div class="form-group">
           		  		<label class ="font-weight-bold">Last Name<span style="color:red;">*</span></label>
           		  			<input data-parsley-type="text" name="lastname"class="form-control" autocomplete="off" required placeholder="Last Name" value="<%= ub.getLastName()%>">
           		  		</div>
           		  		<div class="form-group">
           		  		<label class ="font-weight-bold">Phone No.<span style="color:red;">*</span></label>
           		  			<input data-parsley-type="digits"name="mobileno"class="form-control" autocomplete="off" required placeholder="Phone No." value="<%= ub.getMobileNo()%>">
           		  		</div>           		  		
           		  		<%-- <div class="form-group">
           		  		           		  			
           		  		</div>
           		  		 --%>
           		  		<input type="hidden" name="adminid" value="<%= ub.getAdmin_id()%>">        
           		  		<input type="submit" name="action" class="btn btn-lg btn-primary m-5" value="Save Profile"> 		           		  		              
           		  	</div>
           		  	<div class="col-lg-1"></div>
           		  </div>                                  	      		                                                   
			</form>                   	
 			</div>
 		</div>
 	</div>
             <!-- EDIT PROFILE OVER -->
<!-- Modal for change password -->
  <div class=" modal" id="Change_password_form" style="margin-top:100px;">                                                     
 	<div class="modal-dialog modal-lg">
    	<div class="modal-content">                                  	                                  
        	<form method="post" action="<%=application.getContextPath()%>/AdminProfileController" data-parsley-validate="true">
              		<div class="modal-header mb-3">
					<h4 class="font-weight-bold" style="font-size: 2vw ! important">Change Password</h4><!-- modal-title 	 -->
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>  
					<div class="row">
						<div class="col-sm-12 col-md-6 col-lg-5">
							<h5 class="font-weight-bold ml-3 mt-3" style="font-size:1.5vw !important">Your new password must be:</h5>
							<ul class="pt-2" type="disc" style="font-size:1vw !important">
								<li type="disc">-> Be at least 6 characters in length</li> 
								<li type="disc">-> Not be same as your current password</li>
							</ul>
						</div>
						<div class="col-sm-12 col-md-6 col-lg-6">
							<div class="form-group">
							<%
							 String pwd1 = ub.getPassword();
							 String pwd = Admindao.decrypt(pwd1);									
							%>
								<div class="adminpwd">
									<label>Please enter your current password below : </label><br>
									<input type="password" autofocus class="form-control adminpwd1" required placeholder="Password" name="adminpwd1" id="adminpwd1" data-parsley-minlength="6"  data-parsley-pattern="^[a-zA-Z0-9!@#$%&*]+$" data-parsley-error-message=""><br>
									<input type="hidden" type="password" class="form-control systempwd1" required placeholder="Password" name="systempwd1" id="systempwd1" value="<%=pwd%>">
									<input type="checkbox" onclick="myFunction1()" class="font-weight-bold">Show Password<br>
									<input type="button" class="btn btn-danger float-right mb-2" name="action" value="Change Password" id="changePassword"  onclick="passwordFun();">									                   
								</div>
																
								<div class="systempwd" style="display:none;">	
									<div class="form-group">
										<label for="" class="font-weight-bold">Current Password</label>
										<%
										 String pwd3 = ub.getPassword();
										 String pwd4 = Admindao.decrypt(pwd3);									
										%>
										<input type="password" class="form-control" required placeholder="Password" name="currentpassword" id="currentpassword" data-parsley-pattern="^[a-zA-Z0-9!@#$%&*]+$" data-parsley-error-message="" data-parsley-minlength="6" value="<%=pwd4%>"><br>
										<label for="" class="font-weight-bold">New Password</label>							
										<input type="password" class="form-control" required placeholder="New Password" name="updatenewpwd" id="updatenewpwd" data-parsley-pattern="^[a-zA-Z0-9!@#$%&*]+$" data-parsley-error-message="" data-parsley-minlength="6" onchange="myPassword()"><br>											
										<label for="" class="font-weight-bold">Confirm Password</label>
										<input type="password" class="form-control" required placeholder="Confirm Password" name="updatenewconfirmpwd" id="updatenewconfirmpwd" data-parsley-pattern="^[a-zA-Z0-9!@#$%&*]+$" data-parsley-error-message="" data-parsley-minlength="6" onchange="myPassword()"><br>
										<input type="checkbox" onclick="myFunction()" class="font-weight-bold">Show Password<br>
										<span class="font_clr" id="error_pwd_msg"></span><br>
										<span id="error" style="color:red !important"></span><br>
									</div>
									<div class="modal-footer">
										<input type="hidden" name="adminid" value="<%=ub.getAdmin_id()%>">
										<input type="submit" class="btn btn-danger" name="action" value="Change Password" id="changePassword1" onclick="ChangePwd();">
									</div>																	
								</div>
							</div>
						</div>	
						<div class="col-lg-1"></div>
					</div>												
				</form>                     	
   			</div>
   		</div>
   </div>  
<!-- FORGOT PASSWORD -->
<div class=" modal" id="forgot_password_form" style="margin-top:100px;">                                                     
    <div class="modal-dialog modal-md">
      	<div class="modal-content">                                  	                                  
      		<form method="post" action="<%=application.getContextPath()%>/AdminProfileController" data-parsley-validate="true">
       			<div class="modal-header mb-3">
					<h4 class="font-weight-bold" style="font-size:2vw ! important;">Password assistance</h4><!-- modal-title 	 -->
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>  
				 <div class="modal-body">
		           <p style="font-size: 1.2vw ! important">Enter your e-mail address below to reset your password.</p>
		           <input data-parsley-type="email" name="Email" placeholder="Email" autofocus autocomplete="off" class="form-control placeholder-no-fix" required data-parsley-trigger="change" data-parsley-error-message="Please Enter Valid E-mail" data-parsley-pattern="^[a-z0-9@.]+$">
		           <p class="font-weight-bold" style="font-size:15px ! important;">Enter the email address associated with your E-Store account.</p>
		       </div>	
		        <div class="modal-footer">
		          <button data-dismiss="modal" class="btn btn-default" type="button" name="#" href="#">Cancel</button>		          
				<input type="submit" name="action" class="btn btn-danger" value="Submit Your Mail">			
		      </div>								
			</form>                     	
		</div>
	</div>
</div>

<!-- CHANGE PHOTO -->
<div class="modal" id="edit_photo" style="margin-top:100px;">                                                     
    <div class="modal-dialog modal-md">
      	<div class="modal-content">                                	                                  
      		<form method="post" action="<%=application.getContextPath()%>/AdminProfileController" data-parsley-validate="true" enctype="multipart/form-data">
       			<div class="modal-header mb-3">
					<h4 class="font-weight-bold" style="font-size:2vw ! important;">Change Photo</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>  
				 <div class="modal-body">
		           <label class ="font-weight-bold">Photo<span style="color:red;">*</span></label><br>
					<input type="file" name="photo" id="photo" required data-parsley-min-file-size="50" data-parsley-max-file-size="250" value="<%=ub.getPhoto() %>"><br>
		       </div>	
		        <div class="modal-footer">
		        <input type="hidden" name="adminid" value="<%=ub.getAdmin_id()%>">
		          <button data-dismiss="modal" class="btn btn-default" type="button" name="#" href="#">Cancel</button>		          
				<input type="submit" name="action" class="btn btn-danger" value="Change Photo">			
		      </div>								
			</form>                     	
		</div>
	</div>
</div>
<!-- Modal Over For Forget Password -->
<!-- Modal for change password OVER-->                            
        </section>
      </section>   
  </section>  
  <script type="text/javascript">
  		jQuery(document).ready(function($){
		  	$('#changePassword1').click(function(event) 
		  	{				  		
		  		var pwd = $('#currentpassword').val();
		  		var upassword1 = $('#updatenewpwd').val();
		  		var uconfirmPassword1 = $('#updatenewconfirmpwd').val();		  		
	            if(upassword1=="" && uconfirmPassword1=="")
	            {
	            	alert("*Please fill Password");
	            	event.preventDefault();
	           	}	          
	            else if( (pwd == upassword1) && (pwd == uconfirmPassword1) )
	            {
	            	alert("*Please enter different password");
	            	event.preventDefault();
	            }
	            else if (upassword1 != uconfirmPassword1) 
	            {
	            	alert("*Enter Confirm Password Same as New Password");
	            	event.preventDefault();
	            }
	            else
	           	{
	            	alert("*Password Updated Successfully ..!");           	   
	           	}	     
		  	});
		  });		 

		function myPassword()
		{
			var oldpwd = document.getElementById('currentpassword').value;
			var newpwd = document.getElementById('updatenewpwd').value;
			var confirmpwd = document.getElementById('updatenewconfirmpwd').value;
		}
		
		function passwordFun()
		{
			var adminpwd = $('#adminpwd1').val();			
			var systempwd = $('#systempwd1').val();			
			if(adminpwd == systempwd)
			{						
				$(".systempwd").show();	
				$(".adminpwd").hide();	
				alert("Correct Password..!"); 	
			}		
			else
			{
				alert("PLease Enter Correct Password");
			}
		}
		 function myFunction1() 
		 {
			  var x = document.getElementById("adminpwd1");
			  if (x.type === "password") 
			  {
			    x.type = "text";
			  }
			  else 
			  {
			    x.type = "password";
			  }
			}
		 function myFunction() 
			{			
				  var x = document.getElementById("currentpassword");
				  var x1 = document.getElementById("updatenewpwd");
				  var x2 = document.getElementById("updatenewconfirmpwd");
				  if ((x.type === "password") ||  (x1.type === "password") ||  (x2.type === "password"))
				  {
				      x.type = "text";
					  x1.type = "text";
					  x2.type="text";
				  } 
				  else 
				  {
					    x.type = "password";
					  	x1.type = "password";
					  	x2.type = "password";
				  }
			}
	</script>  	 
     </body>
     <jsp:include page="script1.jsp"></jsp:include>
</html>