package bean;
public class OrderProductbean
{
	private int orderid,uid,proid ,isActive,quantity,proprice,totalprice,opid,proqty;
	private String mail,paymenttype,OUid,orderdate,prophoto1,proname,rating,unm,address;
	
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
	public void setProductQty1(int q)
	{
		this.proqty=q;
	}
	public String getRating()
	{
		return rating;
	}
	public void setRating(String rating)
	{
		this.rating = rating ;
	}
	public int getProductQty()
	{
		return quantity; 
	}
	public void setProductQty(int quantity)
	{
		this.quantity=quantity;
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
	public int getOrderid()
	{
		return orderid;
	}
	public void setOrderid(int orderid)
	{
		this.orderid=orderid;
	}	
	public int getUserid()
	{
		return uid;
	}
	public void setUserid(int uid)
	{
		this.uid=uid;
	}
	public String getMail()
	{
		return mail;
	}
	public void setMail(String mail)
	{
		this.mail=mail;
	}
	public int getProductid()
	{
		return proid;
	}
	public void setProductid(int proid)
	{
		this.proid=proid;
	}
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
	public String getPaymnetType()
	{
		return paymenttype;
	}
	public void setPaymnetType(String paymenttype)
	{
		this.paymenttype=paymenttype;
	}
	public String getOrderPlaceDate()
	{
		return orderdate;
	}
	public void setOrderPlaceDate(String orderdate)
	{
		this.orderdate=orderdate;
	}	
	public int getIsactive()
	{
		return isActive;
	}
	public void setIsactive(int isactive)
	{
		this.isActive=isactive;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}