<%@page import="bean.Maincategorybean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Maincategorydao" %>
<%@page import="bean.Subcategorybean" %>
<%@page import="DAO.Subcategorydao" %>
<%@page import="bean.Userbean" %>
<%@page import="DAO.Userdao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
 <jsp:include page="script.jsp"></jsp:include>
 <% 
	if(session.isNew())
	{
		response.sendRedirect("user/user_login.jsp");
	}
	Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
%> 
 <style type="text/css" rel="stylesheet">
  	.dropdown-menu1
  	{
  		position: absolute;
	    top: 80px;
	    left: 160px;
	    z-index: 1000;	    
	    display: none;
	    float: left;
	    min-width: 5rem;      /* 10rem */
	    padding: .5rem 0;
	    margin: .125rem 0 0;
	    font-size: 1em;    /* //1rem */
	    color: #212529 !important;
	    text-align: left;
	    list-style: none;
	    background-color: #fff;
	    background-clip: padding-box;
	    border: 1px solid rgba(0,0,0,.15);
	    border-radius: .25rem;
  	}
    </style>
<div class="header">
	<div class="container">
		<div class="logo-nav">
			<div class="logo-nav-left" >
				<a href="index1_user.jsp"><img src="resources/images/logo1.jpg" alt=" " class="img-responsive " height="80px" width="80px"/></a>			
			</div>
			<div class="logo-nav-left1">
				<nav class="navbar navbar-expand-lg justify-content-center">
 					<div class="navbar-header nav_2">
					<button class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" id="mg1" style="background-color: black;">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					</div> 
		

				  <!-- Links -->	
				  <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
				  <ul class="navbar-nav">
				    <li class="nav-item">
				      <a class="nav-link" href="index1_user.jsp">Home</a>
				    </li>
				    <li class="nav-item dropdown">
				      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" >
				        Products
				      </a>
				      <div class="dropdown-menu myMainmenu">
				    	<%
				    	int mid1;
							Maincategorydao md= new Maincategorydao();
	       	              		List<Maincategorybean> list1 = md.getallMaincategory();
	           	          		for(Maincategorybean maincat: list1)
	               	      		{
	               		%>		
             					<a class="dropdown-item nav-link dropdown-toggle navbardrop1" href="#" name="maincat1" style="color: #212529;padding-left: 24px;" value="<%=maincat.getMaincatid()%>">
       								<%=maincat.getMaincatname()%>
       				 			</a>					
						<div class="dropdown-menu dropdown-menu1 dp1">											 
								<h4 class="dropdown-header text-info" value="<%=maincat.getMaincatid()%>"><%=maincat.getMaincatname()%></h4>
								<div class="dropdown-divider"></div>
						<%
								int mid=maincat.getMaincatid();
								Subcategorydao sd= new Subcategorydao();
          	              		List<Subcategorybean> list2 = sd.getSubCatByMainCatId(maincat.getMaincatid());
              	          		for(Subcategorybean subcat: list2)
                  	      		{
                       	%>
	                       			<form action="<%=application.getContextPath()%>/ProductController" method="post">
	                       			<button type="submit" name="action" value="subcat" style="background-color: white;border:none;">
							 	       <a class="dropdown-item" value="<%=subcat.getSubcatid()%>" >
							 	       <input type="hidden" name="subcatid" value="<%=subcat.getSubcatid()%>">
							            <%=subcat.getSubcatname() %></a>
						            </button>
						            </form>
							<%
	       	                  	}
	           	          	%>									     
					      </div>				
						<%
	   	                  		}
	       	          	%>	
				      </div>
				     <li class="nav-item" ><a class="nav-link" href="PCOnRentByUserID.jsp">Rent</a></li>
					<li class="nav-item" ><a class="nav-link" href="about_usByUser.jsp">About Us</a></li>
					<li class="nav-item"><a class="nav-link" href="contact_usByUser.jsp">Contact Us</a></li>
					<li class="nav-item"><a class="nav-link" href="CustomizeProductById.jsp">Customize PC</a></li>						
					 <li class="nav-item dropdown">
					 <a class="nav-link dropdown-toggle font-weight-bold" href="#" style="color: #ff8c00;" id="navbardrop2">    <!-- id="navbardrop" -->
				       <%=ub.getUsername() %>
				      </a>				      
						<div class="dropdown-menu dp2" style="disply:none;">																	
					        <a class="dropdown-item" href="profile.jsp">My Profile</a>
					        <a class="dropdown-item" href="myOrders.jsp">Orders</a>
					        <a class="dropdown-item" href="myRentOrders.jsp">Rent Orders</a>
					        <a class="dropdown-item" href="customMyOrders.jsp">Customize Orders</a>			
					      <form action="<%=application.getContextPath()%>/WishlistController" method="post">
								<button type="hidden" type="submit" name="action" value="wishlist1" style=" margin:0px;padding:0px;border:none; background:white;">
									   <a class="dropdown-item"><span>Wish list</span></a>
								 </button>
							</form>	
					        <a class="dropdown-item" href="LogoutUser.jsp">Logout</a>			        					      
					     </div>
					    </li>									   
				 </ul>				 
				</div>
				  <img src="../uploadimg/<%=ub.getPhoto() %>" alt=" " style="margin-top:20px;" class="img-circle img-bordered nav-link" height="50" width="70"/>
				</nav>			
			</div>
			<div class="logo-nav-right" style="margin-top:20px;">
				<div class="search-box">
					<div id="sb-search" class="sb-search">
						<form method="post" action="<%=application.getContextPath()%>/Usercontroller">
							<input class="sb-search-input" name="productname1" placeholder="Enter your search term..." type="search" id="search">
							<input class="sb-search-submit" name="action" type="submit" value="searchUserItem">
							<span class="sb-icon-search"></span>
						</form>
					</div>
				</div>
					<!-- search-scripts -->
					<script src="resources/js/classie.js"></script>
					<script src="resources/js/uisearch.js"></script>
						<script>
							new UISearch( document.getElementById( 'sb-search' ) );
						</script>
					<!-- //search-scripts -->
			</div>
	 	<form method="post" action="<%=application.getContextPath()%>/Cartcontroller"> 
			<div class="header-right">							
				<div class="cart box_1">									
				 	<button type="hidden" type="submit" name="action" value="Cart" style="border:none; background:white;"> 
						<a href="#" >					
						<img href=""  src="resources/images/bag.png" alt="">
						</a>	
					<div class="clearfix"> </div>
					 </button>					
				</div>
			</div>
		</form> 			
			<div class="clearfix"> </div>
		</div>
	</div>
</div>
<script type="text/javascript">
jQuery(document).ready(function($) 
{	
	$('#mg1').click(function()
	{
		$('#bs-megadropdown-tabs').slideToggle();
	});	
	 $('#navbardrop').click(function()
	{
		$('.myMainmenu').fadeToggle();
		$('.dp1').hide();
		$('.dp2').hide();		
		/* $('.dp3').hide(); */
	});	 
 	$('#navbardrop2').click(function()
	{
 		$('.myMainmenu').hide();
		$('.dropdown-menu1').hide();
		$('.dp1').hide();
		$('.dp2').fadeToggle();		
	});    
	$(document).on('click', '.navbardrop1', function(event) 
	{
			var next=$(this).next().slideToggle('slow');
			$('.dp1').not(next).hide('slow');
			$('.dp2').hide();	
	});	 
/* 	$(document).on('click', '#navbardrop2', function(event) 
	{
		 $('.dropdown-menu').hide();
			$('.dp1').hide();
			$('.dp2').fadeToggle('slow');
	}); */
});
</script>