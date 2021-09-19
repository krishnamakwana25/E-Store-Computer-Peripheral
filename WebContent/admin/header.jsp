<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="bean.Notificationbean" %>
<%@page import="DAO.Notificationdao" %>
<%@page import="java.util.List" %>
<style>
	.bell_cnt
	{
		font-size: 1vw !important;
		background-color: red;
		border-radius: 40%;
		height:10%;
		width:50%;
		text-align: center;
		position:relative;
		cursor:pointer
	}
	.bell_cnt:hover
	{
		color:white;
	}
	.bell_name
	{
		color:#FFC229 !important;
		font-size: 2vw !important;
	}
	.bell_name:hover
	{
		color:white;
	}
</style>
  <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index.jsp" class="logo"><b>E-Store</b></a>
            <!--logo end-->
            <div class="nav notify-row" id="top_menu">
                
            </div>
            <div class="top-menu">
            	<ul class="nav pull-right top-menu ">
            	    <li><a class="logout" href="LogoutAdmin.jsp">Logout</a></li>
            	</ul>
            </div>
            <div class="top-menu pull-right nav pt-3 mr-5" >
             <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
             <%
	     	   int cnt1 = 0 ;
				cnt1=Notificationdao.getallNotificationCnt();		
	        %>
			    <i class="fa fa-bell" style="font-size:larger !important;"></i> <span class="badge badge-light"><%= cnt1 %></span>
			  </button>          	
            </div> 
                   
