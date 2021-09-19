<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Userbean" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Userdao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FAQ's</title>
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

 .color1
 {
 	background-color: #dcdcdc !important;
 }
 <% 
	Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
%> 
</style>
</head>
<body onload="preloader1()">
<div id="loading"></div>

<jsp:include page="script.jsp"></jsp:include>
<jsp:include page="header1_user.jsp"></jsp:include>
<div class="container mb-3">
	<div class="row">
		<div class="col-md-12">
		    <div id="accordion">
		    <!-- ADD QUE -1 HERE -->
			  <div class="card">
			    <div class="card-header color1 question">
			      <a class="card-link text-dark" data-toggle="collapse"><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>1) What will you be selling online?</h6>			        
			      </a>
			    </div>
			    <div class="collapse answer" data-parent="#accordion">
			      <div class="card-body">
			       Generally we sell electronics products. We are selling all products which are categorized into the laptop accessories. We sell new laptops, CCTV cameras, printers, mouse, and keyboards, customise PC especially for the gamer one. 
			      </div>
			    </div>
			  </div>
			<!-- OVER QUE-1 HERE AND ADD LIKE THIS IN THIS BELOW CONTINUED DIV.. -->
			
			  <div class="card">
			    <div class="card-header color1 question">
			      <a class="collapsed card-link text-dark" data-toggle="collapse"><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>2) How do you plan to market your website?</h6>
			      </a>
			    </div>
			    <div class="collapse answer" data-parent="#accordion">
			      <div class="card-body">
			        Right now we are just focused on getting my site live. Once our website is up, we will generate enough sales to focus on other things like marketing. A successful website needs a good marketing strategy, unfortunately far too many website owners choose to ignore this question until several months after the website launches and they have not seen any return on investment.
			      </div>
			    </div>
			  </div>
			  
			  <div class="card">
			    <div class="card-header color1 question">
			      <a class="collapsed card-link text-dark" data-toggle="collapse"><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>3) How do you plan on shipping?</h6>
			      </a>
			    </div>
			    <div class="collapse answer" data-parent="#accordion">
			      <div class="card-body">
			        Shipping plays an important role in successful online stores. For sellers shipping can really cut into the bottom. We have encountered several complex shipping requirements that are not supported by some ecommerce platforms by figuring out how to streamline your shipping methods you can save time and money for both you and your customers. Not only has that, but offering things like discounted or free shipping improved your rate of conversion significantly. For premium user we try 1-2 day super-fast Delivery for some locations. And for other 4-5 days delivery. 
			      </div>
			    </div>
			  </div>
			  
			  <div class="card">
			    <div class="card-header color1 question">
			      <a class="collapsed card-link text-dark" data-toggle="collapse"><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>4) Can I get 100% original product?</h6>
			      </a>
			    </div>
			    <div class="collapse answer" data-parent="#accordion">
			      <div class="card-body">
			         Yes, our motto is provide 100% original product to the user. If any Products have any defects then it is our guaranty to replace it. As you know we sell accessories which are related to technology so it is mandatory to provide original product 
			      </div>
			    </div>
			  </div>
			  
			  <div class="card">
			    <div class="card-header color1 question">
			      <a class="collapsed card-link text-dark" data-toggle="collapse"><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>5) How would you like to accept payment?</h6>
			      </a>
			    </div>
			    <div class="collapse answer" data-parent="#accordion">
			      <div class="card-body">
			        We  give  all  the  types of  the  option  to the user whether  it is  Cash On Delivery (COD),Debit or Credit card  and  EMI. We provide options to the users which option is preferable by them. So it is up to user how to pay payment. 
			      </div>
			    </div>
			  </div>
			  
			  <div class="card">
			    <div class="card-header color1 question">
			      <a class="collapsed card-link text-dark" data-toggle="collapse"><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>6) Can customer is able to leave system review?</h6>
			      </a>
			    </div>
			    <div class="collapse answer" data-parent="#accordion">
			      <div class="card-body">
			        Yes, it is good to leave review for the system. Because by the viewing review of the user we can get idea what improvement is needed and what user wants and we can easily get user's thoughts about the products.
			      </div>
			    </div>
			  </div>
			  
			  <div class="card">
			    <div class="card-header color1 question">
			      <a class="collapsed card-link text-dark" data-toggle="collapse"><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>7) Can this system safe for the online payment?</h6>
			      </a>
			    </div>
			    <div class="collapse answer" data-parent="#accordion">
			      <div class="card-body">
			        Yes, Absolutely. Because users satisfaction is our motto. By safe online payment user can trust on us and this becomes reference for the future.
			      </div>
			    </div>
			  </div>
			  
			  <div class="card">
			    <div class="card-header color1 question">
			      <a class="collapsed card-link text-dark" data-toggle="collapse"><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>8) Will our data will be secure if we log in?</h6>
			      </a>
			    </div>
			    <div class="collapse answer" data-parent="#accordion">
			      <div class="card-body">
			       Yes we provide the best security for data securing so don't need to worry only our admin can know it. Security of user's information is our important point. Also their information are important for any future reference. 
			      </div>
			    </div>
			  </div>
			   
			   <div class="card">
			    <div class="card-header color1 question">
			      <a class="collapsed card-link text-dark" data-toggle="collapse"><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>9) Have you handled complaint management? </h6>
			      </a>
			    </div>
			    <div class="collapse answer" data-parent="#accordion">
			      <div class="card-body">
			       Yes, We handled complaint management if user have any complaint related with their purchased product then they can complaint us.  And we also solved their complaint. 
			      </div>
			    </div>
			  </div>
			  
			  <div class="card">
			    <div class="card-header color1 question">
			      <a class="collapsed card-link text-dark" data-toggle="collapse"><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>10) What is return policy?</h6>
			      </a>
			    </div>
			    <div class="collapse answer" data-parent="#accordion">
			      <div class="card-body">
			       Yes, We handled complaint management if user have any complaint related with their purchased product then they can complaint us.  And we also solved their complaint. 
			      </div>
			    </div>
			  </div>
			   
			  <div class="card">
			    <div class="card-header color1 question">
			      <a class="collapsed card-link text-dark" data-toggle="collapse" ><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>11) Can I purchase item without registration?</h6>
			      </a>
			    </div>
			    <div class="collapse answer" data-parent="#accordion">
			      <div class="card-body">
			       Visitors can't purchase items without registration because it's compulsory to login/registered in system for purchasing product because we need to maintain our customer's record and without registration visitors cannot purchase anything. 
			      </div>
			    </div>
			  </div>
						
			 <div class="card">
			    <div class="card-header color1 question">
			      <a class="collapsed card-link text-dark" data-toggle="collapse" ><span class="float-right"><i class="fa fa-arrow-down"></i></span>
			        <h6>12) Which task visitor can do without the registration?</h6>
			      </a>
			    </div>
			    <div class="collapse  answer" data-parent="#accordion">
			      <div class="card-body">
			     Without the registration visitors can see any products any time, visitors can search any product randomly, even if any visitor has any query related to any product then they can inquiry it. Even any product chosen by the visitors they can add that product into the cart and also add it into wish list. Visitors get some functionality which are already gain by users, but the visitors cannot purchase anything because they are not our registered user so.  
			      </div>
			    </div>
			  </div>
			  
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
		jQuery(document).ready(function($) {

			$(document).on('click', '.question', function(event) {
				
				var next=$(this).next().slideToggle('slow');

				$('.answer').not(next).slideUp('slow');
			});
		});
</script>
<jsp:include page="footer_user.jsp"></jsp:include>
</body>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

</html>