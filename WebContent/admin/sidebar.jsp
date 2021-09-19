<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Adminbean" %>
<%@page import="DAO.Admindao" %>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<%
	Adminbean ub = Admindao.getAdminById((Integer) session.getAttribute("aid"));
%>
  <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered"><a href="index.jsp"><img src="../uploadimg/<%=ub.getPhoto() %>" class="img-circle" width="60" height="60"></a></p>
              	  <h5 class="centered"><%=ub.getFirstName() %> <%=ub.getLastName() %></h5>
              	  	
                  <li class="mt">
                      <a href="index.jsp">
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>             
                  <li>
                      <a href="profile.jsp" >
                          <i class="fa  fa-smile-o" aria-hidden="true"></i>
                          <span>View Profile</span>
                      </a>
                  </li>
                  <li class="sub-menu">
                      <a href="#" >
                          <i class="fa fa-sitemap" aria-hidden="true"></i>
                          <span> Main Category</span></a>
                          	<ul class="sub">
                          		<li><a  href="viewmaincategory.jsp">View Category</a></li>
                          		<li><a  href="addmaincategory.jsp">Add Category</a></li>
                      	  	</ul>
                         </li>
				<li class="sub-menu">
					<a href="#" >
					<i class="fa fa-sitemap" aria-hidden="true"></i>
                    <span> Sub Category</span></a>
						<ul class="sub">
							<li><a  href="viewsubcategory.jsp">View Category</a></li>
                          	<li><a  href="addsubcategory.jsp">Add Category</a></li>
						</ul>
				</li>  
                   <li class="sub-menu">
                      <a href="#" >
                          <i class="fa fa-laptop" aria-hidden="true"></i>
                          <span>Manage Product</span>
                      </a>
                      <ul class="sub">
                           	<li><a  href="viewproduct.jsp">View Product</a></li>
                            <li><a  href="addproduct.jsp">Add Product</a></li>    
                      </ul>
                  </li>   
                  <li class="sub-menu">
                      <a href="#" >
                          <i class="fa fa-laptop" aria-hidden="true"></i>
                          <span>Manage rent</span>
                      </a>
                      <ul class="sub">
                      		<li><a  href="viewrentprod.jsp">View Product</a></li>
                           	<li><a  href="addRentProd.jsp">Add Product</a></li>    
                          
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="#" >
                          <i class="fa fa-sitemap" aria-hidden="true"></i>
                          <span> Custom Category</span></a>
                          	<ul class="sub">
                          		<li><a  href="viewcustomecategory.jsp">View Category</a></li>
                          		<li><a  href="addcustomecategory.jsp">Add Category</a></li>
                      	  	</ul>
				</li>
                  <li class="sub-menu">
                      <a href="#" >
                          <i class="fa fa-laptop" aria-hidden="true"></i>
                          <span>Manage Customize</span>
                      </a>
                      <ul class="sub">
                      		<li><a  href="viewCustProd.jsp">View Product</a></li>
                           <li><a  href="addCustProd.jsp">Add Product</a></li>    
                      </ul>
                  </li>            
                   <li class="sub-menu">
                      <a href="#" >
                          <i class="fa fa-book"></i>
                          <span>Manage Inventory</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="inventoryProd.jsp"><i class="fa fa-book"></i>Product Inventory</a></li>
                          <li><a  href="inventoryRent.jsp"><i class="fa fa-book"></i>Rent Inventory</a></li>
                          <!-- <li><a  href="inventoryCustomize.jsp"><i class="fa fa-book"></i>Custom Inventory</a></li> -->
                      </ul>
                  </li>                      
                 
                 
                 <li class="sub-menu">
                      <a href="#" >
                          <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                          <span>Manage Order</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="viewOrders.jsp">View Order</a></li>
                          <li><a  href="viewRentOrders.jsp">View Rent Order</a></li>
                          <li><a  href="viewCustomizeOrders.jsp">View Custom Order</a></li>
                      </ul>
                  </li>
                 
                 
				 <li>
                      <a href="viewuser.jsp" >
                          <i class="fa fa-users" aria-hidden="true"></i>
                          <span>Manage Users</span>
                      </a>
                  </li>      
                   <li>
                      <a href="viewdealers.jsp" >
                          <i class="fa fa-users" aria-hidden="true"></i>
                          <span>Manage Dealers</span>
                      </a>
                  </li>                                     
                  
				  <li class="sub-menu">
                      <a href="#" >
                         <i class="fa fa-map-marker" aria-hidden="true"></i>
                          <span>Manage Location</span>
                      </a>
	                      <ul class="sub">
	                           <li class="sub-menu">
	                     		 <a href="#" >
		                           <i class="fa fa-map-marker" aria-hidden="true"></i>
	    	                      <span>Manage State</span>
	        	    	          </a>
	            	          	<ul class="sub">
									<li><a  href="viewstate.jsp">View State</a></li>
									<li><a  href="addstate.jsp">Add State</a></li>
		                      </ul>
		    	              </li>
		        	          <li class="sub-menu">
	    	        	          <a href="#" >
	        	       	           <i class="fa fa-map-marker" aria-hidden="true"></i>
	                    	      <span>Manage City</span>
	            		          </a>
	                    	  <ul class="sub">
	                    	  		<li><a  href="viewcity.jsp">View City</a></li>
	                        	  	<li><a  href="addcity.jsp">Add City</a></li>                          
		                      </ul>
		                 	 </li>
	    	               	<li class="sub-menu">
	        	              <a href="#" >
	                           <i class="fa fa-map-marker" aria-hidden="true"></i>
	                          <span>Manage Area</span>
	            	          </a>
	                	      <ul class="sub">
	                    	      <li><a  href="viewarea.jsp">View Area</a></li>
	                    	      <li><a  href="addarea.jsp">Add Area</a></li>
		                      </ul>
                 		 	</li>          
                	  </ul>
                  </li>                  				         
                 	<li>
                      <a href="viewcontact-us.jsp" >
                          <i class="fa fa-phone-square" aria-hidden="true"></i>
                          <span>View Contact</span>
                      </a>
                  </li>                       
                  <li>
                      <a href="viewfeedback.jsp" >
                          <i class="fa fa-comments-o" aria-hidden="true"></i>
                          <span>View Feedback</span>
                      </a>
                  </li>                      	          
                  </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->