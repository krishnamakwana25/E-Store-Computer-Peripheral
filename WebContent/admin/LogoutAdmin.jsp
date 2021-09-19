<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<title>Online Shopping site in India : Laptop,CCTV,Printer...</title>
</head>
<body> <!-- onload="PreLoader()">
 <div id="loading"></div> -->
<%
if(session!=null)
{
	session.invalidate();
	request.getRequestDispatcher("logintry.jsp").include(request, response);
}
%>
</body>
</html>