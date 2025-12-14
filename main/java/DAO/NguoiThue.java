package DAO;

public class NguoiThue {
	private String maCCCD;
    private String tenNguoiThue;
    private String sdt;
    private String email;
	public NguoiThue(String maCCCD, String tenNguoiThue, String sdt, String email) {
		super();
		this.maCCCD = maCCCD;
		this.tenNguoiThue = tenNguoiThue;
		this.sdt = sdt;
		this.email = email;
	}
	public String getMaCCCD() {
		return maCCCD;
	}
	public void setMaCCCD(String maCCCD) {
		this.maCCCD = maCCCD;
	}
	public String getTenNguoiThue() {
		return tenNguoiThue;
	}
	public void setTenNguoiThue(String tenNguoiThue) {
		this.tenNguoiThue = tenNguoiThue;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
    
}
