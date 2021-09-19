package bean;

public class Subcategorybean {
	private int subcatid,isActive,maincatid;
	private String subcatname,maincatname;
	
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
	public int getSubcatid()
	{
		return subcatid;
	}
	public void setSubcatid(int subcatid)
	{
		this.subcatid=subcatid;
	}
	public String getSubcatname()
	{
		return subcatname;
	}
	public void setSubcatname(String subcatname)
	{
		this.subcatname=subcatname;
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
