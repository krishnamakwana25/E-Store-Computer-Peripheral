package bean;

public class Orderbean {
	private int orderid,uid,proid ,isActive,quantity,proprice,totalprice,cartid,subtotalprice;
	private String proname,prophoto1, prospecification,mobile,unm,add,mail,book_date;
	
	private int proqty;
	
	public int getProductQty1()
	{	
		return proqty;
	}
	public void setProductQty1(int proqty)
	{
		this.proqty=proqty;
	}
	public String getBookdate()
	{
		return book_date;
	}
	public void setBookdate(String book_date)
	{
		this.book_date=book_date;
	}
	public int getOrderid()
	{
		return orderid;
	}
	public void setOrderid(int orderid)
	{
		this.orderid=orderid;
	}
	public int getCartid()
	{
		return cartid;
	}
	public void setCartid(int cartid)
	{
		this.cartid=cartid;
	}
	public int getUserid()
	{
		return uid;
	}
	public void setUserid(int uid)
	{
		this.uid=uid;
	}
	public String getUsername()
	{
		return unm;
	}
	public void setUsername(String unm)
	{
		this.unm=unm;
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
	public int getProductTotalPrice()
	{
		return totalprice;
	}
	public void setProductTotalPrice(int totalprice)
	{
		this.totalprice=totalprice;
	}
	public int getProductSubTotalPrice()
	{
		return subtotalprice;
	}
	public void setProductSubTotalPrice(int subtotalprice)
	{
		this.subtotalprice=subtotalprice;
	}
	public String getProductSpecification1()
	{
		return prospecification;
	}
	public void setProductSpecification1(String prospecification)
	{
		this.prospecification=prospecification;
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