</header>
<!-- MODAL -->
  <div class="modal" id="myModal" style=" margin-top:100px;">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Notifications</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <form method="post" action="<%=application.getContextPath()%>/Notificationcontroller">
        <!-- Modal body -->
        <div class="modal-body" style="overflow-y:scroll;height:350px;">
        <%
     	   int cnt = 0 ;
			cnt=Notificationdao.getallNotificationCnt();		
        %>
         <p class="font-weight-bold ml-3"><%=cnt %> New Notifications.</p>
       			  <%
       				if(cnt != 0 )
       				{
       					String not = "" , date = "";
	       				Notificationdao nd= new Notificationdao();
	       				not = nd.getallNotifyOrderDes();
	       				date = nd.getallNotifyOrderDate();	 
	              		int cnt2 = Notificationdao.getallNotifyOrder();	
	              		if(cnt2 != 0)
	              		{
	              %>
			         	<div style="box-shadow:0px 2px 8px grey; border-radius:10px;" class=" p-1 m-2">
			         		<p><i class="fa fa-hand-o-right" aria-hidden="true"></i> <%=not%> (<%=cnt2 %>)
			         			<p class="ml-1 text-info font-weight-bold"><%=date %></p> 
			         		</p>
			         	</div>
			     <%
	              		}
	              		
	              		not = nd.getallNotifyRentOrderDes();
	       				date = nd.getallNotifyRentOrderDate();	 
	              		int cnt3 = Notificationdao.getallNotifyRentOrder();	
	              		if(cnt3 != 0)
	              		{
	              %>
			         	<div style="box-shadow:0px 2px 8px grey; border-radius:10px;" class=" p-1 m-2">
			         		<p><i class="fa fa-hand-o-right" aria-hidden="true"></i> <%=not%> (<%=cnt3 %>)
			         			<p class="ml-1 text-info font-weight-bold"><%=date%></p> 
			         		</p>
			         	</div>
			     <%
	              		}
	              		
	              		not = nd.getallNotifyCustomOrderDes();
	       				date = nd.getallNotifyCustomOrderDate();	 
	              		int cnt4 = Notificationdao.getallNotifyCustomOrder();	
	              		if(cnt4 != 0)
	              		{
	              %>
			         	<div style="box-shadow:0px 2px 8px grey; border-radius:10px;" class=" p-1 m-2">
			         		<p><i class="fa fa-hand-o-right" aria-hidden="true"></i> <%=not%> (<%=cnt4 %>)
			         			<p class="ml-1 text-info font-weight-bold"><%=date%></p> 
			         		</p>
			         	</div>
			     <%
	              		}
	              			 
	              		int cnt5 = Notificationdao.getallNotifyCancelOrder();	
	              		if(cnt5 != 0)
	              		{
	              			List<Notificationbean> list1 = nd.getallNotifyOrderCancel();
	        				for(Notificationbean nd1: list1)
	        				{
	              %>
			         	<div style="box-shadow:0px 2px 8px grey; border-radius:10px;" class=" p-1 m-2">
			         		<p><i class="fa fa-hand-o-right" aria-hidden="true"></i> <%=nd1.getNot_description()%> (<%=cnt5 %>)
			         			<p class="ml-1 text-info font-weight-bold"><%=nd1.getNotDate()%></p> 
			         		</p>
			         	</div>
			     <%
	        				}
	              		}
	              		 
	              		int cnt6 = Notificationdao.getallNotifyRentOrderCancelCnt();	
	              		if(cnt6 != 0)
		              	{
	              			List<Notificationbean> list1 = nd.getallNotifyRentOrderCancel();
	        				for(Notificationbean nd1: list1)
	        				{
	              %>
			         	<div style="box-shadow:0px 2px 8px grey; border-radius:10px;" class=" p-1 m-2">
			         		<p><i class="fa fa-hand-o-right" aria-hidden="true"></i> <%=nd1.getNot_description()%> (<%=cnt6 %>)
			         			<p class="ml-1 text-info font-weight-bold"><%=nd1.getNotDate()%></p> 
			         		</p>
			         	</div>
			     <%
	        				}
	              		}
	              		
	              		int cnt7 = Notificationdao.getallNotifyCustomCancelCnt();	
	              		if(cnt7 != 0)	              			
	              		{
	              			
	        				List<Notificationbean> list1 = nd.getallNotifyCustomCancelOrder();
	        				for(Notificationbean nd1: list1)
	        				{
	              %>
			         	<div style="box-shadow:0px 2px 8px grey; border-radius:10px;" class=" p-1 m-2">
			         		<p><i class="fa fa-hand-o-right" aria-hidden="true"></i> <%=nd1.getNot_description()%> (<%=cnt7 %>)
			         			<p class="ml-1 text-info font-weight-bold"><%=nd1.getNotDate()%></p> 
			         		</p>
			         	</div>
			     <%
	        				}
	              		}
	              		
	              		int cnt8 = Notificationdao.getallNotifyUserCnt();	
	              		if(cnt8 != 0)
		              	{
	              			List<Notificationbean> list1 = nd.getallNotifyUser();
	        				for(Notificationbean nd1: list1)
	        				{
	              %>
			         	<div style="box-shadow:0px 2px 8px grey; border-radius:10px;" class=" p-1 m-2">
			         		<p><i class="fa fa-hand-o-right" aria-hidden="true"></i> <%=nd1.getNot_description()%> (<%=cnt8 %>)
			         			<p class="ml-1 text-info font-weight-bold"><%=nd1.getNotDate()%></p> 
			         		</p>
			         	</div>
			     <%
	        				}
	              		}
	              		
	              		int cnt9 = Notificationdao.getallNotifyDealerCnt();	
	              		if(cnt9 != 0)
		              	{
	              			List<Notificationbean> list1 = nd.getallNotifyDealer();
	        				for(Notificationbean nd1: list1)
	        				{
	              %>
			         	<div style="box-shadow:0px 2px 8px grey; border-radius:10px;" class=" p-1 m-2">
			         		<p><i class="fa fa-hand-o-right" aria-hidden="true"></i> <%=nd1.getNot_description()%> (<%=cnt9 %>)
			         			<p class="ml-1 text-info font-weight-bold"><%=nd1.getNotDate()%></p> 
			         		</p>
			         	</div>
			     <%
	        				}
	              		}
	              		
	              		int cnt10 = Notificationdao.getallNotifyStockCnt();	
	              		if(cnt10 != 0)
		              	{
	              			List<Notificationbean> list1 = nd.getallNotifyStock();
	        				for(Notificationbean nd1: list1)
	        				{
	              %>
			         	<div style="box-shadow:0px 2px 8px grey; border-radius:10px;" class=" p-1 m-2">
			         		<p><i class="fa fa-hand-o-right" aria-hidden="true"></i> <%=nd1.getNot_description()%> (<%=cnt10 %>)
			         			<p class="ml-1 text-info font-weight-bold"><%=nd1.getNotDate()%></p> 
			         		</p>
			         	</div>
			     <%
	        				}
	              		}
	              		
	              		int cnt11 = Notificationdao.getallNotifyRentStockCnt();	
	              		if(cnt11 != 0)
		              	{
	              			List<Notificationbean> list1 = nd.getallNotifyRentStock();
	        				for(Notificationbean nd1: list1)
	        				{
	              %>
			         	<div style="box-shadow:0px 2px 8px grey; border-radius:10px;" class=" p-1 m-2">
			         		<p><i class="fa fa-hand-o-right" aria-hidden="true"></i> <%=nd1.getNot_description()%> (<%=cnt11 %>)
			         			<p class="ml-1 text-info font-weight-bold"><%=nd1.getNotDate()%></p> 
			         		</p>
			         	</div>
			     <%
	        				}
	              		}
	              		
       				}
   	          		else
   	          		{   	          		
         		 %>
         			<div style="box-shadow:0px 2px 8px grey; border-radius:10px;" class=" p-1 m-2">
		         		<p>No New Notifications</p>
		         	</div>
       			 <%
   	          		}
         		 %>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <input type="submit" class="btn btn-primary" name="action" value="Clear All">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        </form>
      </div>
    </div>
  </div>
           <!-- MODAL OVER -->
 <!--header end-->