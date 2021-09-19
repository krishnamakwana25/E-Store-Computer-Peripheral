package bean;
public class Notificationbean 
{
	private int isActive;
	private String notname,notdate,nid;
	public String getNotDate()
	{
		return notdate;
	}
	public void setNotDate(String nd)
	{
		this.notdate = nd;
	}
	
	public String getNot_id()
	{
		return nid;
	}
	public void setNot_id(String nd)
	{
		this.nid=nd;
	}
	public String getNot_description()
	{
		return notname;
	}
	public void setNot_description(String n)
	{
		this.notname=n;
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
