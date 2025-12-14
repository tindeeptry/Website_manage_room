<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.room" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Phòng Trọ</title>
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
            padding: 30px;
        }

        h2 {
            color: #003366;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #e6f2ff;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        form {
            display: inline;
        }

        button, input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 6px 12px;
            margin: 2px;
            cursor: pointer;
            border-radius: 4px;
            font-size: 14px;
        }

        button:hover, input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .add-form {
            margin-top: 30px;
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
        <h2>📋 Danh Sách Phòng Trọ</h2>

        <table>
            <tr>
                <th>Mã Phòng</th>
                <th>Số Phòng</th>
                <th>Diện Tích (m²)</th>
                <th>Giá Thuê (VND)</th>
                <th>Trạng Thái</th>
                <th>Hành Động</th>
            </tr>
            <%
                List<room> danhSachPhong = (List<room>) request.getAttribute("danhSachPhong");
                if (danhSachPhong != null) {
                    for (room p : danhSachPhong) {
                    	
            %>
            <tr>
                <td><%= p.getMaPhong() %></td>
                <td><%= p.getSoPhong() %></td>
                <td><%= p.getDienTich() %></td>
                <td><%= p.getGiaThue() %></td>
                <td><%= p.getTrangThai() %></td>
                <td>
                    <form action="EditRoom.jsp" method="get">
                        <input type="hidden" name="MaPhong" value="<%= p.getMaPhong() %>">
                        <input type="submit" value="Sửa">
                    </form>
                    <form action="phong" method="post" onsubmit="return confirm('Bạn có chắc muốn xóa phòng này không?');">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="MaPhong" value="<%= p.getMaPhong() %>">
                        <button type="submit">Xóa</button>
                    </form>
                </td>
            </tr>
            <%   } }int count = danhSachPhong.size() + 1;
            String mPhong = "00" + Integer.toString(count);
                 %>
        </table>
		
        <div class="add-form">
            <h2>➕ Thêm Mới Phòng</h2>
            <form action="InsertRoom.jsp" method="get">
            	<input type="hidden" name="MaPhong" value="<%= mPhong %>">
                <input type="submit" value="Thêm phòng">
                
            </form>
        </div>
        
    </div>
</body>
</html>
