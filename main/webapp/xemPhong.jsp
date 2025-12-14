<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách phòng trọ</title>
    <link rel="icon" type="image/jpg" href="logo.jpg">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-image: url('PhongTro.jpg');
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #004aad;
            padding: 14px 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .nav-left a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .logout-btn {
            background-color: #ff4d4d;
            padding: 6px 12px;
            border: none;
            border-radius: 6px;
            color: white;
            text-decoration: none;
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            color: #003366;
            margin-bottom: 24px;
        }

        .card-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        .room-card {
            background-color: #f9f9f9;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            padding: 16px;
            transition: transform 0.2s;
        }

        .room-card:hover {
            transform: scale(1.02);
        }

        .room-card h3 {
            margin-top: 0;
            color: #004aad;
        }

        .room-info {
            margin-top: 10px;
            line-height: 1.6;
        }

        .room-info strong {
            display: inline-block;
            width: 120px;
            color: #333;
        }

        .room-image {
            width: 100%;
            height: 160px;
            border-radius: 8px;
            margin-bottom: 12px;
            object-fit: cover;
        }
    </style>
</head>
<body>
<div class="navbar">
    <div class="nav-left">
        <a href="Login_home.jsp">🏠 Trang chủ</a>
    </div>
    <div class="nav-right">
        <span>👤 Xin chào: <strong><%= user %></strong></span>
        <a href="HOME.jsp" class="logout-btn">Đăng xuất</a>
    </div>
</div>

<div class="container">
    <h2>📋 Danh Sách Phòng Trọ</h2>
    <div class="card-list">
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/QuanLyPhongTro", "root", "Tien0610");
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM Phong");
                while (rs.next()) {
                    String soPhong = rs.getString("SoPhong");
        %>
        <div class="room-card">
        	<%
				if ("101".equals(soPhong)) {
			%>
            <img src="101.jpg" alt="Ảnh phòng <%= soPhong %>" class="room-image"
                 onerror="this.onerror=null; this.src='images/default_room.jpg';">
            <h3>Phòng <%= soPhong %></h3>
            <%
				}
			%>
			<%
				if ("102".equals(soPhong)) {
			%>
            <img src="102.jpg" alt="Ảnh phòng <%= soPhong %>" class="room-image"
                 onerror="this.onerror=null; this.src='images/default_room.jpg';">
            <h3>Phòng <%= soPhong %></h3>
            <%
				}
			%>
			<%
				if ("103".equals(soPhong)) {
			%>
            <img src="103.jpg" alt="Ảnh phòng <%= soPhong %>" class="room-image"
                 onerror="this.onerror=null; this.src='images/default_room.jpg';">
            <h3>Phòng <%= soPhong %></h3>
            <%
				}
			%>
			<%
				if ("104".equals(soPhong)) {
			%>
            <img src="104.jpg" alt="Ảnh phòng <%= soPhong %>" class="room-image"
                 onerror="this.onerror=null; this.src='images/default_room.jpg';">
            <h3>Phòng <%= soPhong %></h3>
            <%
				}
			%>
			<%
				if ("105".equals(soPhong)) {
			%>
            <img src="105.jpg" alt="Ảnh phòng <%= soPhong %>" class="room-image"
                 onerror="this.onerror=null; this.src='images/default_room.jpg';">
            <h3>Phòng <%= soPhong %></h3>
            <%
				}
			%>
			<%
				if ("106".equals(soPhong)) {
			%>
            <img src="106.jpg" alt="Ảnh phòng <%= soPhong %>" class="room-image"
                 onerror="this.onerror=null; this.src='images/default_room.jpg';">
            <h3>Phòng <%= soPhong %></h3>
            <%
				}
			%>
			<%
				if ("107".equals(soPhong)) {
			%>
            <img src="107.jpg" alt="Ảnh phòng <%= soPhong %>" class="room-image"
                 onerror="this.onerror=null; this.src='images/default_room.jpg';">
            <h3>Phòng <%= soPhong %></h3>
            <%
				}
			%>
			<%
				if ("108".equals(soPhong)) {
			%>
            <img src="108.jpg" alt="Ảnh phòng <%= soPhong %>" class="room-image"
                 onerror="this.onerror=null; this.src='images/default_room.jpg';">
            <h3>Phòng <%= soPhong %></h3>
            <%
				}
			%>
			<%
				if ("109".equals(soPhong)) {
			%>
            <img src="109.jpg" alt="Ảnh phòng <%= soPhong %>" class="room-image"
                 onerror="this.onerror=null; this.src='images/default_room.jpg';">
            <h3>Phòng <%= soPhong %></h3>
            <%
				}
			%>
			<%
				if ("110".equals(soPhong)) {
			%>
            <img src="110.jpg" alt="Ảnh phòng <%= soPhong %>" class="room-image"
                 onerror="this.onerror=null; this.src='images/default_room.jpg';">
            <h3>Phòng <%= soPhong %></h3>
            <%
				}
			%>
            <div class="room-info">
                <p><strong>Mã phòng:</strong> <%= rs.getString("MaPhong") %></p>
                <p><strong>Diện tích:</strong> <%= rs.getString("DienTich") %></p>
                <p><strong>Giá thuê:</strong> <%= rs.getString("GiaThue") %> VND</p>
                <p><strong>Trạng thái:</strong> <%= rs.getString("TrangThai") %></p>
            </div>
        </div>
        <% 
                } 
            } catch (Exception e) { 
                out.println("Lỗi: " + e.getMessage()); 
            } finally { 
                try { if (rs != null) rs.close(); if (stmt != null) stmt.close(); if (conn != null) conn.close(); } catch (Exception e) {} 
            } 
        %>
    </div>
</div>
</body>
</html>
