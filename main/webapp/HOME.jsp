<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Phòng Trọ</title>
    <link rel="icon" type="image/jpg" href="logo.jpg">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('PhongTro.jpg'); /* dùng hình ảnh mới */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            position: relative;
            min-height: 100vh;
            margin: 0;
        }

        /* Lớp phủ làm tối ảnh nền */
        body::before {
            content: "";
            position: absolute;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4); /* overlay tối */
            z-index: 0;
        }

        .container {
            position: relative;
            z-index: 1;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
            max-width: 600px;
        }

        footer {
            position: relative;
            z-index: 1;
        }
    </style>
</head>
<body class="d-flex flex-column align-items-center justify-content-center">

    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary w-100">
        <div class="container-fluid">
            <span class="navbar-brand mb-0 h1">Hệ thống Quản Lý Phòng Trọ</span>
        </div>
    </nav>

    <!-- Main content -->
    <div class="container text-center my-5">
        <h1 class="mb-4">Chào mừng đến với hệ thống</h1>
        <p class="mb-4">Vui lòng đăng nhập hoặc đăng ký để tiếp tục sử dụng dịch vụ.</p>
        <div class="d-flex justify-content-center gap-3">
            <a href="login.jsp" class="btn btn-primary btn-lg">Đăng nhập</a>
            <a href="register.jsp" class="btn btn-outline-primary btn-lg">Đăng ký</a>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-light text-center py-3 w-100 mt-auto">
        © 2025 Quản Lý Phòng Trọ. All rights reserved.
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
