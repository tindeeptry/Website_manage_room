package DAO;

public class room {
	private String maPhong;
    private String soPhong;
    private String dienTich;
    private String giaThue;
    private String trangThai;
	public room(String maPhong, String soPhong, String dienTich, String giaThue, String trangThai) {
		super();
		this.maPhong = maPhong;
		this.soPhong = soPhong;
		this.dienTich = dienTich;
		this.giaThue = giaThue;
		this.trangThai = trangThai;
	}
	public String getMaPhong() {
		return maPhong;
	}
	public void setMaPhong(String maPhong) {
		this.maPhong = maPhong;
	}
	public String getSoPhong() {
		return soPhong;
	}
	public void setSoPhong(String soPhong) {
		this.soPhong = soPhong;
	}
	public String getDienTich() {
		return dienTich;
	}
	public void setDienTich(String dienTich) {
		this.dienTich = dienTich;
	}
	public String getGiaThue() {
		return giaThue;
	}
	public void setGiaThue(String giaThue) {
		this.giaThue = giaThue;
	}
	public String getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(String trangThai) {
		this.trangThai = trangThai;
	}
		
}
