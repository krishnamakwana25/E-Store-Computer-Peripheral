package bean;
public class ORPbean
{
	private int rentorderid,uid,rentproid ,isActive,quantity,price,totalprice,orpid,duration,proqty;
	private String paymenttype,OURid,startdate,enddate,rentproname,rentprophoto1,unm,mail,address;
	public String getUsername()
	{
		return unm;
	}
	public void setUsername(String unm)
	{
		this.unm=unm;
	}
	public int getProductQty1()
	{
		return proqty;
	}
	public void setProductQty1(int proqty)
	{
		this.proqty=proqty;
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
	public void setUserid(int uid)
	{
		this.uid=uid;
	}
	public int getRentProid()
	{
		return rentproid;
	}
	public void setRentProid(int rentproid)
	{
		this.rentproid=rentproid;
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
	public int getQuantity()
	{
		return quantity; 
	}
	public void setQuantity(int quantity)
	{
		this.quantity=quantity;
	}
	public int getPrice()
	{
		return price;
	}
	public void setPrice(int price)
	{
		this.price=price;
	}
	public int getOrderTotal()
	{
		return totalprice;
	}
	public void setOrderTotal(int totalprice)
	{
		this.totalprice=totalprice;
	}
	public String getPaymnetType()
	{
		return paymenttype;
	}
	public void setPaymnetType(String paymenttype)
	{
		this.paymenttype=paymenttype;
	}
	public int getDuration()
	{
		return duration;
	}
	public void setDuration(int duration)
	{
		this.duration = duration;
	}
	public int getIsactive()
	{
		return isActive;
	}
	public void setIsactive(int isactive)
	{
		this.isActive=isactive;
	}
	public String getRentProName()
	{
		return rentproname;
	}
	public void setRentProName(String rentproname)
	{
		this.rentproname=rentproname;
	}
	public String getRentProPhoto1()
	{
		return rentprophoto1;
	}
	public void setRentProPhoto1(String rentprophoto1)
	{
		this.rentprophoto1=rentprophoto1;
	}
	public String getMail()
	{
		return mail;
	}
	public void setMail(String m)
	{
		this.mail=m;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}