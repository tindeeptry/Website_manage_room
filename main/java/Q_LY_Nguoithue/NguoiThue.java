package Q_LY_Nguoithue;

public class NguoiThue {
	private int maNguoiThue;
    private String tenNguoiThue;
    private String sdt;
    private String cccd;
    private String ngayThue;
    private String maPhong;
	public NguoiThue(int maNguoiThue, String tenNguoiThue, String sdt, String cccd, String ngayThue, String maPhong) {
		super();
		this.maNguoiThue = maNguoiThue;
		this.tenNguoiThue = tenNguoiThue;
		this.sdt = sdt;
		this.cccd = cccd;
		this.ngayThue = ngayThue;
		this.maPhong = maPhong;
	}
	public int getMaNguoiThue() {
		return maNguoiThue;
	}
	public void setMaNguoiThue(int maNguoiThue) {
		this.maNguoiThue = maNguoiThue;
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
	public String getCccd() {
		return cccd;
	}
	public void setCccd(String cccd) {
		this.cccd = cccd;
	}
	public String getNgayThue() {
		return ngayThue;
	}
	public void setNgayThue(String ngayThue) {
		this.ngayThue = ngayThue;
	}
	public String getMaPhong() {
		return maPhong;
	}
	public void setMaPhong(String maPhong) {
		this.maPhong = maPhong;
	}
    
	
	
}
