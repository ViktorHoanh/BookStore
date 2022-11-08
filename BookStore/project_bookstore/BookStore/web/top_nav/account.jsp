<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tài khoản của bạn | Nhà sách</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_style.css">
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
    </head>
    <body>
        <%@include file="../page/header.jsp" %>
        <div class="container" style="margin-top: 1% ; margin-bottom: 1%; padding-left: 2%;">
            <div class="col-md-5" style="margin-bottom: 10px;">
                <h3>Tài khoản*</h3>
                <input type="text"  readonly value="${sessionScope.acc.user}"> <br> 
                <h3>Mật khẩu*</h3>
                <input type="password" readonly value="${sessionScope.acc.pass}" placeholder="Có 6 đến 20 kí tự" pattern="^.{6,20}$">
                <button onclick="change()">Đổi mật khẩu</button> <br>
                <h3>Email*</h3>
                <input type="email"  readonly value="${sessionScope.acc.email}"> <br> 
            </div>
            <div class="col-md-6" style="display: none;" id="change_pass">
                <form action="account" method="post" onsubmit="return check()">
                    <input type="password" id="pass_old1" value="${sessionScope.acc.pass}" hidden>
                    <h3>Nhập lại mật khẩu cũ*</h3>
                    <input type="password" id="pass_old2" required placeholder="Có 6 đến 20 kí tự" pattern="^.{6,20}$" >            
                    <br>
                    <h3>Nhập mật khẩu mới*</h3>
                    <input type="password" id="pass_new1" required placeholder="Có 6 đến 20 kí tự" pattern="^.{6,20}$"> <br>
                    <h3>Nhập lại mật khẩu mới*</h3>
                    <input type="password" id="pass_new2" name="pass_new" required placeholder="Phải giống MK mới ở trên"> 
                    <br><br>
                    <span id="message" style="color: red;"></span> <br>
                    <input type="submit" value="Xác nhận"> 
                </form>
            </div>  
        </div>
        <script>
            function change() {
                var x = document.getElementById("change_pass");
                x.style.display = "block";
            }
            function check() {
                var o1 = document.getElementById("pass_old1");
                var o2 = document.getElementById("pass_old2");
                var n1 = document.getElementById("pass_new1");
                var n2 = document.getElementById("pass_new2");
                if (o1.value != o2.value) {
                    document.getElementById("message").innerHTML = "** Phải nhập đúng MK cũ";
                    return false;
                } else if (n1.value != n2.value) {
                    document.getElementById("message").innerHTML = "** Phải nhập lại đúng MK mới";
                    return false;
                }
                return true;
            }
        </script>
        <%@include file="../page/footer.jsp" %>
    </body>
</html>
