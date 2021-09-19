<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Productbean" %>
<%@page import="bean.Userbean" %>
<%@page import="DAO.Userdao" %>
<%@page import="java.util.List" %>
<%@page import="DAO.Productdao" %>
<%@page import="bean.Orderbean" %>
<%@page import="DAO.Orderdao" %>
<%@page import="bean.OrderProductbean" %>
<%@page import="DAO.OrderProductdao" %>
<%@page import="bean.OrderCancelbean" %>
<%@page import="DAO.OrderCanceldao" %>
<%@page import="DAO.RateToProductdao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

<link rel="icon" type="image/jpg" href="resources/images/logo1.jpg">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Rating</title>
<jsp:include page="script.jsp"></jsp:include>
<jsp:include page="header1_user.jsp"></jsp:include>
<%
	Productbean pb= Productdao.getProductById(Integer.parseInt(request.getParameter("id")));
	int opid = (Integer) session.getAttribute("opid");
	String ouid = (String)session.getAttribute("ouid");
	Userbean ub = Userdao.getUserById((Integer) session.getAttribute("id"));
%>
</head>
<body onload="preloader1()">
<div id="loading"></div>

<div class="container">
	<form method="post" action="<%=application.getContextPath()%>/RateToProductController" accept-charset="utf-8">
				<div class="modal-body">
						<div class="form-group">
							<div class='rating-stars text-center'>
								<h5>Rate the product</h5>
								<ul id='stars' >
									<li class='star' title='Poor' data-value='1' name="s" >
										<i class='fa fa-star fa-fw'></i>
									</li>
									<li class='star' title='Fair' data-value='2' name="s">
										<i class='fa fa-star fa-fw'></i>
									</li>
									<li class='star' title='Good' data-value='3' name="s">
										<i class='fa fa-star fa-fw'></i>
									</li>
									<li class='star' title='Excellent' data-value='4' name="s">
										<i class='fa fa-star fa-fw'></i>
									</li>
									<li class='star' title='WOW!!!' data-value='5' name="s">
										<i class='fa fa-star fa-fw'></i>
									</li>
								</ul>
							</div>
						</div>
						<div class="form-group">
							<div class='success-box'>
								<div class='clearfix'></div>
								<img alt='tick image' width='32' src='data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeD0iMHB4IiB5PSIwcHgiIHZpZXdCb3g9IjAgMCA0MjYuNjY3IDQyNi42NjciIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDQyNi42NjcgNDI2LjY2NzsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSI1MTJweCIgaGVpZ2h0PSI1MTJweCI+CjxwYXRoIHN0eWxlPSJmaWxsOiM2QUMyNTk7IiBkPSJNMjEzLjMzMywwQzk1LjUxOCwwLDAsOTUuNTE0LDAsMjEzLjMzM3M5NS41MTgsMjEzLjMzMywyMTMuMzMzLDIxMy4zMzMgIGMxMTcuODI4LDAsMjEzLjMzMy05NS41MTQsMjEzLjMzMy0yMTMuMzMzUzMzMS4xNTcsMCwyMTMuMzMzLDB6IE0xNzQuMTk5LDMyMi45MThsLTkzLjkzNS05My45MzFsMzEuMzA5LTMxLjMwOWw2Mi42MjYsNjIuNjIyICBsMTQwLjg5NC0xNDAuODk4bDMxLjMwOSwzMS4zMDlMMTc0LjE5OSwzMjIuOTE4eiIvPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K'/>
								<div class='text-message'></div>
								<div class='clearfix'></div>
							</div>
						</div>																
				</div>
				<input type="hidden" name="rateus" id="rateus" class="rateus">
				<%                                                	
					List<OrderProductbean>list3=OrderProductdao.getallOPByUserId(ub.getUserid());							
					for(OrderProductbean o3: list3)								    	          			
					{								  										  											  				
				%> 
							<input type="hidden" name="userid" value="<%=o3.getUserid()%>">
							<input type="hidden" name="opid1" value="<%=opid%>">	
							<input type="hidden" name="pid1" value="<%= pb.getProductid() %>"> 	
							<input type="hidden" name="ouid1" value="<%= ouid%>">																					
				 <%								  			
					}
				%> 	 							
				<div class="modal-footer">
					<input type="submit" name="action" class="btn btn-danger" value="Submit">
				</div>
				</form>
</div>
<jsp:include page="footer_user.jsp"></jsp:include>
</body>
<script type="text/javascript">
$(document).ready(function()
{	  
  /* 1. Visualizing things on Hover - See next part for action on click */
  $('#stars li').on('mouseover', function(){
    var onStar = parseInt($(this).data('value'), 10); // The star currently mouse on
   
    // Now highlight all the stars that's not after the current hovered star
    $(this).parent().children('li.star').each(function(e){
      if (e < onStar) {
        $(this).addClass('hover');
      }
      else {
        $(this).removeClass('hover');
      }
    });
    
  }).on('mouseout', function(){
    $(this).parent().children('li.star').each(function(e){
      $(this).removeClass('hover');
    });
  });
  
  
  /* 2. Action to perform on click */
  $('#stars li').on('click', function(){
    var onStar = parseInt($(this).data('value'), 10); // The star currently selected
    var stars = $(this).parent().children('li.star');
    
    for (i = 0; i < stars.length; i++) {
      $(stars[i]).removeClass('selected');
    }
    
    for (i = 0; i < onStar; i++) {
      $(stars[i]).addClass('selected');
    }
    
    // JUST RESPONSE (Not needed)
    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
    $('#rateus').val(ratingValue);
    var msg = "";
    if (ratingValue > 1) {
        msg = "Thanks! You rated this " + ratingValue + " stars.";
    }
    else {
        msg = "We will improve ourselves. You rated this " + ratingValue + " stars.";
    }
    responseMessage(msg);    
});
  
});

function responseMessage(msg) {
  $('.success-box').fadeIn(200);  
  $('.success-box div.text-message').html("<span>" + msg + "</span>");
}
</script>
<script>
		var preloader = document.getElementById("loading");
		function preloader1(){
			preloader.style.display = 'none';
		};
</script>

</html>