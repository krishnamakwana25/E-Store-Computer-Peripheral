<%@page import="DAO.Userdao"%>
<%@page import="bean.Userbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.CustomOrderBean" %>
<%@page import="DAO.CustOrderdao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<head>
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<title>Shipping Information</title>
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
<body>
<%
	CustomOrderBean ub = CustOrderdao.getCustOrderByUserId((Integer)session.getAttribute("id"));
%>
                  <!-- =====================================SHIPPING INFO====================================== -->                        
 <div class="panel panel-default">
   <div class="panel-heading">
       <h4 class="panel-title">
           <div style="text-align: center; width:100%;"><a style="width:100%;"
                                                           data-toggle="collapse"
                                                           data-parent="#accordion"
                                                           href="#collapseTwo"
                                                           class=" btn btn-success"
                                                           onclick="$(this).fadeOut(); $('#payInfo').fadeIn();">Continue
                to Billing Information»</a></div>
        </h4>
    </div>
</div>
<div class="panel panel-default">
     <div class="panel-heading">
    <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Contact
            and Billing Information</a>
    </h4>
	</div>
    <div id="collapseTwo" class="panel-collapse collapse">
        <div class="panel-body">
            <b>Help us keep your account safe and secure, please verify your billing
                information.</b>
            <br/><br/>
            <form action="<%=application.getContextPath() %>/CustOrderController" method="post">
            <table class="table table-striped" style="font-weight: bold;">            
              <tr>
                  <td style="width: 175px;">
                      <label for="id_email">Name:</label></td>
                  <td>
                      <input class="form-control" id="username" name="username" disabled
                             required="required" type="text" value="<%=ub.getUnm()%>"/>
                  </td>
              </tr>
                <tr>
                  <td style="width: 175px;">
                      <label for="id_email">Email:</label></td>
                  <td>
                      <input class="form-control" id="email" name="email" disabled
                             required="required" type="text" value="<%=ub.getMail()%>"/>
                  </td>
              </tr>
              <tr>
                  <td style="width: 175px;">
                      <label for="id_address_line_1">Address:</label></td>
                  <td>
                      <input class="form-control" id="address"
                             name="address" required="required" disabled  type="text" value="<%=ub.getAdd()%>"/>
                  </td>
              </tr>        
              <tr>
                  <td style="width: 175px;">
                        <label for="id_phone">Phone:</label></td>
                    <td>
                        <input class="form-control" disabled id="phone" name="phone" type="text" value="<%=ub.getMobile()%>"/>
                    </td>
                </tr>
                <tr>
               		<td> 
               		<a href="">
	               		<input type="hidden" name="id" id="id" value="<%=ub.getCustorderid()%>">
	               		<input type="hidden" name="id1" id="id1" value="<%=ub.getUser_id()%>">
	          			<input type="submit" name="action"  id="edit" class="btn btn-lg btn-success editshippinhinfo" value="Edit">
               		</a>						      
                	</td>
                </tr> 				
            </table>
            </form>
        </div>    
    </div>    					
</div>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>
			
</body>
    <!-- =====================================SHIPPING INFO OVER====================================== -->