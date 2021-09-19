<%@page import="DAO.Userdao"%>
<%@page import="bean.Userbean"%>
<%@page import="bean.Statebean" %>
<%@page import="DAO.Statedao" %>    
<%@ page import="DAO.Citydao" %> 	
<%@ page import="bean.Citybean" %>
<%@page import="bean.Areabean" %>
<%@page import="DAO.Areadao" %>  
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<%
	Userbean ub= Userdao.getUserById(Integer.parseInt(request.getParameter("id")));
%>
 <jsp:include page="head.jsp"></jsp:include>
<body onload="PreLoader()">
 <div id="loading"></div>
  <section id="container" >
      <!--header start-->
     <jsp:include page="header.jsp"></jsp:include>
      <!--header end-->
      <!--sidebar start-->       
       <jsp:include page="sidebar.jsp"></jsp:include>
       <!--sidebar end-->
      <!--main content start-->
      <section id="main-content"> 
          <section class="wrapper">
            <h1 class="mt-4">Update User</h1>
            <div class="row">
            	  <div class="col-lg-12">
                     <div class="panel panel-bd lobidrag">
                         <div class="panel-body">
                           <form class="col-lg-12" method="post" action="<%=application.getContextPath()%>/Usercontroller" data-parsley-validate="true">
                              <div class="form-group">
                                 <input type="text" class="form-control" placeholder="Id" name="userid" value="<%=ub.getUserid()%>"><br>
                                 <input type="text" class="form-control" placeholder="User Name" name="updateuser" data-parsley-length="[3,20]" value="<%=ub.getUsername()%>"><br>
                                 <input type="password" class="form-control" placeholder="Password" name="updatepassword" data-parsley-type="alphanum" data-parsley-minlength="6" data-parsley-error-message="Passwords must be at least 6 characters. " value="<%=ub.getPassword()%>"><br>
                                 <input type="password" class="form-control" placeholder="Password" name="updatecomfirmpassword" data-parsley-type="alphanum" data-parsley-minlength="6" data-parsley-error-message="Passwords must be at least 6 characters. " value="<%=ub.getConfirmPassword()%>"><br>
                                 <input type="text" class="form-control" placeholder="Mail" name="updatemail" data-parsley-type="email" value="<%=ub.getMail()%>"><br>
                                 <input type="text" class="form-control" placeholder="Mobile No." name="updatemobile" data-parsley-type="digits" value="<%=ub.getMobnum()%>"><br>
                                 <input type="text" class="form-control" placeholder="Address" name="updateaddress" required data-parsley-minlength="3" data-parsley-maxlength="50" value="<%=ub.getAdd()%>"><br>                                 
                              
                                 <select class="form-control" id="updatearea" name="updatearea" required="required">       
                   	  			
			                       	<%
			                       		Areadao ad= new Areadao();
			       	              		List<Areabean> list1 = ad.getallArea();
			           	          		for(Areabean area: list1)
			               	      		{
			                   	  	%>
			                   	  	     	 <option value="<%=area.getAid()%>" <% if(ub.getAid() == area.getAid()) out.println("selected"); %>>
			                   	  	     	 <%=area.getAreaname()%></option>	
			                       	<%
			   	                  		}
			       	          		%>             	       
		           	      	      </select><br>                        
		           	      	      <select class="form-control" required="required" id="updatecity" name="updatecity">       
								 
										<%
										Citydao cd= new Citydao();
										List<Citybean> list2 = cd.getallCity();
										for(Citybean city: list2)
										{
										%>
									     	 <option value="<%=city.getCid()%>" <% if(ub.getCid() == city.getCid()) out.println("selected"); %>>
									     	 <%=city.getCityname() %></option>	
										<%
										}
										%>
								 </select><br>
                         	     <select class="form-control" required="required" id="updatestate" name="updatestate">    
								    
										<%
										Statedao sd= new Statedao();
										List<Statebean> list3 = sd.getallState();
										for(Statebean state: list3)
										{
										%>
									     	 <option value="<%=state.getStatename()%>"  <% if(ub.getSid() == state.getSid()) out.println("selected"); %>>
									     	 <%=state.getStatename() %></option>	
										<%
										}
										%>
								</select><br>  
                         	     <input type="file" class="form-control" placeholder="Photo" name="updatephoto" data-parsley-min-file-size="50" data-parsley-max-file-size="250" value="<%=ub.getPhoto()%>"><br>
                              </div>
                              <div class="reset-button">
                              	 <input type="submit"  class="btn btn-lg btn-success" name="action" value="Update" id="update"><br>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>      
             </div><!-- row -->
        </section>
      </section>
      <!--main content end-->
      <!--footer start-->
      
<script type="text/javascript">
    $(function () {
        $("#update").click(function () {
            var upassword1 = $("#updatepassword").val();
            var uconfirmPassword1 = $("#updatecomfirmpassword").val();
            if(upassword1==" " && uconfirmPassword1==" ")
            {
                document.getElementById('error_pwd_msg').innerHTML="*Enter Confirm Password Same as Password";
                return false;
           	}
            if (upassword1 != uconfirmPassword1) {
                document.getElementById('error_pwd_msg').innerHTML="*Enter Confirm Password Same as Password";
                return false;
            }
            else
           	{
           	document.getElementById('error_pwd_msg').innerHTML="*Macthed";
               return true;
           	}
        });
    });
</script>
  </section>
	 <jsp:include page="script.jsp"></jsp:include>
     </body>
</html>
