package DAO;

public class HoadonDV {
    private String maHDDV;
    private String maHoaDon;
    private String loaiDichVu;
    private String soChuSo;
    private String thanhTien;
    private String thoiGianThanhToan;
    private String trangThaiThanhToan;
	public HoadonDV(String maHDDV, String maHoaDon, String loaiDichVu, String soChuSo, String thanhTien,
			String thoiGianThanhToan, String trangThaiThanhToan) {
		super();
		this.maHDDV = maHDDV;
		this.maHoaDon = maHoaDon;
		this.loaiDichVu = loaiDichVu;
		this.soChuSo = soChuSo;
		this.thanhTien = thanhTien;
		this.thoiGianThanhToan = thoiGianThanhToan;
		this.trangThaiThanhToan = trangThaiThanhToan;
	}
	public String getMaHDDV() {
		return maHDDV;
	}
	public void setMaHDDV(String maHDDV) {
		this.maHDDV = maHDDV;
	}
	public String getMaHoaDon() {
		return maHoaDon;
	}
	public void setMaHoaDon(String maHoaDon) {
		this.maHoaDon = maHoaDon;
	}
	public String getLoaiDichVu() {
		return loaiDichVu;
	}
	public void setLoaiDichVu(String loaiDichVu) {
		this.loaiDichVu = loaiDichVu;
	}
	public String getSoChuSo() {
		return soChuSo;
	}
	public void setSoChuSo(String soChuSo) {
		this.soChuSo = soChuSo;
	}
	public String getThanhTien() {
		return thanhTien;
	}
	public void setThanhTien(String thanhTien) {
		this.thanhTien = thanhTien;
	}
	public String getThoiGianThanhToan() {
		return thoiGianThanhToan;
	}
	public void setThoiGianThanhToan(String thoiGianThanhToan) {
		this.thoiGianThanhToan = thoiGianThanhToan;
	}
	public String getTrangThaiThanhToan() {
		return trangThaiThanhToan;
	}
	public void setTrangThaiThanhToan(String trangThaiThanhToan) {
		this.trangThaiThanhToan = trangThaiThanhToan;
	}
	
}
