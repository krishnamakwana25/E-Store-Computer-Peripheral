<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Shopping site in India : Laptop,CCTV,Printer...</title>
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
<body onload="preloader1()">
<div id="loading"></div>

<%
if(session!=null)
{
	session.invalidate();
	request.getRequestDispatcher("user_login.jsp").include(request, response);
}
%>
</body>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

</html>