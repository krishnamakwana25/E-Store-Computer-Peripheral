package bean;
public class ORPStatusBean {
	private int orp_id,user_id,rentprodid,isActive,status_id;
	private String status;
	public int getOrp_id() {
		return orp_id;
	}
	public void setOrp_id(int orp_id) {
		this.orp_id = orp_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getRentprodid() {
		return rentprodid;
	}
	public void setRentprodid(int rentprodid) {
		this.rentprodid = rentprodid;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public int getStatus_id() {
		return status_id;
	}
	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}