package bean;

public class Productbean {
	private int proid ,isActive,proqty,subcatid,maincatid;
	private String proprice,proname,prospecification, prodescription,subcatname,maincatname,prophoto1,prophoto2,prophoto3,prophoto4,processsor,RAM,HDD,SDD,gc;
	//private float proprice;
	
	public int getSubcatid()
	{
		return subcatid;
	}
	public void setSubcatid(int subcatid)
	{
		this.subcatid=subcatid;
	}
	public String getProcessorName()
	{
		return processsor;
	}
	public void setProcessorName(String processsor)
	{
		this.processsor=processsor;
	}
	public String getRAM()
	{
		return RAM;
	}
	public void setRAM(String RAM)
	{
		this.RAM=RAM;
	}
	public String getStorageHDD()
	{
		return HDD;
	}
	public void setStorageHDD(String HDD)
	{
		this.HDD=HDD;
	}
	public String getStorageSDD()
	{
		return SDD;
	}
	public void setStorageSDD(String SDD)
	{
		this.SDD=SDD;
	}
	public String getGC()
	{
		return gc;
	}
	public void setGC(String gc)
	{
		this.gc=gc;
	}
	public String getSubcatname()
	{
		return subcatname;
	}
	public void setSubcatname(String subcatname)
	{
		this.subcatname=subcatname;
	}
	public int getMaincatid()
	{
		return maincatid;
	}
	public void setMaincatid(int maincatid)
	{
		this.maincatid=maincatid;
	}
	public String getMaincatname()
	{
		return maincatname;
	}
	public void setMaincatname(String maincatname)
	{
		this.maincatname=maincatname;
	}
	public int getProductid()
	{
		return proid;
	}
	public void setProductid(int proid)
	{
		this.proid=proid;
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
	public String getProductPrice()
	{
		return proprice;
	}
	public void setProductPrice(String proprice)
	{
		this.proprice=proprice;
	}
	public int getProductQty1()
	{
		return proqty;
	}
	public void setProductQty1(int proqty)
	{
		this.proqty=proqty;
	}
	public String getProductSpecification1()
	{
		return prospecification;
	}
	public void setProductSpecification1(String prospecification)
	{
		this.prospecification=prospecification;
	}
	public String getProductDescription()
	{
		return prodescription;
	}
	public void setProductDescription(String prodescription)
	{
		this.prodescription=prodescription;
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