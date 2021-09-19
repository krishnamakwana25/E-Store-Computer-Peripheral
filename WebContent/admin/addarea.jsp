<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Statebean" %>
<%@page import="DAO.Statedao" %>    
<%@ page import=" java.util.List"%>
<%@ page import="DAO.Citydao" %>
<%@ page import="bean.Citybean" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Add Area</title>
<link rel="Icon" type="image/jpg" href="resources/img/logo1.jpg">
<%
	Adminbean ub = Admindao.getAdminById((Integer) session.getAttribute("aid"));
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
            <h1 class="mt-4">Add Area </h1>
            <div class="row">        
                <!-- Form controls -->
                  <div class="col-sm-12">
                     <div class="panel panel-bd lobidrag">
                        <div class="panel-body">
                           <form class="col-lg-12" method="post" action="<%=application.getContextPath()%>/Areacontroller" data-parsley-validate="true">
                      	  		<div class="form-group">
                            	<label>State Name </label>
                        	  	<select class="form-control" required="required" id="selectstate" name="selectstate" >      
                        	  	<option value=" ">Please Select</option>    
                            	<%
        	                  		Statedao sd= new Statedao();
            	              		List<Statebean> list = sd.getallState();
                	          		for(Statebean state: list)
                    	      		{
                        	  	%>
                        	  	     	 <option value="<%=state.getSid()%>" ><%=state.getStatename() %></option>	
                            	<%
        	                  		}
            	          		%>
            	          		</select>
            	          		</div>
 									<div class="form-group">
                            	<label>City Name </label>
                        	  	<select class="form-control" required="required" id="selectcity" name="selectcity">       
                        	  	<option value=" ">Please Select</option> 
                            	<%
                            		Citydao cd= new Citydao();
            	              		List<Citybean> list1 = cd.getallCity();
                	          		for(Citybean city: list1)
                    	      		{
                        	  	%>
                        	  	     	 <option value="<%=city.getCid()%>" ><%=city.getCityname() %></option>	
                            	<%
        	                  		}
            	          		%>
            	          		</select>
            	          		</div>
            	                   	          	
                              <div class="form-group">
                                 <label>Area Name</label>
                                 <input type="text" name="area" id="area"class="form-control" placeholder="Enter Area Name" required autofocus data-parsley-trigger="keyup" data-parsley-minlength="3" data-parsley-maxlength="30" >
                              </div>
                              <div class="reset-button">
                              <input type="submit"  class="btn btn-lg btn-primary" name="action" value="Insert">
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