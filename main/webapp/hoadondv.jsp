<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="DAO.HoadonDV" %>
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
    <title>Quản Lý Hóa Đơn Dịch Vụ</title>
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
            margin-top: 20px;
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

	<%String mHD = request.getParameter("MaHoaDon"); %>
    <div class="container">
        <h2>🧾 Danh Sách Hóa Đơn Dịch Vụ <% if( mHD == null) { %>
        	<%= " " %>
        <%} else {%>
        	<%= "Phòng " + mHD %>
        <%}
        %></h2>
        <table>
            <tr>
                <th>Mã HĐDV</th>
                <th>Mã Hóa đơn</th>
                <th>Loại Dịch Vụ</th>
                <th>Số Chữ Số</th>
                <th>Thành Tiền (VND)</th>
                <th>Thời gian thanh toán</th>
                <th>Trạng Thái Thanh Toán</th>
                <th>Hành Động</th>
            </tr>
            <%
                List<HoadonDV> danhSachHoaDonDV = (List<HoadonDV>) request.getAttribute("danhSachHoaDonDV");
                if (danhSachHoaDonDV != null) {
                    for (HoadonDV hddv : danhSachHoaDonDV) {
            %>
            <tr>
                <td><%= hddv.getMaHDDV() %></td>
                <td><%= hddv.getMaHoaDon() %></td>
                <td><%= hddv.getLoaiDichVu() %></td>
                <td><%= hddv.getSoChuSo() %></td>
                <td><%= hddv.getThanhTien() %></td>
                <td><%= hddv.getThoiGianThanhToan() %></td>
                <td><%= hddv.getTrangThaiThanhToan() %></td>
                <td>
                    <form action="EditHoaDonDichVu.jsp" method="get">
                        <input type="hidden" name="MaHDDV" value="<%= hddv.getMaHDDV() %>">
                        <input type="submit" value="Sửa">
                    </form>
                    <form action="HoaDonDVServlet" method="post" onsubmit="return confirm('Bạn có chắc muốn xóa hóa đơn này không?');">
					    <input type="hidden" name="action" value="delete">
					    <input type="hidden" name="MaHDDV" value="<%= hddv.getMaHDDV() %>">
					    <input type="submit" value="Xóa">
					</form>

                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>

        <div class="add-form">
            <h2>➕ Thêm mới Hóa Đơn Dịch Vụ</h2>
            <form action="DienNuoc.jsp" method="get">
                <input type="submit" value="Thêm Hóa Đơn Dịch Vụ">
            </form>
        </div>
    </div>
</body>
</html>
