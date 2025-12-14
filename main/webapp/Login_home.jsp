<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
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
    <title>Trang người dùng</title>
    <link rel="icon" type="image/jpg" href="logo.jpg">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }

        /* MENU NGANG */
        .navbar {
            background-color: #004aad;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 10px;
        }

        .navbar a {
		    color: white;
		    text-decoration: none;
		    padding: 14px 16px;
		    display: block;
		    font-weight: bold;
		}
		
		.dropdown .dropbtn {
		    background-color: #004aad;
		    color: white;
		    border: none;
		    font-weight: bold;
		    padding: 14px 16px;
		    cursor: pointer;
		}
		
		.dropdown .dropbtn:hover {
		    background-color: #013f93;
		}


        .navbar a:hover, .dropdown:hover .dropbtn {
            background-color: #013f93;
        }

        .dropdown {
            position: relative;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #005ed6;
            top: 50px;
            min-width: 200px;
            z-index: 1;
        }

        .dropdown-content a {
		    padding: 12px 16px;
		    color: white;
		    background-color: #004aad;
		    display: block;
		    text-decoration: none;
		}
		
		.dropdown-content a:hover {
		    background-color: #013f93;
		}

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .navbar-left, .navbar-right {
            display: flex;
            align-items: center;
        }

        .container {
            padding: 30px 20px;
            text-align: center;
        }

        .tips-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 20px;
        }

        .tip-card {
            background-color: white;
            width: 300px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            overflow: hidden;
            text-align: left;
        }

        .tip-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .tip-card-content {
            padding: 15px;
        }

        .tip-card-content h4 {
            margin: 0 0 10px;
            font-size: 16px;
        }

        .tip-card-content a.cat-info-el {
            display: inline-block;
            margin-top: 8px;
            color: #004aad;
            font-weight: bold;
            text-decoration: none;
        }

        .tip-card-content a.cat-info-el:hover {
            text-decoration: underline;
        }

        footer {
            background-color: #e1e1e1;
            text-align: center;
            padding: 12px;
            margin-top: 40px;
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
    </style>
</head>
<body>

<!-- MENU NGANG -->
<div class="navbar">
    <div class="navbar-left">
        <a href="#">TRANG CHỦ</a>
        <div class="dropdown">
            <button class="dropbtn">CHỨC NĂNG</button>
            <div class="dropdown-content">
                <a href="xemPhong.jsp">Xem phòng trọ</a>
                <a href="xemHoaDon.jsp">Xem hóa đơn phòng</a>
                <a href="xemHoaDonDV.jsp">Xem hóa đơn dịch vụ</a>
            </div>
        </div>
    </div>

    <div class="navbar-right">
        <a href="#">Xin chào: <%= user %></a>
        <a href="xemPhong.jsp">Xem phòng trọ</a>
        <a href="xemHoaDon.jsp">Xem hóa đơn phòng</a>
        <a href="xemHoaDonDV.jsp">Xem hóa đơn dịch vụ</a>
        <a href="HOME.jsp" class="logout-btn">Đăng xuất</a>
    </div>
</div>

<!-- NỘI DUNG CHÍNH -->
<div class="container">
    <h2>Chào người thuê: <%= user %></h2>
    <p>Vui lòng chọn chức năng từ thanh menu phía trên để bắt đầu.</p>
</div>

<!-- MẸO PHÒNG TRỌ -->
<div class="tips-container">

    <div class="tip-card">
        <a href="pccc.jsp">
            <img src="pccc.jpg" alt="phong chay chua chay">
        </a>
        <div class="tip-card-content">
            <h4>Phòng cháy hơn chữa cháy – bảo vệ chính bạn và những người xung quanh từ những thói quen nhỏ nhất trong phòng trọ!</h4>
            <a class="cat-info-el" href="pccc.jsp">Mẹo phòng trọ</a>
        </div>
    </div>

    <div class="tip-card">
        <a href="thongcong.jsp">
            <img src="thong%20cong.jpg" alt="thông cống">
        </a>
        <div class="tip-card-content">
            <h4>4 cách đơn giản giúp phòng trọ không bị nghẹt cống hiệu quả tại nhà!</h4>
            <a class="cat-info-el" href="thongcong.jsp">Mẹo phòng trọ</a>
        </div>
    </div>

</div>

<!-- FOOTER -->
<footer>
    © 2025 Quản Lý Phòng Trọ. All rights reserved.
</footer>

</body>
</html>
