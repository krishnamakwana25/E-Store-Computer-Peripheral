<%@ page import="java.util.ArrayList"%>  <!-- dxyg0gwq -->
<%@ page import="java.util.List"%>
<%@page import="bean.Dealerregisterbean" %>
<%@page import="DAO.DealerRegisterdao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="Icon" type="image/jpg" href="resources/images/logo1.jpg">
<head>
<link href="resources/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
<%
	Dealerregisterbean db = DealerRegisterdao.getDealerById((Integer) session.getAttribute("id"));	
%>
<title>My Profile</title>	
<style type="text/css">
#loading{
	position: fixed;
	width: 100%;
	height: 100vh;
	background: #fff
	url('resources/images/715.gif')
	 no-repeat center center;	
	z-index: 99999;
}

</style>
</head>
<body onload="myFunction1()">
<!-- https://loading.io/asset/371099 -->
<div id="loading"></div>
	<jsp:include page="header2_dealer.jsp"></jsp:include>
<div class="container card p-4">		
		<h2 class="text-danger" style="font-weight: bolder;font-size: 20px !important;">Hey, <% out.println(db.getDealername());%><hr class="" style="color:yellow ! important;"></h2>
		<div class="row">			
			<div class="col-md-3 pl-1 pr-1  border-right" >
				<form class="view zoom pl-1 pr-1" action="<%=application.getContextPath()%>/DealerRegisterController" method="post" enctype="multipart/form-data">
				<div style="height: 400px;" class="mt-3">
					<img src="../uploadimg/<%=db.getPhoto()%>" class="pl-1 pr-1 mt-5 img-fluid img-thumbnail bg-warning img-responsive h-50 w-100"  >
				</div>
					<button type="button" class="btn btn-md btn-primary mx-auto w-100"  data-toggle="modal" data-target="#edit_photo" ><i class="fa fa-camera"></i></button><br>
				</form>
			</div>			   
			<div class="col-md-9 p-3 border-right" >
				<form class=" " method="post" action="<%=application.getContextPath()%>/DealerRegisterController" data-parsley-validate>
					
					<div class="form-group">
						<label for="user">Dealer Name</label>
						<input type="text" name="user" required id="user" data-parsley-length="[3,20]" value="<% out.println(db.getDealername());%>" class="form-control" disabled>
					</div>
					<div class="form-group">
						<label for="mobno">Mobile Number</label>
						<input type="text" name="mobno" data-parsley-type="integer" required minlength="10" maxlength="10" data-parsley-error-message="It should be valid mobile number" id="mobno" value="<%out.println(db.getContactNo()); %>" class="form-control" disabled>
					</div>
					<div class="form-group">
						<label for="email">E-mail</label>
						<input type="text" name="email" required id="email1" data-parsley-length="[1,256]" value="<%out.println(db.getDealerMail()); %>" placeholder="E-mail" class="form-control"  disabled>
					</div>
					<div class="form-group">
						<label for="address">Address</label>
						<textarea name="address" rows="5" required id="address" data-parsley-length="[1,100]" placeholder="Address" style="resize:none" class="form-control" disabled><%out.println(db.getAddress()); %></textarea>
					</div>
					<div class="form-group text-center"><button class="btn btn-warning" style="visibility: hidden;" name="action" value="Save Profile" type="button" id="savechange">Save Changes</button></div>				
					<div class=" col-md-2" style="float: left;">
                    	<a>						 
						 	<input type="button" data-toggle="modal" data-target="#editprofile_modal" class="btn btn-md btn-success " value="Edit Profile">
						</a>	
	                </div>    
	              <div class=" col-md-2 ml-5" style="float: left;">
	              		<input type="button" class="btn btn-md btn-danger"  data-toggle="modal" data-target="#password_modal" value="Change Password">				
	              </div>
	              <label class="checkbox">
					<span class="pull-right">
			        	<a href="#" class="forgot-password-link forgotpwd" data-toggle="modal" data-target="#forgot_password_form"> Forgot Password?</a>
					</span>
				  </label>     
				</form>
			</div>	
		</div>		
	
	
	<!-- FORGOT PASSWORD -->
