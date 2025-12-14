package DAO;

import java.security.Timestamp;

public class HoaDon {
	private String maHoaDon;
    private String maThue;
    private String soTien;
    private String thoiGianThanhToan;
    private String maCCCD;
    private String trangThaiThanhToan;
	public HoaDon(String maHoaDon, String maThue, String soTien, String thoiGianThanhToan, String maCCCD,
			String trangThaiThanhToan) {
		super();
		this.maHoaDon = maHoaDon;
		this.maThue = maThue;
		this.soTien = soTien;
		this.thoiGianThanhToan = thoiGianThanhToan;
		this.maCCCD = maCCCD;
		this.trangThaiThanhToan = trangThaiThanhToan;
	}
	public String getMaHoaDon() {
		return maHoaDon;
	}
	public void setMaHoaDon(String maHoaDon) {
		this.maHoaDon = maHoaDon;
	}
	public String getMaThue() {
		return maThue;
	}
	public void setMaThue(String maThue) {
		this.maThue = maThue;
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
	public String getTrangThaiThanhToan() {
		return trangThaiThanhToan;
	}
	public void setTrangThaiThanhToan(String trangThaiThanhToan) {
		this.trangThaiThanhToan = trangThaiThanhToan;
	}
	
}
