package Q_LY_Nguoithue;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.NguoiThue;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/NguoiThueServlet")
public class NguoiThueServlet extends HttpServlet {

    private static final String dbURL = "jdbc:mysql://localhost:3306/QuanLyPhongTro";
    private static final String username = "root";
    private static final String password = "Tien0610";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbURL, username, password);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<NguoiThue> danhSach = new ArrayList<>();

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM NguoiThue")) {

            while (rs.next()) {
                String maCCCD = rs.getString("MaCCCD");
                String ten = rs.getString("TenNguoiThue");
                String sdt = rs.getString("SDT");
                String email = rs.getString("Email");

                danhSach.add(new NguoiThue(maCCCD, ten, sdt, email));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("danhSach", danhSach);
        RequestDispatcher dispatcher = request.getRequestDispatcher("NguoiThue.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        String maCCCD = request.getParameter("MaCCCD");
        String ten = request.getParameter("TenNguoiThue");
        String sdt = request.getParameter("SDT");
        String email = request.getParameter("Email");

        try (Connection conn = getConnection()) {
            if ("add".equals(action)) {
                String sql = "INSERT INTO NguoiThue (MaCCCD, TenNguoiThue, SDT, Email) VALUES (?, ?, ?, ?)";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, maCCCD);
                    ps.setString(2, ten);
                    ps.setString(3, sdt);
                    ps.setString(4, email);
                    ps.executeUpdate();
                }
            } else if ("update".equals(action)) {
                String sql = "UPDATE NguoiThue SET TenNguoiThue = ?, SDT = ?, Email = ? WHERE MaCCCD = ?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, ten);
                    ps.setString(2, sdt);
                    ps.setString(3, email);
                    ps.setString(4, maCCCD);
                    ps.executeUpdate();
                }
            } else if ("delete".equals(action)) {
                String sql = "DELETE FROM NguoiThue WHERE MaCCCD = ?";
                try (PreparedStatement ps = conn.prepareStatement(sql)) {
                    ps.setString(1, maCCCD);
                    ps.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        doGet(request, response);
    }
}