<div id="forgot_password_form" class="modal fade" role="dialog" style="margin-top:150px;">
	<div class="modal-dialog modal-md">
		<!-- Modal content-->
		<div class="modal-content">
			<form method="post" action="<%=application.getContextPath()%>/DealerRegisterController" data-parsley-validate="true">
			<div class="modal-header mb-3 bg-danger">
				<h4 class="text-white" style="font-size:2vw ! important;">Password assistance</h4><!-- modal-title 	 -->
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>			
			<div class="modal-body">
				 <p style="font-size: 1.2vw ! important">Enter your e-mail address below to reset your password.</p><br>
		           <input data-parsley-type="email" name="Email" placeholder="Email" autofocus autocomplete="off" class="form-control placeholder-no-fix" required data-parsley-trigger="change" data-parsley-error-message="Please Enter Valid E-mail" data-parsley-pattern="^[a-z0-9@.]+$"><br>
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
	<!-- Modal Over For Forget Password -->
	<!----------------password modal ------------------>
<div id="password_modal" class="modal fade" role="dialog" style="margin-top:150px;">
	<div class="modal-dialog modal-lg">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header bg-danger">				
				<h4 class="text-white" style="font-size:2vw ! important;">Change Password</h4>
				<button type="button" class="close" data-dismiss="modal"><b class="text-white">&times;</b></button>
			</div>			
			<div class="modal-body">
				<form method="post" action="<%=application.getContextPath()%>/DealerRegisterController" data-parsley-validate="true">
					<div class="row">
						<div class="col-sm-12 col-md-6 col-lg-5">
							<h5 class="font-weight-bold ml-3 mt-3" style="font-size:1.5vw !important">Your new password must be:</h5>
							<ul class="ml-4 pt-2" type="disc" style="font-size:1vw !important">
								<li type="disc">Be at least 6 characters in length</li> 
								<li type="disc">Not be same as your current password</li>
							</ul>
						</div>
						
						<div class="col-sm-12 col-md-6 col-lg-6">
							<div class="form-group">
							<%
							 String pwd1 = db.getDealerPassword();
							 String pwd = DealerRegisterdao.decrypt(pwd1);									
							%>
								<div class="adminpwd">
									<label>Please enter your current password below : </label><br><br>
									<input type="password" autofocus class="form-control adminpwd1" required placeholder="Password" name="adminpwd1" id="adminpwd1" data-parsley-minlength="6"  data-parsley-pattern="^[a-zA-Z0-9!@#$%&*]+$" data-parsley-error-message=""><br>
									<input type="hidden" type="password" class="form-control systempwd1" required placeholder="Password" name="systempwd1" id="systempwd1" value="<%=pwd%>">
									<input type="checkbox" onclick="myFunctionForPwd()" class="font-weight-bold">Show Password<br>
									<input type="button" class="btn btn-danger float-right mb-2" name="action" value="Change Password" id="changePassword"  onclick="passwordFun();">									                   
								</div>
																
								<div class="systempwd" style="display:none;">	
									<div class="form-group">
										<label for="" class="font-weight-bold">Current Password</label>
										<%
										 String pwd3 = db.getDealerPassword();
										 String pwd4 = DealerRegisterdao.decrypt(pwd1);									
										%>
										<input type="password" class="form-control" required placeholder="Password" name="currentpassword" id="currentpassword" data-parsley-pattern="^[a-zA-Z0-9!@#$%&*]+$" data-parsley-minlength="6" value="<%=pwd4%>"><br>
										<label for="" class="font-weight-bold">New Password</label>							
										<input type="password" class="form-control" required placeholder="New Password" name="updatenewpwd" id="updatenewpwd" data-parsley-pattern="^[a-zA-Z0-9!@#$%&*]+$" data-parsley-minlength="6" onchange="myPassword()"><br>											
										<label for="" class="font-weight-bold">Confirm Password</label>
										<input type="password" class="form-control" required placeholder="Confirm Password" name="updatenewconfirmpwd" id="updatenewconfirmpwd" data-parsley-pattern="^[a-zA-Z0-9!@#$%&*]+$" data-parsley-minlength="6" onchange="myPassword()"><br>
										<input type="checkbox" onclick="myFunction()" class="font-weight-bold">Show Password<br>
										<span class="font_clr" id="error_pwd_msg"></span><br>
										<span id="error" style="color:red !important"></span><br>
									</div>
									<div class="modal-footer">
										<input type="hidden" name="dealerid" value="<%=db.getDealerid()%>">
										<input type="submit" class="btn btn-danger" name="action" value="Change Password" id="changePassword1">
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
</div>

