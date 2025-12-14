package LOGIN;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/Login")

public class Login extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/QuanLyPhongTro";
    private static final String USER = "root";
    private static final String PASS = "Tien0610";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tenDangNhap = request.getParameter("username");
        String matKhau = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS)) {
                String sql = "SELECT * FROM TaiKhoan WHERE TenDangNhap = ? AND MatKhau = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, tenDangNhap);
                stmt.setString(2, matKhau);

                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    // Lưu session
                    HttpSession session = request.getSession();
                    String loaiTK = rs.getString("LoaiTaiKhoan");
                    session.setAttribute("username", tenDangNhap);
                    session.setAttribute("loaiTaiKhoan", loaiTK);

                    // Chuyển hướng tùy theo loại tài khoản
                    if ("admin".equalsIgnoreCase(loaiTK)) {
                        response.sendRedirect("Home_login.jsp");
                    } else if ("nguoithue".equalsIgnoreCase(loaiTK)) {
                        response.sendRedirect("Login_home.jsp"); // Bạn tạo trang này cho người dùng thuê
                    } else {
                        // Trường hợp loại tài khoản không xác định
                        request.setAttribute("error", "Loại tài khoản không hợp lệ.");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                        dispatcher.forward(request, response);
                    }
                } else {
                    request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng.");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward(request, response);
                }
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
