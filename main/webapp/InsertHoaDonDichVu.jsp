<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Thêm Hóa Đơn Dịch Vụ</title>
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

        input[type="button"],
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="button"]:hover,
        input[type="submit"]:hover {
            background-color: #218838;
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

    <script>
        function tinhThanhTien() {
            const loai = document.getElementById("loaiDichVu").value;
            const soChuSo = parseInt(document.getElementById("soChuSo").value);
            let thanhTien = 0;

            if (loai === "Điện") {
                let bac = [50, 50, 100, 100, 100];
                let gia = [1893, 1956, 2271, 2860, 3197, 3302];
                let soConLai = soChuSo;
                for (let i = 0; i < bac.length && soConLai > 0; i++) {
                    let suDung = Math.min(soConLai, bac[i]);
                    thanhTien += suDung * gia[i];
                    soConLai -= suDung;
                }
                if (soConLai > 0) {
                    thanhTien += soConLai * gia[5];
                }
                thanhTien *= 1.08;
            } else if (loai === "Nước") {
                let bac = [10, 20];
                let gia = [4300, 5200, 6485];
                let soConLai = soChuSo;
                for (let i = 0; i < bac.length && soConLai > 0; i++) {
                    let suDung = Math.min(soConLai, bac[i]);
                    thanhTien += suDung * gia[i];
                    soConLai -= suDung;
                }
                if (soConLai > 0) {
                    thanhTien += soConLai * gia[2];
                }
                thanhTien *= 1.05;
            }

            document.getElementById("thanhTien").value = thanhTien.toFixed(0);
        }
    </script>
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
    <h2>🧾 Thêm Hóa Đơn Dịch Vụ</h2>
    <form action="/QLY_PHONG_TRO/HoaDonDVServlet" method="post">
        <table>
            <tr>
                <td align="right">Mã Hóa Đơn DV:</td>
                <td><input type="text" name="MaHDDV" required></td>
            </tr>
            <tr>
                <td align="right">Mã CCCD Người Thuê:</td>
                <td><input type="text" name="MaCCCD" required></td>
            </tr>
            <tr>
                <td align="right">Mã Phòng:</td>
                <td><input type="text" name="MaPhong" required></td>
            </tr>
            <tr>
                <td align="right">Loại Dịch Vụ:</td>
                <td>
                    <select id="loaiDichVu" name="LoaiDichVu">
                        <option value="Điện">Tiền điện</option>
                        <option value="Nước">Tiền nước</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">Số Chữ Số:</td>
                <td><input type="number" id="soChuSo" name="SoChuSo" min="0" required></td>
            </tr>
            <tr>
                <td align="right">Thành Tiền:</td>
                <td><input type="text" id="thanhTien" name="ThanhTien" readonly></td>
            </tr>
            <tr>
                <td align="right">Trạng Thái Thanh Toán:</td>
                <td>
                    <select name="TrangThaiThanhToan">
                        <option value="Chưa thanh toán">Chưa thanh toán</option>
                        <option value="Đã thanh toán">Đã thanh toán</option>
                    </select>
                </td>
            </tr>
        </table>
        <input type="hidden" name="action" value="add">
        <input type="button" value="Tính tiền" onclick="tinhThanhTien()">
        <input type="submit" value="Lưu hóa đơn">
    </form>
    <a href="/QLY_PHONG_TRO/HoaDonDVServlet" class="back-link">← Quay lại danh sách hóa đơn</a>
</div>

</body>
</html>
