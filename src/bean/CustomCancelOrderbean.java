package bean;
public class CustomCancelOrderbean 
{
	private int uid,proid ,isActive,quantity,proprice,opid,totalprice,proqty,ccoid,orderid;
	private String reason,OUid,prophoto1,proname,orderdate,pcnm;
	public String getPCName() 
	{
		return pcnm;
	}
	public void setPCName(String p) 
	{
		this.pcnm = p;
	}
	public int getCustomOrderTotal()
	{
		return totalprice;
	}
	public void setCustomtOrderTotal(int t)
	{
		this.totalprice=t;
	}
	public String getCustomOrderPlaceDate()
	{
		return orderdate;
	}
	public void setCustomOrderPlaceDate(String orderdate)
	{
		this.orderdate=orderdate;
	}	
	public int getCustomOrderid()
	{
		return orderid;
	}
	public void setCustomOrderid(int orderid)
	{
		this.orderid=orderid;
	}	
	public int getCustomCancelOrderid()
	{
		return ccoid;
	}
	public void setCustomCancelOrderid(int c)
	{
		this.ccoid=c;
	}
	public int getCustomOPid()
	{
		return opid;
	}
	public void setCustomOPid(int opid)
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
	public int getCustomProductid()
	{
		return proid;
	}
	public void setCustomProductid(int proid)
	{
		this.proid=proid;
	}
	public String getCustomUserOrderid()
	{
		return OUid;
	}
	public void setCustomUserOrderid(String OUid)
	{
		this.OUid=OUid;
	}
	public String getReason()
	{
		return reason;
	}
	public void setReason(String reason)
	{
		this.reason=reason;
	}
	public int getIsactive()
	{
		return isActive;
	}
	public void setIsactive(int isactive)
	{
		this.isActive=isactive;
	}
	public int getCustomProductQty1()
	{
		return proqty;
	}
	public void setCustomProductQty1(int q)
	{
		this.proqty=q;
	}
	public int getCustomProductQty()
	{
		return quantity; 
	}
	public void setCustomProductQty(int quantity)
	{
		this.quantity=quantity;
	}
	public String getCustomProductName()
	{
		return proname;
	}
	public void setCustomProductName(String proname)
	{
		this.proname=proname;
	}
	public String getCustomProductPhoto1()
	{
		return prophoto1;
	}
	public void setCustomProductPhoto1(String prophoto1)
	{
		this.prophoto1=prophoto1;
	}
	public int getCustomProductPrice()
	{
		return proprice;
	}
	public void setCustomProductPrice(int proprice)
	{
		this.proprice=proprice;
	}
}
