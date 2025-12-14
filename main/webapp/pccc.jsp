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
<title>An toàn phòng cháy chữa cháy</title>
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

    .content {
        max-width: 900px;
        margin: 30px auto;
        padding: 30px;
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    h1 {
        text-align: center;
        color: #b30000;
    }

    ul {
        padding-left: 20px;
    }

    ul li {
        margin-bottom: 12px;
    }

    .important {
        color: #b30000;
        font-weight: bold;
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

<!-- NỘI DUNG TRANG -->
<div class="content">
    <h1>Hướng Dẫn An Toàn Phòng Cháy Chữa Cháy Tại Gia</h1>
    <img alt="phong chay" src="phong%20chay.jpg" style="width:100%;max-width:800px;display:block;margin:auto;">
    <ul>
        <li>Trước khi rời khỏi nhà hoặc đi ngủ, <span class="important">phải kiểm tra bếp nấu, nơi thờ cúng</span> và tắt các thiết bị điện không cần thiết.</li>
        <li>Không được dự trữ xăng dầu, khí đốt và chất dễ cháy trong nhà. Nếu cần, chỉ để <span class="important">một lượng nhỏ ở khu vực riêng biệt</span> để tránh cháy nổ.</li>
        <li>Quản lý chặt chẽ khi sạc xe điện, pin dự phòng, điện thoại... <span class="important">Không sạc qua đêm</span> khi không kiểm soát được.</li>
        <li>Nơi thờ cúng phải bố trí hợp lý. <span class="important">Tường và trần cần làm bằng vật liệu không cháy</span>, hạn chế vàng mã, nến, nhang.</li>
        <li>Tìm hiểu kiến thức PCCC và <span class="important">trang bị dụng cụ chữa cháy phù hợp</span> với nơi ở.</li>
        <li>Chìa khóa phòng cần để nơi dễ thấy, phổ biến cho cả nhà biết. Bố trí <span class="important">lối thoát hiểm qua cửa sổ, ban công</span> với kích thước khoảng 0.6m x 0.6m.</li>
        <li>Trang bị bình chữa cháy, dụng cụ phá dỡ như <span class="important">búa, rìu, xà beng</span>... Đèn chiếu sáng sự cố cần được đặt nơi dễ lấy.</li>
        <li>Khuyến khích lắp thêm <span class="important">thiết bị báo cháy, mặt nạ phòng độc, thang dây</span> để tăng mức an toàn.</li>
        <li>Tự xây dựng và thực hành phương án chữa cháy, thoát hiểm cho gia đình. Đặc biệt <span class="important">không khóa cửa phòng trẻ em, người già</span>.</li>
        <li>Phản ánh kịp thời đến quản lý tòa nhà/phòng trọ khi phát hiện <span class="important">nguy cơ mất an toàn PCCC</span>.</li>
        <li>Khi xảy ra cháy, <span class="important">bình tĩnh tìm lối thoát, báo cho người xung quanh</span>, cúi thấp người hoặc bò khom khi thoát hiểm.</li>
        <li>Dùng khăn ướt bịt mũi hoặc trùm chăn ướt cho trẻ khi di chuyển qua khu vực có khói, tránh bỏng và khí độc.</li>
        <li>Đối với nhà ống, nhà kín chỉ có một lối ra, cần <span class="important">bình tĩnh và thoát qua cửa chính hoặc lối thoát thứ hai</span> nếu có.</li>
        <li><span class="important">Tuyệt đối không trốn trong phòng hoặc nhà vệ sinh</span> khi xảy ra cháy.</li>
        <li>Gọi ngay số <span class="important">114</span> hoặc sử dụng ứng dụng <span class="important">BAO CHAY 114</span> để báo cháy. Đồng thời tổ chức chữa cháy, cứu người theo kế hoạch đã chuẩn bị.</li>
    </ul>
</div>
</body>
</html>
