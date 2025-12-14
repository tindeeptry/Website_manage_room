package Q_LY_HoaDon;

import java.security.Timestamp;

public class HoaDon {
	private String maHoaDon;
    private String maPhong;
    private String soTien;
    private String thoiGianThanhToan;
    private String maCCCD;
	public HoaDon(String maHoaDon, String maPhong, String soTien, String thoiGianThanhToan, String maCCCD) {
		super();
		this.maHoaDon = maHoaDon;
		this.maPhong = maPhong;
		this.soTien = soTien;
		this.thoiGianThanhToan = thoiGianThanhToan;
		this.maCCCD = maCCCD;
	}
	public String getMaHoaDon() {
		return maHoaDon;
	}
	public void setMaHoaDon(String maHoaDon) {
		this.maHoaDon = maHoaDon;
	}
	public String getMaPhong() {
		return maPhong;
	}
	public void setMaPhong(String maPhong) {
		this.maPhong = maPhong;
	}
	public String getSoTien() {
		return soTien;
	}
	public void setSoTien(String soTien) {
		this.soTien = soTien;
	}
	public String getThoiGianThanhToan() {
		return thoiGianThanhToan;
	}
	public void setThoiGianThanhToan(String thoiGianThanhToan) {
		this.thoiGianThanhToan = thoiGianThanhToan;
	}
	public String getMaCCCD() {
		return maCCCD;
	}
	public void setMaCCCD(String maCCCD) {
		this.maCCCD = maCCCD;
	}
	
    
}