package bean;
public class Userbean{
	private String unm,password,cpassword,mail,mobile,add,photo;
	private int isActive,uid,gender;
	private String cname;
	private int sid;
	private String sname;
	private int cid,status,aid,dob;
	private String areaname;
	public int getStatus()
	{
		return status;
	}
	public void setStatus(int s)
	{
		this.status=s;
	}
	public int getGender()
	{
		return gender;
	}
	public void setGender(int gender)
	{
		this.gender=gender;
	}
	public int getDOB()
	{
		return dob;
	}
	public void setDOB(int dob)
	{
		this.dob=dob;
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
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password=password;
	}
	public String getConfirmPassword()
	{
		return cpassword;
	}
	public void setConfirmPassword(String cpassword)
	{
		this.cpassword=cpassword;
	}
	public String getMail()
	{
		return mail;
	}
	public void setMail(String mail)
	{
		this.mail=mail;
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
	public String getPhoto()
	{
		return photo;
	}
	public void setPhoto(String photo)
	{
		this.photo=photo;
	}
	public int getIsactive()
	{
		return isActive;
	}
	public void setIsactive(int isactive)
	{
		this.isActive=isactive;
	}
	
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
}


/*public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender=gender;
	}
*/