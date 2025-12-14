package Q_LY_TK;

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

import DAO.TaiKhoan;

@WebServlet("/TKServlet")
public class TKServlet extends HttpServlet {

    private static final String dbURL = "jdbc:mysql://localhost:3306/QuanLyPhongTro";
    private static final String username = "root";
    private static final String password = "Tien0610";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbURL, username, password);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<TaiKhoan> danhSachTK = new ArrayList<>();

        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("SELECT * FROM TaiKhoan")) {

            while (rs.next()) {
                int maTK = rs.getInt("MaTK");
                String tenDangNhap = rs.getString("TenDangNhap");
                String matKhau = rs.getString("MatKhau");
                String loaiTaiKhoan = rs.getString("LoaiTaiKhoan");

                danhSachTK.add(new TaiKhoan(maTK, tenDangNhap, matKhau, loaiTaiKhoan));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("danhSachTK", danhSachTK);
        RequestDispatcher dispatcher = request.getRequestDispatcher("taiKhoan.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String maTK = request.getParameter("MaTK");
        String tenDangNhap = request.getParameter("TenDangNhap");
        String matKhau = request.getParameter("MatKhau");
        String loaiTaiKhoan = request.getParameter("LoaiTaiKhoan");

        try (Connection connection = getConnection()) {
            if ("add".equals(action)) {
                String insertQuery = "INSERT INTO TaiKhoan (TenDangNhap, MatKhau, LoaiTaiKhoan) VALUES (?, ?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(insertQuery)) {
                    pstmt.setString(1, tenDangNhap);
                    pstmt.setString(2, matKhau);
                    pstmt.setString(3, loaiTaiKhoan);
                    pstmt.executeUpdate();
                }
            } else if ("update".equals(action)) {
                String updateQuery = "UPDATE TaiKhoan SET TenDangNhap = ?, MatKhau = ?, LoaiTaiKhoan = ? WHERE MaTK = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(updateQuery)) {
                    pstmt.setString(1, tenDangNhap);
                    pstmt.setString(2, matKhau);
                    pstmt.setString(3, loaiTaiKhoan);
                    pstmt.setInt(4, Integer.parseInt(maTK));
                    pstmt.executeUpdate();
                }
            } else if ("delete".equals(action)) {
                String deleteQuery = "DELETE FROM TaiKhoan WHERE MaTK = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(deleteQuery)) {
                    pstmt.setInt(1, Integer.parseInt(maTK));
                    pstmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        doGet(request, response);
    }
}
