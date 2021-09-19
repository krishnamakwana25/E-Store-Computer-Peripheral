<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	int num = Integer.parseInt(request.getParameter("num"));	
	String message = (String) session.getAttribute("message");
%>
<title>Insert title here</title>
</head>
<body onload="preloader1()">
<!-- https://loading.io/asset/371099 -->
<div id="loading"></div>
<%
	if(num == 1)
	{
%>
	<div align="center">
	    <br/>
	    <h3>${message}</h3>
	    <br/>
	<div id="counter" style="font-size: 20px;">5</div>
	</div>
<%
	}
	else if(num ==2)
	{
%>
	<div align="center">
	    <br/>
	    <h3>${message}</h3>
	    <br/>
	<div id="counter" style="font-size: 20px;">5</div>
	</div>
<%
	}
%>
	<script>
		var preloader = document.getElementById("loading");
		function preloader1()
		{
			preloader.style.display = 'none';
		};

        setInterval(function() {
            var div = document.querySelector("#counter");
            var count = div.textContent * 1 - 1;
            div.textContent = count;
            if (count <= 0) {
                window.location.replace("dealer/DealerProfile.jsp");
            }
        }, 1000);
    </script>
</body>
</html>