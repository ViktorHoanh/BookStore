<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng kí | Nhà sách</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_style.css">
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
    </head>
    <body>
        <%@include file="../page/header.jsp" %>
        <div class="container" style="margin-top: 1% ; margin-bottom: 1%; padding-left: 2%;">
            <h3 class="text-uppercase">Đăng kí</h3>
            <span style="color: red">${requestScope.acc_err}</span>
            <form action="register" method="post">
                Tài khoản* <br>
                <input type="text" name="user" required value="${requestScope.user}"> <br> <br>
                Mật khẩu* <br>
                <input type="password" name="pass" required placeholder="Có 6 đến 20 kí tự" pattern="^.{6,20}$"> <br><br>
                Xác nhận mật khẩu* <br>
                <input type="password" name="re_pass" required placeholder="Nhập lại mật khẩu"> 
                <span style="color: red">${requestScope.pass_err}</span>
                <br><br>
                Email* <br>
                <input type="email" name="email" required value="${requestScope.email}"> <br> <br>
                <input type="submit" value="Đăng kí">
            </form>
            <c:if test="${requestScope.success==null}">
                Bạn đã có tài khoản? Hãy <a class="btn btn-primary" href="<%=request.getContextPath()%>/login">Đăng nhập</a> ngay
            </c:if>
            <c:if test="${requestScope.success!=null}">
                <h4 style="color: red">Bạn đã đăng kí tài khoản thành công. Hãy <a class="btn btn-primary" href="<%=request.getContextPath()%>/login">Đăng nhập</a> ngay</h4>
            </c:if>
        </div>  
        <%@include file="../page/footer.jsp" %>
    </body>
</html>
