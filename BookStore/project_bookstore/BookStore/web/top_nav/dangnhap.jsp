<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập | Nhà sách</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_style.css">
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
    </head>
    <body>
        <%@include file="../page/header.jsp" %>

        <div class="container" style="margin-top: 1% ; margin-bottom: 1%;">
            <h3 class="text-uppercase">Đăng nhập</h3>   
            <p style="color: red">${sessionScope.login_err}</p>
            <form action="login" method="post">
                Tài khoản* <br>
                <input type="text" name="user" value="${cookie.username.getValue()}" required> <br> <br>
                Mật khẩu* <br>
                <input type="password" name="pass" value="${cookie.password.getValue()}" required> <br> <br>
                <input type="checkbox" name="remember" value="1"> Ghi nhớ <br>
                <input type="submit" value="Đăng nhập">
            </form> 
            Chưa có tài khoản? Hãy <a class="btn btn-primary" href="<%=request.getContextPath()%>/register">Đăng kí</a> ngay
        </div> 

        <%@include file="../page/footer.jsp" %>
    </body>
</html>
