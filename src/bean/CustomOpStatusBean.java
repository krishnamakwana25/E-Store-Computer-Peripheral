package bean;
public class CustomOpStatusBean 
{	
	private int cust_op_id,user_id,customizeprodid,isActive,status_id;
	private String status;
	public int getCust_op_id() {
		return cust_op_id;
	}
	public void setCust_op_id(int cust_op_id) {
		this.cust_op_id = cust_op_id;
	}
	public int getStatus_id() {
		return status_id;
	}
	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getCustomizeprodid() {
		return customizeprodid;
	}
	public void setCustomizeprodid(int customizeprodid) {
		this.customizeprodid = customizeprodid;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
