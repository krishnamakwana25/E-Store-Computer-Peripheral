<%@page import="bean.Orderbean" %>
<%@page import="DAO.Orderdao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Cartbean" %>
<%@page import="DAO.Cartdao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<link rel="Icon" type="image/jpg" href="resources/images/logo1.jpg">
<meta charset="ISO-8859-1">
<jsp:include page="script.jsp"></jsp:include>
<jsp:include page="header1_user.jsp"></jsp:include>
<title>Edit Billing Information</title>
<%
	Orderbean ob = Orderdao.getOrderByUserId(Integer.parseInt(request.getParameter("id1")));
%>
<style type="text/css">


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
<body>

<div class="container editInfo mb-4">
	<!-- =========================FOR EDITING THE DATA ======================== -->
 <div class="panel-heading">
        <h4 class="panel-title heading1">
            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Edit Contact
                and Billing Information</a>
        </h4>
    </div>
 <form action="<%=application.getContextPath() %>/OrderController" method="post" class="saveshippinhinfo">
            <table class="table table-striped" style="font-weight: bold;">            
              <tr>
                  <td style="width: 175px;">
                      <label for="id_email">Name:</label></td>
                  <td>
                      <input class="form-control" id="username" name="updateusername"
                             required="required" type="text" value="<%=ob.getUsername()%>"/>
                  </td>
              </tr>
                
              <tr>
                  <td style="width: 175px;">
                      <label for="id_address_line_1">Address:</label></td>
                  <td>
                      <input class="form-control" id="address"
                             name="updateaddress" required="required" type="text" value="<%=ob.getAdd()%>"/>
                  </td>
              </tr>
             <tr>
                  <td style="width: 175px;">
                        <label for="id_phone">Phone:</label></td>
                    <td>
                        <input class="form-control"  id="phone" name="updatephone" type="text" value="<%=ob.getMobnum()%>"/>
                    </td>
                </tr>
                <tr>
               		<td> 
               			<input type="hidden" name="id" id="id" value="<%=ob.getOrderid()%>">
               			<input type="hidden" name="id1" id="id1" value="<%=ob.getUserid()%>">
               			<input type="submit" name="action"  id="save" class="btn btn-lg btn-success" value="Save">	                	
               		</td>
                </tr> 				
          </table>
        </form>
    </div>
</body>


<jsp:include page="footer.jsp"></jsp:include>
</html>