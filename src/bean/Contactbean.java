package bean;

public class Contactbean {
	
	private String name,mobile_no,email,message;
	private int is_Active,contact_us_id;
	

	public int getContact_us_id()
	{
		return contact_us_id;
	}
	public void setContact_us_id(int contact_us_id)
	{
		this.contact_us_id=contact_us_id;
	}
	
	public String getMobile_no()
	{
		return mobile_no;
	}
	public void setMobile_no(String mobile_no)
	{
		this.mobile_no=mobile_no;
	}
	
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name=name;
	}
	
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email=email;
	}
	
	public String getMessage()
	{
		return message;
	}
	public void setMessage(String message)
	{
		this.message=message;
	}
			
	public int getIs_Active()
	{
		return is_Active;
	}
	public void setIs_Active(int is_Active)
	{
		this.is_Active=is_Active;
	}


}
