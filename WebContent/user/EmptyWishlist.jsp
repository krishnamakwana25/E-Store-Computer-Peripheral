<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<title>Empty Wishlist</title>
<link href="resources/css/btn_effect.css" rel="stylesheet" type="text/css"  />
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
<body onload="preloader1()">
<div id="loading"></div>

<jsp:include page="header1_user.jsp"></jsp:include>
<link href="resources/css/btn_effect.css" rel="stylesheet" type="text/css"  />
<div class="container">
	<div  style=" text-align: center;">
		<img src=resources/images/empty_wishlist1.png>
		<!-- <p style="font-weight: bolder;font-family: Helvetica;font-size:40px;">Your Cart is Currently Empty</p>
		<p class="mt-25" style="color: silver;margin-bottom: 20px;font-size: 15px;">Before proceed to checkout you must add some products to your<br> shopping cart.You will find a lot of interesting products on our Home Page.</p>
	<input type="submit" value="Shop now" class="btn btn-lg btn-primary">
		<div class="svg">
			<a class="button" href="index1_user.jsp">
					<svg>
							<rect  />
					</svg>
					<span>Shop Now</span>
			</a>
		</div> -->
		<div class="wishlist1 animated mb-5"  style="margin-bottom:50px;height:40;width:130;fill:ttransparent;">
				<a href="index1_user.jsp">Shop Now</a>				
			</div>
	</div> 
</div>
<jsp:include page="footer_user.jsp"></jsp:include>
<jsp:include page="script.jsp"></jsp:include>
</body>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

</html>



<!-- AN IMPORTANT PATH FOR SETTING IMAGES -->
<!-- C:\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\Admin_Panel\uploadimg -->