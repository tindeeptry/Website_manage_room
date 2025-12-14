<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.NguoiThue" %>
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
    <title>Quản Lý Người Thuê</title>
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
            padding: 15px;
            color: white;
        }

        .navbar a {
            color: white;
            margin-right: 20px;
            text-decoration: none;
            font-weight: bold;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .navbar-right {
            float: right;
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
        <a href="Home_login.jsp">🏠 Trang chủ</a>
        <div class="navbar-right">
            <a href="#">Xin chào: <%= user %></a>
            <a href="HOME.jsp" class="logout-btn">Đăng xuất</a>
        </div>
    </div>

    <div class="container">
        <h2>📋 Danh Sách Người Thuê</h2>

        <table>
            <tr>
                <th>CCCD</th>
                <th>Tên Người Thuê</th>
                <th>Số Điện Thoại</th>
                <th>Email</th>
                <th>Hành Động</th>
            </tr>
            <%
                List<NguoiThue> danhSachNguoiThue = (List<NguoiThue>) request.getAttribute("danhSach");
                if (danhSachNguoiThue != null) {
                    for (NguoiThue nt : danhSachNguoiThue) {
            %>
            <tr>
                <td><%= nt.getMaCCCD() %></td>
                <td><%= nt.getTenNguoiThue() %></td>
                <td><%= nt.getSdt() %></td>
                <td><%= nt.getEmail() %></td>
                <td>
                    <form action="EditNguoiThue.jsp" method="post">
                        <input type="hidden" name="MaCCCD" value="<%= nt.getMaCCCD() %>">
                        <input type="submit" value="Sửa">
                    </form>
                    <form action="NguoiThueServlet" method="post" onsubmit="return confirm('Bạn có chắc muốn xóa người thuê này không?');">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="MaCCCD" value="<%= nt.getMaCCCD() %>">
                        <button type="submit">Xóa</button>
                    </form>
                    <form action="HoaDonServlet" method="post">
                        <input type="hidden" name="action" value="Xem">
                        <input type="hidden" name="MaCCCD" value="<%= nt.getMaCCCD() %>">
                        <button type="submit">Xem hóa đơn</button>
                    </form>
                </td>
            </tr>
            <% } } %>
        </table>

        <div class="add-form">
            <h2>➕ Thêm Mới Người Thuê</h2>
            <form action="InsertNguoiThue.jsp" method="get">
                <input type="submit" value="Thêm người thuê">
            </form>
        </div>
    </div>
</body>
</html>
