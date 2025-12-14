<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4 Cách Giúp Phòng Trọ Không Bị Nghẹt</title>
<link rel="icon" type="image/jpg" href="logo.jpg">
<style>
    body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        /* MENU NGANG */
        .navbar {
            background-color: #004aad;
            overflow: hidden;
        }

        .navbar a {
            float: left;
            font-weight: bold;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }

        .navbar a:hover, .dropdown:hover .dropbtn {
            background-color: #013f93;
        }

        .dropdown {
            float: left;
            overflow: hidden;
        }

        .dropdown .dropbtn {
            font-weight: bold;
            border: none;
            outline: none;
            color: white;
            padding: 14px 20px;
            background-color: inherit;
            font-family: inherit;
            margin: 0;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #005ed6;
            min-width: 200px;
            z-index: 1;
        }

        .dropdown-content a {
            float: none;
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {
            background-color: #0041a3;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }
        
        .logout-btn {
		    background-color: #ff4d4d;
		    padding: 10px 20px;
		    border-radius: 4px;
		    color: white;
		    font-size: 14px;
		    font-weight: bold;
		    text-align: center;
		    text-decoration: none;
		    transition: background-color 0.3s ease;
		}
		
		.logout-btn:hover {
		    background-color: #cc0000;
		}

        .navbar-right {
            float: right;
        }

        .container {
            padding: 30px 20px;
        }

        footer {
            background-color: #f1f1f1;
            text-align: center;
            padding: 12px;
        }

    .container {
        max-width: 800px;
        margin: 80px auto 30px;
        background-color: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 30px;
    }

    h2 {
        color: #2980b9;
        margin-top: 20px;
    }

    p {
        line-height: 1.6;
    }

    ul {
        margin-top: 10px;
        padding-left: 20px;
    }

    .centered-image {
        display: block;
        margin: 10px auto;
        max-width: 100%;
        height: auto;
        border-radius: 6px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
</style>
</head>
<body>

<!-- MENU NGANG -->
<div class="navbar">
    <a href="Login_home.jsp">TRANG CHỦ</a>

    <div class="dropdown">
        <button class="dropbtn">QUẢN LÝ</button>
        <div class="dropdown-content">
            <a href="/QLY_PHONG_TRO/phong">Phòng trọ</a>
            <a href="/QLY_PHONG_TRO/NguoiThueServlet">Người thuê</a>
            <a href="/QLY_PHONG_TRO/HoaDonServlet">Hóa đơn phòng</a>
            <a href="/QLY_PHONG_TRO/HoaDonDVServlet">Hóa đơn dịch vụ</a>
            <a href="/QLY_PHONG_TRO/TKServlet">Tài khoản</a>
        </div>
    </div>

    <div class="navbar-right">
        <a href="#">Xin chào: <%= user %></a>
        <a href="HOME.jsp" class="logout-btn">Đăng xuất</a>
    </div>
</div>

<div class="container">
    <h1>4 Cách Giúp Phòng Trọ Không Bị Nghẹt</h1>
    <p>Việc phòng trọ gặp tình trạng nghẹt cống có thể rất khó chịu và gây ra nhiều phiền toái trong sinh hoạt hàng ngày. Dưới đây là bốn phương pháp hiệu quả để giữ cho hệ thống thoát nước của bạn luôn thông thoáng.</p>
    
    <h2>1. Thông cống bằng nước sôi</h2>
    <p>Đổ nước sôi vào cống là phương pháp đơn giản giúp xử lý tắc nghẽn do dầu mỡ hoặc cặn bã thực phẩm.</p>
    <ul>
        <li>Đun sôi khoảng 1-2 lít nước.</li>
        <li>Từ từ đổ nước sôi vào cống để tránh hư hỏng ống nhựa.</li>
        <li>Lặp lại nếu cần cho đến khi thông thoát hoàn toàn.</li>
    </ul>
    <img src="nuoc%20soi.jpg" class="centered-image" alt="nuoc soi" >
    
    <h2>2. Sử dụng bột thông cống</h2>
    <p>Bột thông cống chứa hóa chất giúp phân hủy cặn bã, thích hợp với trường hợp nghẹt nặng.</p>
    <ul>
        <li>Đổ khoảng 1/2 đến 1 chén bột vào miệng cống.</li>
        <li>Chờ vài phút theo hướng dẫn.</li>
        <li>Xả lại bằng nước ấm hoặc nóng để rửa sạch.</li>
    </ul>
    <img src="botthongcong.jpg" class="centered-image" alt="bot thong cong" >
    
    <h2>3. Thông cống bằng xút (NaOH)</h2>
    <p>Xút là chất tẩy rửa mạnh, xử lý tốt các tắc nghẽn cứng đầu.</p>
    <ul>
        <li>Đeo găng tay và khẩu trang để an toàn.</li>
        <li>Hòa tan xút với nước (luôn đổ xút vào nước).</li>
        <li>Đổ hỗn hợp vào cống và chờ khoảng 30 phút trước khi xả nước nóng.</li>
    </ul>
    <img alt="xut" src="xut.jpg" class="centered-image">
    
    <h2>4. Dùng baking soda và giấm</h2>
    <p>Phương pháp tự nhiên, an toàn và thân thiện môi trường.</p>
    <ul>
        <li>Đổ 1 cốc baking soda vào miệng cống.</li>
        <li>Thêm 1 cốc giấm để tạo phản ứng sủi bọt.</li>
        <li>Để trong 30 phút, sau đó xả lại bằng nước nóng.</li>
    </ul>
    <img alt="baking soda" src="baking.jpg" class="centered-image">
</div>

</body>
</html>
