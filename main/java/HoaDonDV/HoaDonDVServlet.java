package HoaDonDV;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import DAO.HoadonDV;

@WebServlet("/HoaDonDVServlet")
public class HoaDonDVServlet extends HttpServlet {

    private static final String dbURL = "jdbc:mysql://localhost:3306/QuanLyPhongTro";
    private static final String username = "root";
    private static final String password = "Tien0610";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbURL, username, password);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<HoadonDV> danhSachHoaDonDV = new ArrayList<>();
        String action = request.getParameter("action");
        try (Connection connection = getConnection()) {    	
        	if ("xem".equals(action)) {
        		String MaHoaDon = request.getParameter("MaHoaDon");
        		if (MaHoaDon !=null && !MaHoaDon.isEmpty()) {
        			String query = "SELECT * FROM HoaDonDichVu WHERE MaHoaDon = ?";
        			try (PreparedStatement pstmt = connection.prepareStatement(query)) {
        				pstmt.setString(1, MaHoaDon);
        				try (ResultSet rs = pstmt.executeQuery()) {

        		            while (rs.next()) {
        		            	String MaHDDV = rs.getString("MaHDDV");
        		            	String MaHoaDon1 = rs.getString("MaHoaDon");
        		            	String LoaiDichVu = rs.getString("LoaiDichVu");
        		            	String SoChuSo = rs.getString("SoChuSo");
        		                String ThanhTien = rs.getString("ThanhTien");
        		                String ThoiGianThanhToan = rs.getString("ThoiGianThanhToan");
        		                String TrangThaiThanhToan = rs.getString("TrangThaiThanhToan");

        		                danhSachHoaDonDV.add(new HoadonDV(MaHDDV, MaHoaDon1, LoaiDichVu, SoChuSo, ThanhTien, ThoiGianThanhToan,  TrangThaiThanhToan));
        		            }
        		             }
        			}
        		}
        	} else {
        	
             try (Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("SELECT * FROM HoaDonDichVu")) {

            while (rs.next()) {
            	String MaHDDV = rs.getString("MaHDDV");
            	String MaHoaDon = rs.getString("MaHoaDon");
            	String LoaiDichVu = rs.getString("LoaiDichVu");
            	String SoChuSo = rs.getString("SoChuSo");
                String ThanhTien = rs.getString("ThanhTien");
                String ThoiGianThanhToan = rs.getString("ThoiGianThanhToan");
                String TrangThaiThanhToan = rs.getString("TrangThaiThanhToan");

                danhSachHoaDonDV.add(new HoadonDV(MaHDDV, MaHoaDon, LoaiDichVu, SoChuSo, ThanhTien, ThoiGianThanhToan,  TrangThaiThanhToan));
            }
             }
        }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("danhSachHoaDonDV", danhSachHoaDonDV);
        RequestDispatcher dispatcher = request.getRequestDispatcher("hoadondv.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        
        String maHDDV = request.getParameter("MaHDDV");
        String maHoaDon = request.getParameter("MaHoaDon");
        String loaiDichVu = request.getParameter("LoaiDichVu");
        String soChuSo = request.getParameter("SoChuSo");
        String thanhTien = request.getParameter("ThanhTien");
        String thoiGianThanhToan = request.getParameter("ThoiGianThanhToan");
        String trangThai = request.getParameter("TrangThaiThanhToan");

        try (Connection conn = getConnection()) {
            if ("add".equals(action)) {
                String sql = "INSERT INTO HoaDonDichVu (MaHDDV, MaHoaDon, LoaiDichVu, SoChuSo, ThanhTien, ThoiGianThanhToan, TrangThaiThanhToan) VALUES (?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, maHDDV);
                    stmt.setString(2, maHoaDon);
                    stmt.setString(3, loaiDichVu);
                    stmt.setString(4, soChuSo);
                    stmt.setString(5, thanhTien);
                    stmt.setString(6, thoiGianThanhToan);
                    stmt.setString(7, trangThai);
                    stmt.executeUpdate();
                }

            } else if ("update".equals(action)) {
                String sql = "UPDATE HoaDonDichVu SET MaHoaDon=?, LoaiDichVu=?, SoChuSo=?, ThanhTien=?, ThoiGianThanhToan=?, TrangThaiThanhToan=? WHERE MaHDDV=?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, maHoaDon);
                    stmt.setString(2, loaiDichVu);
                    stmt.setString(3, soChuSo);
                    stmt.setString(4, thanhTien);
                    stmt.setString(5, thoiGianThanhToan);
                    stmt.setString(6, trangThai);
                    stmt.setString(7, maHDDV);
                    stmt.executeUpdate();
                }

            } else if ("delete".equals(action)) {
                String sql = "DELETE FROM HoaDonDichVu WHERE MaHDDV=?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, maHDDV);
                    stmt.executeUpdate();
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("HoaDonDVServlet");
    }
}
