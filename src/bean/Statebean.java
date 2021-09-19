package bean;
public class Statebean{
	private int sid;
	private String statenm;
	private int isActive;
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