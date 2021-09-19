<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Productbean" %>
<%@page import="DAO.Productdao" %>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="connection.Connect"%>
<%@page import="bean.Dealerregisterbean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.DealerRegisterdao" %>
<%@page import ="connection.Connect"  %>
<!DOCTYPE html>
<html>
<link rel="Icon" type="image/jpg" href="resources/images/logo1.jpg">
<title>Feedback</title>
<head>
<%
Dealerregisterbean db = DealerRegisterdao.getDealerById((Integer) session.getAttribute("id"));
//out.println(ub.getUserid());
%>

<style type="text/css">

#loading{
	position: fixed;
	width: 100%;
	height: 100vh;
	background: #fff
	url('resources/images/preloader.gif')
	 no-repeat center center;	
	z-index: 99999;
}
</style>
<body onload="preloader1()">

<div id="loading"></div>
<jsp:include page="script.jsp"></jsp:include>
<jsp:include page="header2_dealer.jsp"></jsp:include>

<div class="register" style="padding-top: 0px;padding-bottom: 50px;">		
			<h3 class="animated wow " data-wow-delay=".5s">Feedback</h3>
			<div class="login-form-grids" data-wow-delay=".5s">
				<form action="<%=application.getContextPath()%>/FeedbackController" class="animated wow " data-wow-delay=".5s" method="post" action="#" data-parsley-validate>
					<input type="text" name="name" id="name" placeholder="Name" required data-parsley-length="[3,20]" value=<%=db.getDealername()%>><br>					
					<input type="email" name="email" id="email" placeholder="Email Adddress" required value=<%=db.getDealerMail()%> data-parsley-error-message="Please Enter Valid E-mail" data-parsley-pattern="^[a-z0-9@.]+$"><br>
					<select class="form-control" name="topic" required="required">
					<option value=" ">Select Topic</option>
					<option value="Payment Related">Payment Related</option>
					<option value="Shipping Related">Shipping Related</option>
					<option value="Product Related">Product Related</option>
					<option value="Security Related">Security Related</option>
					<option value="Others">Others</option>
					</select><br>
		
			<h5 class="mb-3">Overall Satisfaction</h5><hr  style="border: 1px solid gray">
			<div class="radio-btns">
					<div class="swit">								
						<div class="check_box_one"> <div class=""> <label><input type="radio" name="satisfaction" checked=" " value="Very Good"><i></i>Very Good</label> </div></div>
                        <div class="check_box"> <div class=""> <label><input type="radio" name="satisfaction" value="Good"><i></i>Good</label> </div></div>
						<div class="check_box"> <div class=""> <label><input type="radio" name="satisfaction" value="Fair"><i></i>Fair</label> </div></div>
						<div class="check_box"> <div class=""> <label><input type="radio" name="satisfaction" value="Poor"><i></i>Poor</label> </div></div>
						<div class="clear"></div>
					</div>
			</div><br>			
			<textarea type="text" placeholder="Your Feedback" name ="message" style="width:100%;" id="message" rows="5"cols="70" required data-parsley-minlength="3" data-parsley-maxlength="50"></textarea><br><br>
			<span class="font_clr" id="error_pwd_msg"></span><br>
			<input type="hidden" name="uid" value="<%out.println(db.getDealerid());%>">
			<input type="submit" value="Send Your Message" name="action" id="btnregister"><br>
		</form>				
	</div>
</div>
<jsp:include page="footer_dealer.jsp"></jsp:include>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
	</script>
</body>
</html>