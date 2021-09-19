package bean;

public class Dealerregisterbean
{
	private String dealernm,password,cpassword,mobile,address,photo;
	private int isActive,dealerid;
	private String mail;

	public int getDealerid()
	{
		return dealerid;
	}
	public void setDealerid(int dealerid)
	{
		this.dealerid=dealerid;
	}
	public String getPhoto()
	{
		return photo;
	}
	public void setPhoto(String photo)
	{
		this.photo=photo;
	}
	public String getDealername()
	{
		return dealernm;
	}
	public void setDealername(String dealernm)
	{
		this.dealernm=dealernm;
	}
	public String getDealerPassword()
	{
		return password;
	}
	public void setDealerPassword(String password)
	{
		this.password=password;
	}
	public String getDealerConfirmPassword()
	{
		return cpassword;
	}
	public void setDealerConfirmPassword(String cpassword)
	{
		this.cpassword=cpassword;
	}
	public String getDealerMail()
	{
		return mail;
	}
	public void setDealerMail(String mail)
	{
		this.mail=mail;
	}
	public String getContactNo()
	{
		return mobile;
	}
	public void setContactNo(String mobile)
	{
		this.mobile=mobile;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address=address;
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
