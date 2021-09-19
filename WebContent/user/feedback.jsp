<%@page import="DAO.Userdao"%>
<%@page import="bean.Userbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Cartbean" %>
<%@page import="DAO.Cartdao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feedback</title>
<link href="resources/css/feedback_css.css" rel="stylesheet" type="text/css" media="all" />
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
<%
	Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
%>
<body onload="preloader1()">
<div id="loading"></div>

<jsp:include page="header1_user.jsp"></jsp:include>
<div class="register" style="padding-top: 0px;padding-bottom: 50px;">		
			<h3 class="animated wow " data-wow-delay=".5s">Feedback</h3>
			<div class="login-form-grids" data-wow-delay=".5s">
				<form action="<%=application.getContextPath()%>/FeedbackController" class="animated wow " data-wow-delay=".5s" method="post" action="#" data-parsley-validate="true">
					<input type="text" name="name" id="name" placeholder="Name" required data-parsley-length="[3,20]" value=<%= ub.getUsername()%>><br>					
					<input type="email" name="email" id="email" placeholder="Name" required value=<%= ub.getMail()%> data-parsley-error-message="Please Enter Valid E-mail" data-parsley-pattern="^[a-z0-9@.]+$"><br>					
					<select class="form-control" name="topic" required="required">
					<option value=" ">Select Topic</option>
					<option value="Payment Related">Payment Related</option>
					<option value="Shipping Related">Shipping Related</option>
					<option value="Product Related">Product Related</option>
					<option value="Security Related">Security Related</option>
					<option value="Others">Others</option>
					</select><br>
					<h5>Overall Satisfaction</h5>
					<div class="radio-btns">
						<div class="swit">								
						<div class="check_box_one"> <div class=""> <label><input type="radio" name="satisfaction" checked value="Very Good"><i></i>Very Good</label> </div></div>
                        <div class="check_box"> <div class=""> <label><input type="radio" name="satisfaction" value="Good"><i></i>Good</label> </div></div>
						<div class="check_box"> <div class=""> <label><input type="radio" name="satisfaction" value="Fair"><i></i>Fair</label> </div></div>
						<div class="check_box"> <div class=""> <label><input type="radio" name="satisfaction" value="Poor"><i></i>Poor</label> </div></div>
						<div class="clear"></div>
						</div>
					</div>
				<textarea type="text" placeholder="Type Here"name ="message" style="width:100%;" id="message" rows="5"cols="70" required=" "  data-parsley-minlength="3" data-parsley-maxlength="50"></textarea><br><br>
				<span class="font_clr" id="error_pwd_msg"></span><br>
				<input type="hidden" name="uid" value="<%out.println(ub.getUserid());%>">
				<input type="submit" value="Send Your Message!" name="action" id="btnregister"><br>
			</form>						
		</div>
</div>
<jsp:include page="footer_user.jsp"></jsp:include>
</body>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

<jsp:include page="script.jsp"></jsp:include>
</html>