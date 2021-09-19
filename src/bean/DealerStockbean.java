package bean;
public class DealerStockbean 
{
	private String dealernm,mobile,address,mail,pronm;
	private int isActive,dealerid,qty,pid1,ds;
	public int getDealerStockid()
	{
		return ds;
	}
	public void setDealerStockid(int d)
	{
		this.ds=d;
	}
	public int getDealerid()
	{
		return dealerid;
	}
	public void setDealerid(int dealerid)
	{
		this.dealerid=dealerid;
	}
	public int getProductid()
	{
		return pid1;
	}
	public void setProductid(int pid)
	{
		this.pid1=pid;
	}
	public int getStockQty()
	{
		return qty;
	}
	public void setStockQty(int q)
	{
		this.qty=q;
	}
	public String getProductName()
	{
		return pronm;
	}
	public void setProductName(String pnm)
	{
		this.pronm=pnm;
	}
	public String getDealername()
	{
		return dealernm;
	}
	public void setDealername(String dealernm)
	{
		this.dealernm=dealernm;
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
