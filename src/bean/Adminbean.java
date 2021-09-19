package bean;
public class Adminbean 
{
	private String fnm,lnm,address,pwd,pwd1,photo,email,mobileno;
	private int isActive,gender,aid;
	public int getAdmin_id()
	{
		return aid;
	}
	public void setAdmin_id(int id)
	{
		this.aid = id;
	}
	public int getisActive()
	{
		return isActive;
	}
	public void setisActive(int i)
	{
		this.isActive = i;
	}
	public int getGender()
	{
		return gender;
	}
	public void setGender(int g)
	{
		this.gender = g;
	}
	public String getMobileNo()
	{
		return mobileno;
	}
	public void setMobileNo(String m)
	{
		this.mobileno = m;
	}
	public String getFirstName()
	{
		return fnm;
	}
	public void setFirstName(String firstname)
	{
		this.fnm = firstname;
	}
	public String getLastName()
	{
		return lnm;
	}
	public void setLastName(String lastname)
	{
		this.lnm = lastname;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String mail)
	{
		this.email = mail;
	}
	public String getPassword()
	{
		return pwd;
	}
	public void setPassword(String p)
	{
		this.pwd = p;
	}
	public String getConfirmPassword()
	{
		return pwd1;
	}
	public void setConfirmPassword(String p1)
	{
		this.pwd1 = p1;
	}
	public String getAdress()
	{
		return address;
	}
	public void setAddress(String add)
	{
		this.address = add;
	}
	public String getPhoto()
	{
		return photo;
	}
	public void setPhoto(String p )
	{
		this.photo = p;
	}
}