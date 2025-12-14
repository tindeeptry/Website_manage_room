<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String dbURL = "jdbc:mysql://localhost:3306/QuanLyPhongTro";
    String username = "root";
    String password = "Tien0610";

    String maHoaDonDV = request.getParameter("MaHDDV");

    String maHoaDon= "", loaiDichVu = "", soChuSo = "", thanhTien = "",thoiGianThanhToan = "", trangThaiThanhToan = "";

    try (Connection conn = DriverManager.getConnection(dbURL, username, password);
         PreparedStatement stmt = conn.prepareStatement("SELECT * FROM HoaDonDichVu WHERE MaHDDV = ?")) {

        stmt.setString(1, maHoaDonDV);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {                
                maHoaDon = rs.getString("MaHoaDon");
                loaiDichVu = rs.getString("LoaiDichVu");
                soChuSo = rs.getString("SoChuSo");
                thanhTien = rs.getString("ThanhTien");
                thoiGianThanhToan = rs.getString("ThoiGianThanhToan");
                trangThaiThanhToan = rs.getString("TrangThaiThanhToan");
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
    <title>Chỉnh sửa Hóa Đơn Dịch Vụ</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f2f2f2; }
        .container {
            width: 600px;
            margin: 40px auto;
            background-color: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 { text-align: center; color: #004aad; }
        .form-group { margin-bottom: 15px; }
        label { font-weight: bold; display: block; margin-bottom: 6px; }
        input, select {
            width: 100%;
            padding: 8px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
        }
        button:hover { background-color: #218838; }
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
	    window.onload = function () {
	        tinhThanhTien();
	    };
    </script>
</head>
<body>

<div class="container">
    <h2>✏️ Chỉnh sửa Hóa Đơn Dịch Vụ</h2>

    <form action="HoaDonDVServlet" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="MaHDDV" value="<%= maHoaDonDV %>">

        <div class="form-group">
            <label for="MaHoaDon">Mã Hợp đồng:</label>
            <input type="text" id="MaHoaDon" name="MaHoaDon" value="<%= maHoaDon %>" required>
        </div>

        <div class="form-group">
            <label for="LoaiDichVu">Loại Dịch Vụ:</label>
            <select name="LoaiDichVu" id="loaiDichVu" onchange="tinhThanhTien()" required>
                <option value="Điện" <%= "Điện".equals(loaiDichVu) ? "selected" : "" %>>Điện</option>
                <option value="Nước" <%= "Nước".equals(loaiDichVu) ? "selected" : "" %>>Nước</option>
            </select>
        </div>

        <div class="form-group">
            <label for="SoChuSo">Số chữ số:</label>
            <input type="number" id="soChuSo" name="SoChuSo" value="<%= soChuSo %>" oninput="tinhThanhTien()" required>
        </div>

        <div class="form-group">
            <label for="ThanhTien">Thành tiền:</label>
            <input type="text" id="thanhTien" name="ThanhTien" value="<%= thanhTien %>" readonly>
        </div>
		
		<div class="form-group">
            <label for="ThoiGianThanhToan">Thời Gian Thanh Toán:</label>
            <input type="date" id="ThoiGianThanhToan" name="ThoiGianThanhToan" value="<%= thoiGianThanhToan %>" required>
        </div>
		
        <div class="form-group">
            <label for="TrangThaiThanhToan">Trạng thái thanh toán:</label>
            <select name="TrangThaiThanhToan" id="TrangThaiThanhToan" required>
                <option value="Chưa Thanh Toán" <%= "Chưa Thanh Toán".equals(trangThaiThanhToan) ? "selected" : "" %>>Chưa Thanh Toán</option>
                <option value="Đã Thanh Toán" <%= "Đã Thanh Toán".equals(trangThaiThanhToan) ? "selected" : "" %>>Đã Thanh Toán</option>
            </select>
        </div>

        <button type="submit">Cập nhật</button>
    </form>
</div>

</body>
</html>
