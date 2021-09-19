package bean;
public class Rentprodbean {
	
	String startdate,enddate;
	private int rentproid ,isActive,rentproqty,uid;
	private String rentproname,rentprospecification, rentprodescription,rentprophoto1,rentprophoto2,rentproprice;
	public int getUserid()
	{
		return uid;
	}
	public void setUserid(int id)
	{
		this.uid=id;
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
	public String getRentProPhoto2()
	{
		return rentprophoto2;
	}
	public void setRentProPhoto2(String rentprophoto2)
	{
		this.rentprophoto2=rentprophoto2;
	}
	public String getRentProductPrice()
	{
		return rentproprice;
	}
	public void setRentProductPrice(String rentproprice)
	{
		this.rentproprice=rentproprice;
	}
	public int getRentProductQty1()
	{
		return rentproqty;
	}
	public void setRentProductQty1(int rentproqty)
	{
		this.rentproqty=rentproqty;
	}
	public String getRentProductSpecification1()
	{
		return rentprospecification;
	}
	public void setRentProductSpecification1(String rentprospecification)
	{
		this.rentprospecification=rentprospecification;
	}
	public String getRentProductDescription()
	{
		return rentprodescription;
	}
	public void setRentProductDescription(String rentprodescription)
	{
		this.rentprodescription=rentprodescription;
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