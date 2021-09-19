package bean;

public class Cartbean
{
	private int uid,proid ,isActive,quantity,proprice,quantity1;
	private String proname, prospecification, mail,prophoto1,prophoto2,prophoto3,prophoto4,mobile,add,unm;
	private int cartid,totalprice,subtotalprice;
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
	public String getMail()
	{
		return mail;
	}
	public void setMail(String mail)
	{
		this.mail=mail;
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
	public String getProductPhoto2()
	{
		return prophoto2;
	}
	public void setProductPhoto2(String prophoto2)
	{
		this.prophoto2=prophoto2;
	}
	public String getProductPhoto3()
	{
		return prophoto3;
	}
	public void setProductPhoto3(String prophoto3)
	{
		this.prophoto3=prophoto3;
	}
	public String getProductPhoto4()
	{
		return prophoto4;
	}
	public void setProductPhoto4(String prophoto4)
	{
		this.prophoto4=prophoto4;
	}
	public int getProductPrice()
	{
		return proprice;
	}
	public void setProductPrice(int proprice)
	{
		this.proprice=proprice;
	}
	public int getProductQty1()
	{
		return quantity1; 
	}
	public void setProductQty1(int quantity1)
	{
		this.quantity1=quantity1;
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