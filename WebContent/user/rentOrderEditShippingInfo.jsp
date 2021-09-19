<%@page import="bean.RentOrderbean" %>
<%@page import="DAO.RentOrderdao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="script.jsp"></jsp:include>
<jsp:include page="header1_user.jsp"></jsp:include>
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<title>Edit Billing Information</title>
<%
	RentOrderbean rob = RentOrderdao.getRentOrderByUserId(Integer.parseInt(request.getParameter("id1")));
%>
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
.heading1
{
	font-size: 2.5vw;
	text-align:center !important; 
}
.editInfo
{
	box-shadow:0px 2px 8px grey !important;
	background-color:   #f8f8ff !important;
}
</style>
</head>
<body onload="preloader1()">
<div id="loading"></div>

<div class="container editInfo mb-4">
	<!-- =========================FOR EDITING THE DATA ======================== -->
 <div class="panel-heading">
        <h4 class="panel-title heading1">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Edit Contact
                and Billing Information</a>
        </h4>
    </div>
 <form action="<%=application.getContextPath() %>/RentOrderController" method="post" class="saveshippinhinfo">
            <table class="table table-striped" style="font-weight: bold;">            
              <tr>
                  <td style="width: 175px;">
                      <label for="id_email">Name:</label></td>
                  <td>
                      <input class="form-control" id="username" name="updateusername"
                             required="required" type="text" value="<%=rob.getUsername()%>"/>
                  </td>
              </tr>
              <tr>
                  <td style="width: 175px;">
                      <label for="id_address_line_1">Address:</label></td>
                  <td>
                      <input class="form-control" id="address"
                             name="updateaddress" required="required" type="text" value="<%=rob.getAdd()%>"/>
                  </td>
              </tr>
             <tr>
                  <td style="width: 175px;">
                        <label for="id_phone">Phone:</label></td>
                    <td>
                        <input class="form-control"  id="phone" name="updatephone" type="text" value="<%=rob.getMobnum()%>"/>
                    </td>
                </tr>
                <tr>
               		<td> 
               			<input type="hidden" name="id" id="id" value="<%=rob.getRentOrderId()%>">
               			<input type="hidden" name="id1" id="id1" value="<%=rob.getUserid()%>">
               			<input type="submit" name="action"  id="save" class="btn btn-lg btn-success" value="Save">	                	
               		</td>
                </tr> 				
          </table>
        </form>
    </div>
</body>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

<jsp:include page="footer.jsp"></jsp:include>
</html>