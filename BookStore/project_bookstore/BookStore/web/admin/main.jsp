<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang quản lý</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
    </head>
    <body>
        <h2>Xin chào Admin</h2>
        <div>
            <!--chưa làm-->
            <h3>Thống kê</h3>
            <ul>             
                <li><a href="<%=request.getContextPath()%>/sales">Theo doanh số</a></li>
                <li><a href="<%=request.getContextPath()%>/customer"> Theo khách hàng</a></li>
            </ul>
        </div>
        <div>
            <h3>Quản lý dữ liệu</h3>
            <ul>
                <li><a href="<%=request.getContextPath()%>/type">Thể loại</a></li>
                <li><a href="<%=request.getContextPath()%>/book">Sách</a></li>
                <li><a href="<%=request.getContextPath()%>/publish">Nhà xuất bản</a></li>
                <li><a href="<%=request.getContextPath()%>/order">Đơn hàng</a></li>
            </ul>
        </div>
                
        <a href="<%=request.getContextPath()%>/home">
            <button type="button" class="btn btn-primary">Trở về trang chủ</button>
        </a>

        <script src="<%=request.getContextPath()%>/js/Jquery.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    </body>
</html>
