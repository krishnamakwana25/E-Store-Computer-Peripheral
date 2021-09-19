package bean;
public class CustomeOPbean
{
	private int orderid,uid,proid ,isActive,quantity,proprice,totalprice,opid,proqty;
	private String mail,paymenttype,OUid,orderdate,prophoto1,proname,unm,pcnm,address;
	public String getPCName() {
		return pcnm;
	}
	public void setPCName(String p) {
		this.pcnm = p;
	}
	public String getUsername()
	{
		return unm;
	}
	public void setUsername(String unm)
	{
		this.unm=unm;
	}
	public int getCustomProductQty1()
	{
		return proqty;
	}
	public void setCustomProductQty1(int q)
	{
		this.proqty=q;
	}
	public int getCustomProductQty()
	{
		return quantity; 
	}
	public void setCustomProductQty(int quantity)
	{
		this.quantity=quantity;
	}
	public String getCustomProductName()
	{
		return proname;
	}
	public void setCustomProductName(String proname)
	{
		this.proname=proname;
	}
	public String getCustomProductPhoto1()
	{
		return prophoto1;
	}
	public void setCustomProductPhoto1(String prophoto1)
	{
		this.prophoto1=prophoto1;
	}
	public int getCustomProductPrice()
	{
		return proprice;
	}
	public void setCustomProductPrice(int proprice)
	{
		this.proprice=proprice;
	}
	public String getCustomUserOrderid()
	{
		return OUid;
	}
	public void setCustomUserOrderid(String OUid)
	{
		this.OUid=OUid;
	}
	public int getCustomOPid()
	{
		return opid;
	}
	public void setCustomOPid(int opid)
	{
		this.opid=opid;
	}
	public int getCustomOrderid()
	{
		return orderid;
	}
	public void setCustomOrderid(int orderid)
	{
		this.orderid=orderid;
	}	
	public int getUserid()
	{
		return uid;
	}
	public void setUserid(int uid)
	{
		this.uid=uid;
	}
	public String getMail()
	{
		return mail;
	}
	public void setMail(String mail)
	{
		this.mail=mail;
	}
	public int getCustomProductid()
	{
		return proid;
	}
	public void setCustomProductid(int proid)
	{
		this.proid=proid;
	}
	public int getCustomOrderQty()
	{
		return quantity; 
	}
	public void setCustomOrderQty(int quantity)
	{
		this.quantity=quantity;
	}
	public int getCustomOrderPrice()
	{
		return proprice;
	}
	public void setCustomOrderPrice(int proprice)
	{
		this.proprice=proprice;
	}
	public int getCustomOrderTotal()
	{
		return totalprice;
	}
	public void setCustomtOrderTotal(int totalprice)
	{
		this.totalprice=totalprice;
	}
	public String getCustomPaymnetType()
	{
		return paymenttype;
	}
	public void setCustomPaymnetType(String paymenttype)
	{
		this.paymenttype=paymenttype;
	}
	public String getCustomOrderPlaceDate()
	{
		return orderdate;
	}
	public void setCustomOrderPlaceDate(String orderdate)
	{
		this.orderdate=orderdate;
	}	
	public int getIsactive()
	{
		return isActive;
	}
	public void setIsactive(int isactive)
	{
		this.isActive=isactive;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}