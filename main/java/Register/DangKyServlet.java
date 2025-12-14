package Register;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DangKyServlet")
public class DangKyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
        String tenDangNhap = request.getParameter("tenDangNhap");
        String matKhau = request.getParameter("matKhau");
        String repassword = request.getParameter("repassword");
        
        String nhapLaiMatKhau = request.getParameter("repassword");

        if (!matKhau.equals(nhapLaiMatKhau)) {
            response.getWriter().println("Mật khẩu nhập lại không khớp.");
            return;
        }

        try {
            // Kết nối MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/QuanLyPhongTro", "root", "Tien0610");

            // Thêm tài khoản mới (mặc định là nguoithue)
            String sql = "INSERT INTO TaiKhoan (TenDangNhap, MatKhau) VALUES (?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, tenDangNhap);
            ps.setString(2, matKhau); // có thể mã hóa mật khẩu nếu muốn

            int row = ps.executeUpdate();
            if (row > 0) {
                response.sendRedirect("Login_home.jsp");
            } else {
                response.getWriter().println("Đăng ký thất bại.");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi: " + e.getMessage());
        }
    }
}
