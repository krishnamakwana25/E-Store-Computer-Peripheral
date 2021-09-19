package bean;
public class RentOrderbean 
{
	String startdate,enddate;
	private int rentproid ,isActive,qty,total,duration,uid,deposite,rentorderid;
	private String rentproname,rentproprice,rentprophoto1,unm,mobile,add,mail;
	public int getRentOrderId()
	{
		return rentorderid;
	}
	public void setRentOrderId(int rentorderid)
	{
		this.rentorderid = rentorderid;
	}
	public int getUserid()
	{
		return uid;
	}
	public void setUserid(int id)
	{
		this.uid=id;
	}
	public String getUsername()
	{
		return unm;
	}
	public void setUsername(String unm)
	{
		this.unm=unm;
	}
	public String getMail()
	{
		return mail;
	}
	public void setMail(String mail)
	{
		this.mail=mail;
	}
	public String getMobnum()
	{
		return mobile;
	}
	public void setMobnum(String mobile)
	{
		this.mobile=mobile;
	}
	public String getAdd()
	{
		return add;
	}
	public void setAdd(String add)
	{
		this.add=add;
	}
	public int getDeposite()
	{
		return deposite;
	}
	public void setDeposite(int deposite)
	{
		this.deposite = deposite;
	}
	public int getQunatity()
	{
		return qty;
	}
	public void setQunatity(int qty)
	{
		this.qty = qty;
	}
	public int getTotalAmount()
	{
		return total;
	}
	public void setTotalAmount(int total)
	{
		this.total = total;
	}
	public int getDuration()
	{
		return duration;
	}
	public void setDuration(int duration)
	{
		this.duration = duration;
	}
	public String getRentProPhoto1()
	{
		return rentprophoto1;
	}
	public void setRentProPhoto1(String rentprophoto1)
	{
		this.rentprophoto1=rentprophoto1;
	}
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
	public String getRentOrderPrice()
	{
		return rentproprice;
	}
	public void setRentOrderPrice(String rentproprice)
	{
		this.rentproprice=rentproprice;
	}
	public int getIsactive()
	{
		return isActive;
	}
	public void setIsactive(int isactive)
	{
		this.isActive=isactive;
	}
}