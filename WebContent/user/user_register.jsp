<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Statebean" %>
<%@page import="DAO.Statedao" %>    
<%@ page import="DAO.Citydao" %>
<%@ page import="bean.Citybean" %>
<%@page import="bean.Areabean" %>
<%@page import="DAO.Areadao" %>    
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
	<title>Register Page</title>
	<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
	<style type="text/css">
#loading{
	position: fixed;
	width: 100%;
	height: 100vh;
	background: #fff
	url('resources/images/loader.gif')
	 no-repeat center center;	
	z-index: 99999;
	}
</style>
	
</head>
<jsp:include page="script.jsp"></jsp:include>
<jsp:include page="header.jsp"></jsp:include>
<body onload="preloader1()">
<div id="loading"></div>
  
<% if(request.getParameter("msg") != null){
		   	 if(request.getParameter("msg").equals("logAgain")){%>
			<div class="alert alert-danger alert-dismissible fade show text-center h5" role="alert" style="font-size: 1vw;"><strong>Login Again !...</strong> Please Login to access that page.<button type="button" class="close p-0" data-dismiss="alert" onclick='location.href="user_login.jsp";' aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
		<% } else if(request.getParameter("msg").equals("failed")){%>
			<div class="alert alert-danger alert-dismissible fade show text-center h5" role="alert" style="font-size: 1vw;"><strong>Login Failed !...</strong> Email or Password incorrect.<button type="button" class="close p-0" data-dismiss="alert"  aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
		<% } else if(request.getParameter("msg").equals("regSuc")){%>
			<div class="alert alert-success alert-dismissible fade show text-center h5" role="alert" style="font-size: 1vw;"><strong>Registered Successfully !...</strong><button type="button" class="close p-0" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
		<% } else if(request.getParameter("msg").equals("alReg")){%>
			<div class="alert alert-success alert-dismissible fade show text-center h5" role="alert" style="font-size: 1vw;"><strong>This email is Already Registered with our System ...!</strong><button type="button" class="close p-0" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button></div>
		<% }}
%>
<!-- breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">	
			<ol class="breadcrumb breadcrumb1 animated wow " data-wow-delay=".5s">
				<li><a href="index.jsp"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Register Page</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- register -->
