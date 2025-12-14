<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.HoaDon" %>
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
    <title>Quản Lý Hóa Đơn</title>
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
        <h2>📄 Danh Sách Hóa Đơn</h2>

        <table>
            <tr>
                <th>Mã Hóa Đơn</th>
                <th>Mã Hợp đồng</th>
                <th>Số Tiền (VND)</th>
                <th>Thời Gian Thanh Toán</th>
                <th>CCCD Người Thuê</th>
                <th>Trạng Thái Thanh Toán</th>
                <th>Hành Động</th>
            </tr>
            <% 
                List<HoaDon> danhSachHoaDon = (List<HoaDon>) request.getAttribute("danhSachHoaDon");
                if (danhSachHoaDon != null) {
                    for (HoaDon hd : danhSachHoaDon) { 
            %>
            <tr>
                <td><%= hd.getMaHoaDon() %></td>
                <td><%= hd.getMaThue() %></td>
                <td><%= hd.getSoTien() %></td>
                <td><%= hd.getThoiGianThanhToan() %></td>
                <td><%= hd.getMaCCCD() %></td>
                <td><%= hd.getTrangThaiThanhToan() %></td>
                <td>
                    <form action="EditHoaDon.jsp" method="get">
                        <input type="hidden" name="MaHoaDon" value="<%= hd.getMaHoaDon() %>">
                        <input type="submit" value="Sửa">
                    </form>
                    <form action="/QLY_PHONG_TRO/HoaDonServlet" method="post" onsubmit="return confirm('Bạn có chắc muốn xóa hóa đơn này không?');">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="MaHoaDon" value="<%= hd.getMaHoaDon() %>">
                        <button type="submit">Xóa</button>
                    </form>
                    <form action="HoaDonDVServlet" method="get">
                        <input type="hidden" name="action" value="xem">
                        <input type="hidden" name="MaHoaDon" value="<%= hd.getMaHoaDon() %>">
                        <button type="submit">Xem</button>
                    </form>
                </td>
            </tr>
            <% 
                    } 
                } 
            %>
        </table>

        <div class="add-form">
            <h2>➕ Thêm Mới Hóa Đơn</h2>
            <form action="InsertHoaDon.jsp" method="get">
                <input type="submit" value="Thêm hóa đơn">
            </form>
        </div>
    </div>

</body>
</html>
