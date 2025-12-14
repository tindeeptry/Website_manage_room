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
    <title>Trang quản trị</title>
    <link rel="icon" type="image/jpg" href="logo.jpg">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        /* MENU NGANG */
        .navbar {
            background-color: #004aad;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        .navbar a {
            font-weight: bold;
            color: white;
            text-align: center;
            padding: 10px 20px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #013f93;
        }

        .navbar .dropdown {
            position: relative;
        }

        .dropdown .dropbtn {
            font-weight: bold;
            border: none;
            outline: none;
            color: white;
            background-color: inherit;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .dropdown .dropbtn:hover {
            background-color: #013f93;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #005ed6;
            min-width: 200px;
            z-index: 1;
        }

        .dropdown-content a {
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

        .navbar-right a {
            color: white;
            text-decoration: none;
            padding: 10px;
            font-size: 14px;
        }

        .navbar-right a:hover {
            background-color: #ff4d4d;
            border-radius: 4px;
        }

        /* Footer */
        footer {
            background-color: #f1f1f1;
            text-align: center;
            padding: 12px;
            position: relative;
        }

        .icon-small {
            width: 80px;
            height: auto;
        }

        /* Base button */
        .btn {
            display: inline-block;
            font-weight: 600;
            text-align: center;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        /* Dark theme button */
        .btn-dark {
            background-color: #343a40;
            color: #ffffff;
        }

        .btn-dark:hover {
            background-color: #23272b;
            transform: scale(1.03);
        }

        .btn-dark:active {
            background-color: #1d2124;
            transform: scale(0.98);
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
<body class="d-flex flex-column min-vh-100">

<!-- MENU NGANG -->
<div class="navbar">
    <a href="#">🏠 TRANG CHỦ</a>

    <div class="dropdown">
        <button class="dropbtn">QUẢN LÝ</button>
        <div class="dropdown-content">
            <a href="/QLY_PHONG_TRO/phong">Phòng trọ</a>
            <a href="/QLY_PHONG_TRO/NguoiThueServlet">Người thuê</a>
            <a href="/QLY_PHONG_TRO/ThuePhongServlet">Hợp đồng</a>
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

<!-- NỘI DUNG -->
<div class="container">
    <h3 class="text-center mb-4">Chào quản trị viên: <%= user %></h3>
    <div class="row row-cols-1 row-cols-md-3 g-4">

        <!-- Quản lý phòng -->
        <div class="col">
            <div class="card card-hover h-100">
                <img src="room.jpg" class="icon-small" alt="Phòng trọ">
                <div class="card-body">
                    <h5 class="card-title">Quản lý phòng trọ</h5>
                    <p class="card-text">Thêm, sửa, xóa thông tin phòng, cập nhật trạng thái thuê.</p>
                    <a href="/QLY_PHONG_TRO/phong" class="btn btn-dark">Truy cập</a>
                </div>
            </div>
        </div>

        <!-- Quản lý người thuê -->
        <div class="col">
            <div class="card card-hover h-100">
                <img src="tenant.jpg" class="icon-small" alt="Người thuê">
                <div class="card-body">
                    <h5 class="card-title">Quản lý người thuê</h5>
                    <p class="card-text">Xem danh sách người thuê, chỉnh sửa thông tin cư dân.</p>
                    <a href="/QLY_PHONG_TRO/NguoiThueServlet" class="btn btn-dark">Truy cập</a>
                </div>
            </div>
        </div>
		
		<!-- Hợp đồng thuê nhà -->
        <div class="col">
            <div class="card card-hover h-100">
                <img src="bill.jpg" class="icon-small" alt="Hóa đơn">
                <div class="card-body">
                    <h5 class="card-title">Hợp đồng thuê nhà</h5>
                    <p class="card-text">Tạo và quản lý các hợp đồng thuê nhà.</p>
                    <a href="/QLY_PHONG_TRO/ThuePhongServlet" class="btn btn-dark">Truy cập</a>
                </div>
            </div>
        </div>
		
        <!-- Quản lý hóa đơn -->
        <div class="col">
            <div class="card card-hover h-100">
                <img src="bill.jpg" class="icon-small" alt="Hóa đơn">
                <div class="card-body">
                    <h5 class="card-title">Hóa đơn phòng trọ</h5>
                    <p class="card-text">Tạo và quản lý các hóa đơn tiền phòng hằng tháng.</p>
                    <a href="/QLY_PHONG_TRO/HoaDonServlet" class="btn btn-dark">Truy cập</a>
                </div>
            </div>
        </div>

        <!-- Quản lý hóa đơn dịch vụ -->
        <div class="col">
            <div class="card card-hover h-100">
                <img src="service.jpg" class="icon-small" alt="Dịch vụ">
                <div class="card-body">
                    <h5 class="card-title">Hóa đơn dịch vụ</h5>
                    <p class="card-text">Quản lý tiền điện, nước, wifi và các dịch vụ khác.</p>
                    <a href="/QLY_PHONG_TRO/HoaDonDVServlet" class="btn btn-dark">Truy cập</a>
                </div>
            </div>
        </div>

        <!-- Quản lý tài khoản -->
        <div class="col">
            <div class="card card-hover h-100">
                <img src="user.jpg" class="icon-small" alt="Tài khoản">
                <div class="card-body">
                    <h5 class="card-title">Tài khoản người dùng</h5>
                    <p class="card-text">Thêm, chỉnh sửa hoặc xóa tài khoản người dùng.</p>
                    <a href="/QLY_PHONG_TRO/TKServlet" class="btn btn-dark">Truy cập</a>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Footer -->
<footer>
    © 2025 Quản Lý Phòng Trọ. All rights reserved.
</footer>

</body>
</html>