<!-- CHANGE PHOTO -->
<div class="modal fade" role="dialog" id="edit_photo" style="margin-top:100px;">
	<div class="modal-dialog modal-md">
		<!-- Modal content-->
		<div class="modal-content">
				<form method="post" action="<%=application.getContextPath()%>/DealerRegisterController" data-parsley-validate="true" enctype="multipart/form-data">
			<div class="modal-header mb-3 bg-danger">
				<h4 class="font-weight-bold" style="font-size:2vw ! important;">Change Photo</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>			
			 <div class="modal-body">
		           <label class ="font-weight-bold">Photo<span style="color:red;">*</span></label><br>
					<input type="file" name="photo" id="photo" required data-parsley-min-file-size="50" data-parsley-max-file-size="250" value="<%=db.getPhoto() %>"><br>
		     </div>	
			 <div class="modal-footer">
		        <input type="hidden" name="dealerid" value="<%=db.getDealerid()%>">
		          <button data-dismiss="modal" class="btn btn-default" type="button" name="#" href="#">Cancel</button>		          
				<input type="submit" name="action" class="btn btn-danger" value="Change Photo">			
		     </div>			
			</form>
		</div>
	</div>
</div>

<div id="editprofile_modal" class="modal fade" role="dialog" style="margin-top:150px;">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header bg-danger">
				<h3 class="text-white" style="font-size:2vw ! important;">Change Information</h3>
				<button type="button" class="close" data-dismiss="modal"><b class="text-white">&times;</b></button>
			</div>
				
			<div class="modal-body">
		 		<form method="post" action="<%=application.getContextPath()%>/DealerRegisterController" data-parsley-validate="true">
	                 <div class="form-group">                   
	                      <input type="text" class="form-control" placeholder="User Name" name="updateuser" data-parsley-length="[3,20]" value="<%=db.getDealername()%>" required><br>                             
	                      <input type="text" class="form-control" placeholder="Mail" name="updatemail" data-parsley-type="email" value="<%=db.getDealerMail()%>" required><br>
	                      <input type="text" class="form-control" placeholder="Mobile No." name="updatemobile" data-parsley-type="digits" value="<%=db.getContactNo()%>" required><br>
	                      <input type="text" class="form-control" placeholder="Address" name="updateaddress"  data-parsley-minlength="3" data-parsley-maxlength="50" value="<%=db.getAddress()%>" required><br>
	            	</div>
	                   <div class="reset-button">
	                   	 <input type="hidden" name="dealerid" value="<%=db.getDealerid()%>">
	                   	 <input type="submit"  class="btn btn-lg btn-success" name="action" value="Update" id="update"><br>
	                   </div>
				</form>
			</div>
		</div>
	</div>
</div>

</div>
<jsp:include page="footer_dealer.jsp"></jsp:include>
<jsp:include page="script.jsp"></jsp:include>
<script type="text/javascript">
		/* function enableToEdit(){
			var user = document.getElementById("user");
			var mobno = document.getElementById("mobno");
			var email = document.getElementById("email1");
			var address = document.getElementById("address");
			var photo = document.getElementById("photo");
			var savechange = document.getElementById("savechange");
			var editButton = document.getElementById("editButton");
			if(user.disabled == true){
				user.disabled = false;
				mobno.disabled = false;
				email.disabled = false;
				address.disabled = false;
				photo.disabled = false;
				savechange.setAttribute("type","submit");
				savechange.setAttribute("style","visibility:visible;");
				editButton.innerHTML = "Make Unmodifiable";
			}
			else{
				user.disabled = true;
				mobno.disabled = true;
				email.disabled = true;
				photo.disabled = true;
				address.disabled = true;
				photo.disabled = true;
				savechange.setAttribute("type","button");
				savechange.setAttribute("style","visibility:hidden;");
				editButton.innerHTML = "Make Modifiable";
			}
		} */

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
	function myPassword()
	{
		var oldpwd = document.getElementById('currentpassword').value;
		var newpwd = document.getElementById('updatenewpwd').value;
		var confirmpwd = document.getElementById('updatenewconfirmpwd').value;
	}
	
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
	
	 function myFunctionForPwd() 
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
	var preloader = document.getElementById("loading");
	function myFunction1()
	{
		preloader.style.display = 'none';
	};
	</script>
</body>
</html>