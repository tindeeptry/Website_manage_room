package DAO;

public class ThuePhong {
	private String MaThue;
    private String MaCCCD;
    private String MaPhong;
    private String NgayThue;
    private String NgayHetHanThue;
	public ThuePhong(String maThue, String maCCCD, String maPhong, String ngayThue, String ngayHetHanThue) {
		super();
		MaThue = maThue;
		MaCCCD = maCCCD;
		MaPhong = maPhong;
		NgayThue = ngayThue;
		NgayHetHanThue = ngayHetHanThue;
	}
	public String getMaThue() {
		return MaThue;
	}
	public void setMaThue(String maThue) {
		MaThue = maThue;
	}
	public String getMaCCCD() {
		return MaCCCD;
	}
	public void setMaCCCD(String maCCCD) {
		MaCCCD = maCCCD;
	}
	public String getMaPhong() {
		return MaPhong;
	}
	public void setMaPhong(String maPhong) {
		MaPhong = maPhong;
	}
	public String getNgayThue() {
		return NgayThue;
	}
	public void setNgayThue(String ngayThue) {
		NgayThue = ngayThue;
	}
	public String getNgayHetHanThue() {
		return NgayHetHanThue;
	}
	public void setNgayHetHanThue(String ngayHetHanThue) {
		NgayHetHanThue = ngayHetHanThue;
	}
    
}
