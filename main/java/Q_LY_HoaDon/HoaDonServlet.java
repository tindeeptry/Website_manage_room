package Q_LY_HoaDon;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.HoaDon;

@WebServlet("/HoaDonServlet")
public class HoaDonServlet extends HttpServlet {

    private static final String dbURL = "jdbc:mysql://localhost:3306/QuanLyPhongTro";
    private static final String username = "root";
    private static final String password = "Tien0610";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbURL, username, password);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<HoaDon> danhSachHoaDon = new ArrayList<>();
        String action = request.getParameter("action");
        try (Connection connection = getConnection()) {    	
        	if ("Xem".equals(action)) {
        		String MaCCCD = request.getParameter("MaCCCD");
        		if (MaCCCD !=null && !MaCCCD.isEmpty()) {
        			String query = "SELECT * FROM HoaDon WHERE MaCCCD = ?";
        			try (PreparedStatement pstmt = connection.prepareStatement(query)) {
        				pstmt.setString(1, MaCCCD);
        				try (ResultSet rs = pstmt.executeQuery()) {

        		            while (rs.next()) {
        		                String maHoaDon = rs.getString("MaHoaDon");
        		                String maThue = rs.getString("MaThue");
        		                String soTien = rs.getString("SoTien");
        		                String thoiGianThanhToan = rs.getString("ThoiGianThanhToan");
        		                String MaCCCD1 = rs.getString("MaCCCD");
        		                String trangThaiThanhToan = rs.getString("TrangThaiThanhToan");

        		                danhSachHoaDon.add(new HoaDon(maHoaDon, maThue, soTien, thoiGianThanhToan, MaCCCD1, trangThaiThanhToan));
        		            }
        		             }
        			}
        		}
        	}else {
        	
             try (Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("SELECT * FROM HoaDon")) {

            while (rs.next()) {
                String maHoaDon = rs.getString("MaHoaDon");
                String maThue = rs.getString("MaThue");
                String soTien = rs.getString("SoTien");
                String thoiGianThanhToan = rs.getString("ThoiGianThanhToan");
                String maCCCD = rs.getString("MaCCCD");
                String trangThaiThanhToan = rs.getString("TrangThaiThanhToan");

                danhSachHoaDon.add(new HoaDon(maHoaDon, maThue, soTien, thoiGianThanhToan, maCCCD, trangThaiThanhToan));
            }
             }
        }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("danhSachHoaDon", danhSachHoaDon);
        RequestDispatcher dispatcher = request.getRequestDispatcher("hoadon.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String maHoaDon = request.getParameter("MaHoaDon");
        String maThue = request.getParameter("MaThue");
        String soTien = request.getParameter("SoTien");
        String thoiGianThanhToan = request.getParameter("ThoiGianThanhToan");
        String maCCCD = request.getParameter("MaCCCD");
        String trangThaiThanhToan = request.getParameter("TrangThaiThanhToan");

        try (Connection connection = getConnection()) {
            if ("add".equals(action)) {
                String insertQuery = "INSERT INTO HoaDon (MaHoaDon, MaThue, SoTien, ThoiGianThanhToan, MaCCCD, TrangThaiThanhToan) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(insertQuery)) {
                	pstmt.setString(1, maHoaDon);
                	pstmt.setString(2, maThue);
                    pstmt.setString(3, soTien);
                    pstmt.setString(4, thoiGianThanhToan);
                    pstmt.setString(5, maCCCD);
                    pstmt.setString(6, trangThaiThanhToan);
                    pstmt.executeUpdate();
                }
            } else if ("update".equals(action)) {
                String updateQuery = "UPDATE HoaDon SET MaThue = ?, SoTien = ?, ThoiGianThanhToan = ?, MaCCCD = ?, TrangThaiThanhToan = ? WHERE MaHoaDon = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(updateQuery)) {
                    pstmt.setString(1, maThue);
                    pstmt.setString(2, soTien);
                    pstmt.setString(3, thoiGianThanhToan);
                    pstmt.setString(4, maCCCD);
                    pstmt.setString(5, trangThaiThanhToan);
                    pstmt.setString(6, maHoaDon);
                    pstmt.executeUpdate();
                }
            } else if ("delete".equals(action)) {
                String deleteQuery = "DELETE FROM HoaDon WHERE MaHoaDon = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(deleteQuery)) {
                    pstmt.setString(1, maHoaDon);
                    pstmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        doGet(request, response);
    }
}
