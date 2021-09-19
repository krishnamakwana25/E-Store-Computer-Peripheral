package bean;
public class Areabean{
	private int aid;
	private String areaname;
	private  int cid,isActive,sid;
	private String cname,statenm;
	public int getAid()
	{
		return aid;
	}
	public void setAid(int aid)
	{
		this.aid=aid;
	}
	public String getAreaname()
	{
		return areaname;
	}
	public void setAreaname(String areaname)
	{
		this.areaname=areaname;
	}
	public int getCid()
	{
		return cid;
	}
	public void setCid(int cid)
	{
		this.cid=cid;
	}
	public String getCityname()
	{
		return cname;
	}
	public void setCityname(String cname)
	{
		this.cname=cname;
	}
	public int getSid()
	{
		return sid;
	}
	public void setSid(int id)
	{
		this.sid=id;
	}
	public String getStatename()
	{
		return statenm;
	}
	public void setStatename(String snm)
	{
		this.statenm=snm;
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