package bean;
public class RateToProductbean 
{
	private int opid,uid,isActive,proid,rateid;
	private String OUid,rating;
	public int GetRateId()
	{
		return rateid;
	}
	public void setRateId(int rateid)
	{
		this.rateid=rateid;
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
	public int getUserid()
	{
		return uid;
	}
	public void setUserid(int uid)
	{
		this.uid=uid;
	}	
	public int getIsactive()
	{
		return isActive;
	}
	public void setIsactive(int isactive)
	{
		this.isActive=isactive;
	}
	public String getRating()
	{
		return rating;
	}
	public void setRating(String string)
	{
		this.rating=string;
	}
	public int getProductid()
	{
		return proid;
	}
	public void setProductid(int proid)
	{
		this.proid=proid;
	}
}