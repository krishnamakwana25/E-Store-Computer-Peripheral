package bean;
public class OrderStatusBean {

	private int op_id,user_id,product_id,is_Active,status_id;
	private String status;
	public int getStatus_id() {
		return status_id;
	}
	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}
	public int getOp_id() {
		return op_id;
	}
	public void setOp_id(int op_id) {
		this.op_id = op_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getIs_Active() {
		return is_Active;
	}
	public void setIs_Active(int is_Active) {
		this.is_Active = is_Active;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
