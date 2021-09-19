package bean;
public class OrderCancelbean 
{
	private int uid,isActive,opid,quantity,proprice,orderid,proid,totalprice;
	private String reason,OUid,proname,prophoto1,orderdate;
	
	public int getOrderQty()
	{
		return quantity; 
	}
	public void setOrderQty(int quantity)
	{
		this.quantity=quantity;
	}
	public int getOrderPrice()
	{
		return proprice;
	}
	public void setOrderPrice(int proprice)
	{
		this.proprice=proprice;
	}
	public int getOrderTotal()
	{
		return totalprice;
	}
	public void setOrderTotal(int totalprice)
	{
		this.totalprice=totalprice;
	}
	public int getOrderid()
	{
		return orderid;
	}
	public void setOrderid(int orderid)
	{
		this.orderid=orderid;
	}
	public String getProductName()
	{
		return proname;
	}
	public void setProductName(String proname)
	{
		this.proname=proname;
	}
	public String getProductPhoto1()
	{
		return prophoto1;
	}
	public void setProductPhoto1(String prophoto1)
	{
		this.prophoto1=prophoto1;
	}
	public int getProductPrice()
	{
		return proprice;
	}
	public void setProductPrice(int proprice)
	{
		this.proprice=proprice;
	}
	public String getUserOrderid()
	{
		return OUid;
	}
	public void setUserOrderid(String OUid)
	{
		this.OUid=OUid;
	}
	public int getOPid()
	{
		return opid;
	}
	public void setOPid(int opid)
	{
		this.opid=opid;
	}
	public int getUserid()
	{
		return uid;
	}
	public void setUserid(int uid)
	{
		this.uid=uid;
	}	
	public int getIsactive()
	{
		return isActive;
	}
	public void setIsactive(int isactive)
	{
		this.isActive=isactive;
	}
	public String getReason()
	{
		return reason;
	}
	public void setReason(String reason)
	{
		this.reason=reason;
	}
	public int getProductid()
	{
		return proid;
	}
	public void setProductid(int proid)
	{
		this.proid=proid;
	}
	public String getOrderPlaceDate()
	{
		return orderdate;
	}
	public void setOrderPlaceDate(String orderdate)
	{
		this.orderdate=orderdate;
	}	
}
