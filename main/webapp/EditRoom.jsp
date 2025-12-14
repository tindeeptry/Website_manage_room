<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String dbURL = "jdbc:mysql://localhost:3306/QuanLyPhongTro";
    String username = "root";
    String password = "Tien0610";

    String MaPhong = request.getParameter("MaPhong");

    String soPhong = "", trangThai = "";
    String dienTich = "", giaThue = "", maCC = "";

    try (Connection conn = DriverManager.getConnection(dbURL, username, password);
         PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Phong WHERE MaPhong = ?")) {
        stmt.setString(1, MaPhong);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                soPhong = rs.getString("SoPhong");
                dienTich = rs.getString("DienTich");
                giaThue = rs.getString("GiaThue");
                trangThai = rs.getString("TrangThai");
                maCC = rs.getString("MaCC");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa Phòng</title>
    <link rel="icon" type="image/jpg" href="logo.jpg">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #004aad;
            padding: 12px 20px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .nav-left a {
            color: white;
            margin-right: 20px;
            text-decoration: none;
            font-weight: bold;
        }

        .nav-left a:hover {
            text-decoration: underline;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .nav-right span {
            font-size: 14px;
        }

        .logout-btn {
            background-color: #ff4d4d;
            padding: 6px 10px;
            border-radius: 4px;
            text-decoration: none;
            color: white;
            font-size: 14px;
        }

        .logout-btn:hover {
            background-color: #cc0000;
        }

        .container {
            max-width: 600px;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #003366;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="navbar">
    <div class="nav-left">
        <a href="Home_login.jsp">🏠 Trang chủ</a>
    </div>
    <div class="nav-right">
        <span>👤 Xin chào: <strong><%= user %></strong></span>
        <a href="HOME.jsp" class="logout-btn">Đăng xuất</a>
    </div>
</div>

<div class="container">
    <h2>✏️ Chỉnh sửa Phòng</h2>

    <form action="phong" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="MaPhong" value="<%= MaPhong %>">

        <div class="form-group">
            <label for="SoPhong">Số phòng:</label>
            <input type="text" id="SoPhong" name="SoPhong" value="<%= soPhong %>" required>
        </div>

        <div class="form-group">
            <label for="DienTich">Diện tích (m²):</label>
            <input type="text" id="DienTich" name="DienTich" value="<%= dienTich %>" step="0.1" required>
        </div>

        <div class="form-group">
            <label for="GiaThue">Giá thuê (VND):</label>
            <input type="text" id="GiaThue" name="GiaThue" value="<%= giaThue %>" required>
        </div>

        <div class="form-group">
		    <label for="TrangThai">Trạng thái:</label>
		    <select id="TrangThai" name="TrangThai" required>
		        <option value="Trống" <%= "Trống".equals(trangThai) ? "selected" : "" %>>Trống</option>
		        <option value="Đã thuê" <%= "Đã thuê".equals(trangThai) ? "selected" : "" %>>Đã thuê</option>
		    </select>
		</div>


        <button type="submit">Cập nhật</button>
    </form>
</div>

</body>
</html>
