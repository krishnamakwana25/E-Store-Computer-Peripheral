package bean;
public class RentOrderCancelbean 
{
	private String OURid,rentprophoto1,rentproname,reason,canceldate,startdate,enddate;
	private int orpid,uid,rentproid,isActive,qty,rentproprice,total,duration;
	
	public String getBookDate()
	{
		return startdate;
	}
	public void setBookDate(String startdate)
	{
		this.startdate = startdate;
	}
	public String getEndDate()
	{
		return enddate;
	}
	public void setEndDate(String enddate)
	{
		this.enddate = enddate;
	}
	public int getDuration()
	{
		return duration;
	}
	public void setDuration(int duration)
	{
		this.duration = duration;
	}
	public int getRentQty()
	{
		return qty;
	}
	public void setRentQty(int qty)
	{
		this.qty = qty;
	}
	public int getRentProductPrice()
	{
		return rentproprice;
	}
	public void setRentProductPrice(int rentproprice)
	{
		this.rentproprice=rentproprice;
	}
	public String getReason()
	{
		return reason;
	}
	public void setReason(String reason)
	{
		this.reason=reason;
	}
	public String getUserRentOrderid()
	{
		return OURid;
	}
	public void setUserRentOrderid(String OURid)
	{
		this.OURid=OURid;
	}
	public int getORPid()
	{
		return orpid;
	}
	public void setORPid(int orpid)
	{
		this.orpid=orpid;
	}
	public int getUserid()
	{
		return uid;
	}
	public void setUserid(int uid)
	{
		this.uid=uid;
	}	
	public String getRentProName()
	{
		return rentproname;
	}
	public void setRentProName(String rentproname)
	{
		this.rentproname=rentproname;
	}
	public int getRentProid()
	{
		return rentproid;
	}
	public void setRentProid(int rentproid)
	{
		this.rentproid=rentproid;
	}
	public String getRentProPhoto1()
	{
		return rentprophoto1;
	}
	public void setRentProPhoto1(String rentprophoto1)
	{
		this.rentprophoto1=rentprophoto1;
	}
	public String getCancelDate()
	{
		return canceldate;
	}
	public void setCancelDate(String canceldate)
	{
		this.canceldate=canceldate;
	}
	public int getIsactive()
	{
		return isActive;
	}
	public void setIsactive(int isactive)
	{
		this.isActive=isactive;
	}
	public int getRentTotal()
	{
		return total;
	}
	public void setRentTotal(int total)
	{
		this.total=total;
	}
}
