<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="Icon" type="image/jpg" href="resources/images/logo1.jpg">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Shopping site in India : Laptop,CCTV,Printer...</title>
</head>
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
<!-- https://loading.io/asset/371099 -->
<div id="loading"></div>
<%	
	response.sendRedirect("../user/user_login.jsp");
%>
<script>
		// $(document).ready(function(){
			// 	$('div#loading').removeAttr('id');
		// });
		var preloader = document.getElementById("loading");
		// window.addEventListener('load', function(){
		// 	preloader.style.display = 'none';
		// 	})

		function preloader1(){
			preloader.style.display = 'none';
		};
	</script>
</body>
</html>