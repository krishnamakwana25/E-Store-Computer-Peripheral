package bean;
public class Citybean {
	private  int cid,isActive,sid;
	private String cname,sname;
	public int getCid()
	{
		return cid;
	}
	public void setCid(int cid)
	{
		this.cid=cid;
	}
	public String getStatename()
	{ 
		return sname;
	}
	public void setStatename(String sname)
	{
		this.sname=sname;
	}
	public int getSid()
	{
		return sid;
	}
	public void setSid(int sid)
	{
		this.sid=sid;
	}
	public String getCityname()
	{
		return cname;
	}
	public void setCityname(String cname)
	{
		this.cname=cname;
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
