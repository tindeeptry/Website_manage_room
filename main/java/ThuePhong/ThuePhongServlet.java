package ThuePhong;

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

import DAO.ThuePhong;

@WebServlet("/ThuePhongServlet")
public class ThuePhongServlet extends HttpServlet {

    private static final String dbURL = "jdbc:mysql://localhost:3306/QuanLyPhongTro";
    private static final String username = "root";
    private static final String password = "Tien0610";

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(dbURL, username, password);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<ThuePhong> dS = new ArrayList<>();

        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet rs = statement.executeQuery("SELECT * FROM ThuePhong")) {

            while (rs.next()) {
                String MaThue = rs.getString("MaThue");
                String MaCCCD = rs.getString("MaCCCD");
                String MaPhong = rs.getString("MaPhong");
                String NgayThue = rs.getString("NgayThue");
                String NgayHetHanThue = rs.getString("NgayHetHanThue");

                dS.add(new ThuePhong(MaThue, MaCCCD, MaPhong, NgayThue, NgayHetHanThue));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("dS", dS);
        RequestDispatcher dispatcher = request.getRequestDispatcher("thuePhong.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String MaThue = request.getParameter("MaThue");
        String MaCCCD = request.getParameter("MaCCCD");
        String MaPhong = request.getParameter("MaPhong");
        String NgayThue = request.getParameter("NgayThue");
        String NgayHetHanThue = request.getParameter("NgayHetHanThue");

        try (Connection connection = getConnection()) {
            if ("add".equals(action)) {
                String insertQuery = "INSERT INTO ThuePhong (MaThue, MaCCCD, MaPhong, NgayThue, NgayHetHanThue) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement pstmt = connection.prepareStatement(insertQuery)) {
                    pstmt.setString(1, MaThue);
                    pstmt.setString(2, MaCCCD);
                    pstmt.setString(3, MaPhong);
                    pstmt.setString(4, NgayThue);
                    pstmt.setString(5, NgayHetHanThue);
                    pstmt.executeUpdate();
                }
            } else if ("update".equals(action)) {
                String updateQuery = "UPDATE ThuePhong SET MaCCCD = ?, MaPhong = ?, NgayThue = ?, NgayHetHanThue WHERE MaThue = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(updateQuery)) {
                    pstmt.setString(1, MaCCCD);
                    pstmt.setString(2, MaPhong);
                    pstmt.setString(3, NgayThue);
                    pstmt.setString(4, NgayHetHanThue);
                    pstmt.setString(6, MaThue);
                    pstmt.executeUpdate();
                }
            } else if ("delete".equals(action)) {
                String deleteQuery = "DELETE FROM ThuePhong WHERE MaThue = ?";
                try (PreparedStatement pstmt = connection.prepareStatement(deleteQuery)) {
                    pstmt.setString(1, MaThue);
                    pstmt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        doGet(request, response);
    }
}
