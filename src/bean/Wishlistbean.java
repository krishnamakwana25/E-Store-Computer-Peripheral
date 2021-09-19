package bean;

public class Wishlistbean {
	
	private String productphoto,proname,prodescription;
	private int is_Active,wishlist_id,proid,proprice,uid;
	private String wishcolor;
	private String prophoto1,prophoto2,prophoto3,prophoto4;
	
	public int getUserid()
	{
		return uid;
	}
	public void setUserid(int uid)
	{
		this.uid=uid;
	}	
	public int getWishlist_id()
	{
		return wishlist_id;
	}
	public void setWishlist_id(int wishlist_id)
	{
		this.wishlist_id=wishlist_id;
	}
	public String getProductName()
	{
		return proname;
	}
	public void setProductName(String proname)
	{
		this.proname=proname;
	}
	public String getProductPhoto1()
	{
		return prophoto1;
	}
	public void setProductPhoto1(String prophoto1)
	{
		this.prophoto1=prophoto1;
	}
	public String getProductPhoto2()
	{
		return prophoto2;
	}
	public void setProductPhoto2(String prophoto2)
	{
		this.prophoto2=prophoto2;
	}
	public String getProductPhoto3()
	{
		return prophoto3;
	}
	public void setProductPhoto3(String prophoto3)
	{
		this.prophoto3=prophoto3;
	}
	public String getProductPhoto4()
	{
		return prophoto4;
	}
	public void setProductPhoto4(String prophoto4)
	{
		this.prophoto4=prophoto4;
	}
	public int getProductPrice()
	{
		return proprice;
	}
	public void setProductPrice(int proprice)
	{
		this.proprice=proprice;
	}
	public String getProductDescription()
	{
		return prodescription;
	}
	public void setProductDescription(String prodescription)
	{
		this.prodescription=prodescription;
	}	
	public String getWishlistColor()
	{
		return wishcolor;
	}
	public void setWishlistColor(String wishcolor)
	{
		this.wishcolor=wishcolor;
	}
	public int getProductid()
	{
		return proid;
	}
	public void setProductid(int proid)
	{
		this.proid=proid;
	}
	public String getProductname()
	{
		return proname;
	}
	public void setProductname(String proname)
	{
		this.proname=proname;
	}
	public String getProductphoto()
	{
		return productphoto;
	}
	public void setProductphoto(String productphoto)
	{
		this.productphoto=productphoto;
	}
	public int getProductprice()
	{
		return proprice;
	}
	public void setProprice(int proprice)
	{
		this.proprice=proprice;
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
