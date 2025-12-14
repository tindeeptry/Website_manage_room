package Q_LY_Phong;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.room;

@WebServlet("/phong")
public class PhongServlet extends HttpServlet {

    private static final String dbURL = "jdbc:mysql://localhost:3306/QuanLyPhongTro";
    private static final String username = "root";
    private static final String password = "Tien0610";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbURL, username, password);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<room> danhSachPhong = new ArrayList<>();

        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("SELECT * FROM Phong")) {

            while (rs.next()) {
                String maPhong = rs.getString("MaPhong");
                String soPhong = rs.getString("SoPhong");
                String dienTich = rs.getString("DienTich");
                String giaThue = rs.getString("GiaThue");
                String trangThai = rs.getString("TrangThai");

                danhSachPhong.add(new room(maPhong, soPhong, dienTich, giaThue, trangThai));
                
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("danhSachPhong", danhSachPhong);
        RequestDispatcher dispatcher = request.getRequestDispatcher("phong.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String maPhong = request.getParameter("MaPhong");
        String soPhong = request.getParameter("SoPhong");
        String dienTich = request.getParameter("DienTich");
        String giaThue = request.getParameter("GiaThue");
        String trangThai = request.getParameter("TrangThai");

        try (Connection connection = getConnection()) {
            if ("add".equals(action)) {
                String insertQuery = "INSERT INTO Phong (MaPhong, SoPhong, DienTich, GiaThue, TrangThai) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(insertQuery)) {
                	pstmt.setString(1, maPhong);
                	pstmt.setString(2, soPhong);
                    pstmt.setString(3, dienTich);
                    pstmt.setString(4, giaThue);
                    pstmt.setString(5, trangThai);
                    pstmt.executeUpdate();
                }
            } else if ("update".equals(action)) {
                String updateQuery = "UPDATE Phong SET SoPhong = ?, DienTich = ?, GiaThue = ?, TrangThai = ? WHERE MaPhong = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(updateQuery)) {
                    pstmt.setString(1, soPhong);
                    pstmt.setString(2, dienTich);
                    pstmt.setString(3, giaThue);
                    pstmt.setString(4, trangThai);
                    pstmt.setString(5, maPhong);
                    pstmt.executeUpdate();
                }
            } else if ("delete".equals(action)) {
                String deleteQuery = "DELETE FROM Phong WHERE MaPhong = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(deleteQuery)) {
                    pstmt.setString(1, maPhong);
                    pstmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        doGet(request, response);
    }
}