<div class="container">
	<div class="register">		
			<h3 class="animated wow " data-wow-delay=".5s">Register Here</h3>
			<div class="login-form-grids" data-wow-delay=".5s">
				<form class="animated wow " data-wow-delay=".5s" method="post" action="<%=application.getContextPath()%>/Usercontroller" data-parsley-validate enctype = "multipart/form-data">
					<input type="text" name="usernm" id="usernm" placeholder="User Name" required autofocus  data-parsley-length="[3,20]"><br>
					<input type="email" placeholder="Email Address"  name="email" id="email" required="required" data-parsley-error-message="Please Enter Valid E-mail" data-parsley-pattern="^[a-z0-9@.]+$"><br>
					<input type="text" name="mobileno" placeholder="Mobile Number" required data-parsley-maxlength="10" data-parsley-type="integer" data-parsley-error-message="Mobile Number must be 10 digit"><br>
					<textarea type="text" placeholder="Address"name ="address" id="address" rows="5" required  data-parsley-minlength="3" data-parsley-maxlength="100" style="width:100%;"></textarea><br><br>
			        <select class="form-control" id="selectarea" name="selectarea" required="required">       
                   	  	<option value=" ">Please Select Area</option> 
                       	<%
                       		Areadao ad= new Areadao();
       	              		List<Areabean> list1 = ad.getallArea();
           	          		for(Areabean area: list1)
               	      		{
                   	  	%>
                   	  	     	 <option value="<%=area.getAid()%>" ><%=area.getAreaname() %></option>	
                       	<%
   	                  		}
       	          		%>
           	        </select><br>                    
                 <select class="form-control" required="required" id="selectcity" name="selectcity">       
                        	  	<option value=" ">Please Select City</option> 
                            	<%
                            		Citydao cd= new Citydao();
            	              		List<Citybean> list2 = cd.getallCity();
                	          		for(Citybean city: list2)
                    	      		{
                        	  	%>
                        	  	     	 <option value="<%=city.getCid()%>" ><%=city.getCityname() %></option>	
                            	<%
        	                  		}
            	          		%>
            	  </select><br>
                  	<select class="form-control" required="required" id="selectstate" name="selectstate">    
                      	  	<option value=" ">Please Select State</option>    
                          	<%
      	                  		Statedao sd= new Statedao();
          	              		List<Statebean> list = sd.getallState();
              	          		for(Statebean state: list)
                  	      		{
                      	  	%>
                      	  	     	 <option value="<%=state.getSid()%>" ><%=state.getStatename() %></option>	
                          	<%
      	                  		}
          	          		%>
          	        </select><br>
          	        <input type="password" placeholder="Password" name="upassword" id="upassword" required="required" data-parsley-type="alphanum" data-parsley-minlength="6" data-parsley-maxlength="20" data-parsley-error-message="Passwords must be at least 6 characters."data-parsley-pattern="^[a-zA-Z0-9!@#$%&*]+$"><br>
					<input type="password" placeholder="Password Confirmation" name="ucofirmpassword" id="ucofirmpassword" required="required" data-parsley-type="alphanum" data-parsley-minlength="6" data-parsley-maxlength="20" data-parsley-error-message="Passwords must be at least 6 characters"data-parsley-pattern="^[a-zA-Z0-9!@#$%&*]+$">
					<input type="checkbox" onclick="myFunction()">Show Password<br>
					<span class="font_clr" id="error_pwd_msg"></span><br>
					<input type="file" name="photo" id="photo" required data-parsley-min-file-size="50" data-parsley-max-file-size="250"><br>
						<input type="submit" value="Register" name="action" name="btnregister" id="btnregister"><br>
					<div class="pull-center">
						<a class ="ml-5" href="user_login.jsp">Already registered ? </a>						
					</div>
				</form>
			</div>
			<div class="register-home animated wow " data-wow-delay=".5s">
				<a href="index.jsp">Home</a>				
			</div>
		</div>	
</div>
<!-- //register -->
<!-- footer -->
<script type="text/javascript">
    $(function () {
        $("#btnregister").click(function () {
            var upassword1 = $("#upassword").val();
            var uconfirmPassword1 = $("#ucofirmpassword").val();
            if(upassword1=="" && uconfirmPassword1=="")
            {
                document.getElementById('error_pwd_msg').innerHTML="*Please fill Password";
               // return false;
           	}
            else if (upassword1 != uconfirmPassword1) {
                document.getElementById('error_pwd_msg').innerHTML="*Enter Confirm Password Same as Password";
                return false;
            }
            else
           	{
           	document.getElementById('error_pwd_msg').innerHTML="*Macthed";
               return true;
           	}
        });
    });
</script>
	<jsp:include page="footer.jsp"></jsp:include>
<!-- //footer -->
	
<script type="text/javascript">
 $(function () {
     $("#btnregister").click(function () {
         var password1 = $("#upassword").val();
         var confirmPassword1 = $("#ucofirmpassword").val();
         if(password1==" " && confirmPassword1==" ")
         {
             document.getElementById('error_pwd_msg').innerHTML="*Enter Confirm Password Same as Password";
             return false;
        	}
         if (password1 != confirmPassword1) {
             document.getElementById('error_pwd_msg').innerHTML="*Enter Confirm Password Same as Password";
             return false;
         }
         else
        	{
        	document.getElementById('error_pwd_msg').innerHTML="*Macthed";
            return true;
        	}
     });
 });
 
 function myFunction() {
  var x = document.getElementById("upassword");
  var x1 = document.getElementById("ucofirmpassword");
  if ((x.type === "password") ||  (x1.type === "password"))
  {
    x.type = "text";
  x1.type = "text";
  } 
  else 
  {
    x.type = "password";
  x1.type = "password";
  }
 }
</script>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

</body>
</html>