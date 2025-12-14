<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.room" %>
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
    <title>Thêm Phòng Trọ</title>
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
            max-width: 700px;
            margin: auto;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        h2 {
            color: #003366;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
            vertical-align: top;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007BFF;
        }

        .back-link:hover {
            text-decoration: underline;
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
    
	<% String count = request.getParameter("MaPhong"); %>
    <div class="container">
        <h2>➕ Thêm Phòng Trọ</h2>
        <form action="phong" method="post">
            <table>
               <tr>
                    <td align="right">Mã Phòng:</td>
                    <td><input type="text" name="MaPhong" value= "<%= count %>" readonly></td>
                </tr>               
                <tr>
                    <td align="right">Số Phòng:</td>
                    <td><input type="text" name="SoPhong" required></td>
                </tr>
                <tr>
                    <td align="right">Diện Tích (m²):</td>
                    <td><input type="text" name="DienTich" required></td>
                </tr>
                <tr>
                    <td align="right">Giá Thuê (VND):</td>
                    <td><input type="text" name="GiaThue" required></td>
                </tr>
                <tr>
                    <td align="right">Trạng Thái:</td>
                    <td>
                        <select name="TrangThai" required>
                            <option value="Trống">Trống</option>
                            <option value="Đã thuê">Đã thuê</option>
                        </select>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="action" value="add">
            <input type="submit" value="Thêm Phòng">
        </form>
        <a href="/QLY_PHONG_TRO/phong" class="back-link">← Quay lại danh sách phòng</a>
    </div>

</body>
</html>
