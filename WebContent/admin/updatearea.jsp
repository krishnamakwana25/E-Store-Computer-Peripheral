<%@page import ="bean.Areabean" %>
<%@page import ="DAO.Areadao" %>
<%@page import="bean.Statebean" %>
<%@page import="DAO.Statedao" %>    
<%@ page import="DAO.Citydao" %>
<%@ page import="bean.Citybean" %> 
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Update Area</title>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<%
	Areabean ab= Areadao.getAreaById(Integer.parseInt(request.getParameter("id")));
%>
 <jsp:include page="head.jsp"></jsp:include>
</head>
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
            <h1 class="mt-4">Update Area</h1>
            <div class="row">
            	  <div class="col-sm-12">
                     <div class="panel panel-bd lobidrag">
                     <h1></h1>
                        <div class="panel-body">
                           <form class="col-lg-12" method="post" action="<%=application.getContextPath()%>/Areacontroller" data-parsley-validate="true">
                              <div class="form-group">
                              <label>Area Id : <a style="font-weight: bold;"><%=ab.getAid()%></a></label>
                              	<hr>
                                 <input type="text" hidden="" class="form-control" placeholder="Id" name="id" value="<%=ab.getAid()%>">
                                 <label>Area Name</label>
                                 <input type="text" class="form-control" placeholder="Area" name="updatearea" data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-maxlength="30" value="<%=ab.getAreaname()%>"><br>                             
                                 <label>City</label>
                                 <select class="form-control" required="required" id="updatecity" name="updatecity">       
										<%			
										Citydao cd = new Citydao();
										List<Citybean> list2 = cd.getallCity();
										for(Citybean city: list2)
										{
										%>
									     	 <option value="<%=city.getCid()%>" <% if(ab.getCid() == city.getCid()) out.println("selected"); %>>
									     	 <%=city.getCityname() %></option>	
										<%
										}
										%>
								 </select><br>
                         	     <label>State</label>
                         	     <select class="form-control" required="required" id="updatestate" name="updatestate">    
										<%
										Statedao sd= new Statedao();
										List<Statebean> list3 = sd.getallState();
										for(Statebean state: list3)
										{
										%>
									     	 <option value="<%=state.getSid()%>"  <% if(ab.getSid() == state.getSid()) out.println("selected"); %>> 
									     	 <%=state.getStatename() %></option>	
										<%
										}
										%>
								</select>  
							<!-- data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-maxlength="30" -->
                              </div>
                              <div class="reset-button">
                              <input type="submit" class="btn btn-lg btn-info" name="action" value="Update">
                               </div>
                           </form>
                        </div>
                     </div>
                  </div>      
             </div><!-- row -->              
        </section>
      </section>
      <!--main content end-->
  </section>  
	 <jsp:include page="script.jsp"></jsp:include>  
     </body>
</html>