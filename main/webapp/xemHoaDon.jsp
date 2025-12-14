<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hóa đơn phòng trọ</title>
    <link rel="icon" type="image/jpg" href="logo.jpg">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
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
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            margin-right: 20px;
        }

        .navbar a:hover {
            text-decoration: underline;
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

        h2 {
            color: #003366;
            text-align: center;
            margin-top: 20px;
        }

        form {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        form input[type="text"] {
            padding: 8px;
            margin-right: 10px;
            font-size: 16px;
        }

        form input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 8px 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        form input[type="submit"]:hover {
            background-color: #0056b3;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        td form {
            display: inline;
        }

        td input[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 6px 12px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        td input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <div class="navbar">
        <a href="Login_home.jsp">🏠 Hệ thống Quản Lý Phòng Trọ</a>
        <a href="HOME.jsp" class="logout-btn">Đăng xuất</a>
    </div>

    <h2>Danh Sách Hóa Đơn Phòng Trọ</h2>

    <form method="get">
        Tìm theo mã hợp đồng: <input type="text" name="MaThue" value="<%= request.getParameter("MaThue") == null ? "" : request.getParameter("MaThue") %>">
        <input type="submit" value="Tìm">
    </form>

    <table>
        <tr>
            <th>Mã Hóa Đơn</th>
            <th>Mã Hợp đồng</th>
            <th>Số Tiền</th>
            <th>Thời Gian Thanh Toán</th>
            <th>Mã CCCD Người Thuê</th>
            <th>Thanh toán</th>
        </tr>

        <%
            String maThue = request.getParameter("MaThue");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/QuanLyPhongTro", "root", "Tien0610");

                String sql = "SELECT * FROM HoaDon";
                if (maThue != null && !maThue.trim().isEmpty()) {
                    sql += " WHERE MaThue = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, maThue);
                } else {
                    pstmt = conn.prepareStatement(sql);
                }

                rs = pstmt.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("MaHoaDon") %></td>
            <td><%= rs.getString("MaThue") %></td>
            <td><%= rs.getString("SoTien") %></td>
            <td><%= rs.getDate("ThoiGianThanhToan") %></td>
            <td><%= rs.getString("MaCCCD") %></td>
            <td>
                <form action="thanhToan.jsp" method="get">
                    <input type="hidden" name="maHoaDon" value="<%= rs.getString("MaHoaDon") %>">
                    <input type="hidden" name="soTien" value="<%= rs.getString("SoTien").replace(".", "") %>">
                    <input type="submit" value="Thanh Toán">
                </form>
            </td>
        </tr>
        <%  } 
                } catch (Exception e) { 
                	out.println("Lỗi: " + e.getMessage()); 
                } finally { 
                	try { 
                		if (rs != null) rs.close(); 
                		if (pstmt != null) pstmt.close(); 
                		if (conn != null) conn.close(); 
                		} catch (Exception e) {} 
             } %>
    </table>

</body>
</html>
