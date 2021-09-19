<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	int num = Integer.parseInt(request.getParameter("num"));	
	String message = (String) session.getAttribute("message");
%>
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<title>Message</title>
</head>
<body onload="PreLoader()">
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
        setInterval(function() {
            var div = document.querySelector("#counter");
            var count = div.textContent * 1 - 1;
            div.textContent = count;
            if (count <= 0) {
                window.location.replace("user/profile.jsp");
            }
        }, 1000);
    </script>
</body>
</html>