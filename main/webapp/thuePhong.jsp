<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.ThuePhong" %>
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
    <title>Quản lý hợp đồng</title>
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
    <h2>👥 Danh Sách Hợp Đồng</h2>

    <table>
        <tr>
            <th>Mã Hợp Đồng</th>
            <th>Mã Căn Cước Công Dân</th>
            <th>Mã Phòng</th>
            <th>Ngày Thuê</th>
            <th>Ngày Hết Hạn Thuê</th>
            <th>Hành động</th>
        </tr>
        <%
            List<ThuePhong> dS = (List<ThuePhong>) request.getAttribute("dS");
            if (dS != null) {
                for (ThuePhong tp : dS) {
        %>
        <tr>
            <td><%= tp.getMaThue() %></td>
            <td><%= tp.getMaCCCD() %></td>
            <td><%= tp.getMaPhong() %></td>
            <td><%= tp.getNgayThue() %></td>
            <td><%= tp.getNgayHetHanThue() %></td>
            <td>
                <form action="EditTP.jsp" method="post">
                    <input type="hidden" name="action" value="editForm">
                    <input type="hidden" name="MaThue" value="<%= tp.getMaThue() %>">
                    <input type="submit" value="Sửa">
                </form>
                <form action="/QLY_PHONG_TRO/ThuePhongServlet" method="post" onsubmit="return confirm('Bạn có chắc chắn muốn xóa tài khoản này?');">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="MaThue" value="<%= tp.getMaThue() %>">
                    <button type="submit">Xóa</button>
                </form>
            </td>
        </tr>
        <% }} %>
    </table>
    
    <div class="add-form">
            <h2>➕ Thêm Mới Hợp đồng</h2>
            <form action="InsertThuePhong.jsp" method="get">
                <input type="submit" value="Thêm Thuê Phòng">
            </form>
        </div>
</div>

</body>
</html>
