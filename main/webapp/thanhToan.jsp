<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.net.URLEncoder" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán hóa đơn</title>
    <link rel="icon" type="image/jpg" href="logo.jpg">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .qr-container {
            text-align: center;
            margin-top: 30px;
        }

        .qr-container img {
            width: 300px;
            height: 300px;
            border-radius: 8px;
        }

        .payment-info {
            margin-top: 20px;
            font-size: 18px;
            color: #333;
        }

        .btn-submit {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 18px;
            cursor: pointer;
            margin-top: 30px;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        /* Modal Style */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            overflow: auto;
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border-radius: 8px;
            width: 400px;
            text-align: center;
        }

        .modal-header {
            font-size: 24px;
            margin-bottom: 20px;
            color: #28a745;
        }

        .modal-footer {
            margin-top: 20px;
        }

        .close-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .close-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>

<%
    String maHD = request.getParameter("maHoaDon");
    String soTien = request.getParameter("soTien");

    // Thông tin người nhận
    String stk = "123456"; // STK BIDV của bạn
    String bankCode = "BIDV"; // Mã ngân hàng
    String tenNguoiNhan = "LE TRUNG TIEN"; // (không bắt buộc)

    // Tạo link QR từ VietQR
    String noiDung = "Thanh toan hoa don " + maHD;
    String qrLink = "https://img.vietqr.io/image/" + bankCode + "-" + stk + "-compact2.jpg"
                  + "?amount=" + soTien
                  + "&addInfo=" + URLEncoder.encode(noiDung, "UTF-8");
%>

<div class="container">
    <h2>Quét mã QR để thanh toán hóa đơn <%= maHD %></h2>
    <div class="payment-info">
        <p>Số tiền: <%= soTien %> VND</p>
    </div>

    <div class="qr-container">
        <img src="<%= qrLink %>" alt="QR Thanh toán">
    </div>

    <form id="paymentForm">
        <button type="button" class="btn-submit" onclick="showPaymentComplete()">Tôi đã thanh toán</button>
    </form>
</div>

<!-- Modal Thanh toán thành công -->
<div id="paymentModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            Thanh toán hoàn tất!
        </div>
        <p>Cảm ơn bạn đã thanh toán hóa đơn. Bạn sẽ được quay lại trang chính ngay.</p>
        <div class="modal-footer">
            <button class="close-btn" onclick="redirectToHomePage()">Quay lại trang chính</button>
        </div>
    </div>
</div>

<script>
    // Hiển thị modal thanh toán hoàn tất
    function showPaymentComplete() {
        document.getElementById("paymentModal").style.display = "block";
    }

    // Đóng modal và quay về trang chính
    function redirectToHomePage() {
        // Ẩn modal
        document.getElementById("paymentModal").style.display = "none";
        
        // Quay lại trang chính sau 2 giây
        setTimeout(function() {
            window.location.href = "Login_home.jsp"; // Thay đổi theo đường dẫn trang chính của bạn
        }, 2000);
    }
</script>

</body>
</html>
