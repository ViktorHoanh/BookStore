<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tranh thanh toán</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_style.css">
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
    </head>
    <body>
        <h1 class="text-uppercase" style="color: blueviolet;">Trang thanh toán</h1>
        <div style="margin-left: 30px;">
            <h3>
                <i class="fas fa-book"></i> &nbsp;&nbsp;Đơn hàng của bạn
            </h3>
            <table border="1px" width="40%">
                <tr>
                    <th>Tên sách</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                </tr>
                <c:set value="${0}" var="total" />
                <c:forEach items="${sessionScope.listI}" var="i">
                    <tr>
                        <td>${i.b.title}</td>
                        <td>${i.b.price}</td>
                        <td>${i.quantity}</td>
                        <td>
                            <fmt:formatNumber type="number" maxFractionDigits="0" value="${i.b.price * i.quantity}" />
                        </td>
                        <c:set value="${total + i.b.price * i.quantity}" var="total" />
                    </tr>
                </c:forEach>
            </table>
            <h4 style="color: red;">Tổng tiền sách: <fmt:formatNumber type="number" maxFractionDigits="0" value="${total}" /> VNĐ (chưa bao gồm phí vận chuyển) </h4>
            <h3>
                <i class="fas fa-user"></i> &nbsp;&nbsp; Thông tin người mua
            </h3>
            <form action="buy?action=cart" method="post">
                <table>
                    <tr>
                        <td>Họ và tên</td>
                        <td><input type="text" name="cusName" required></td>
                    </tr>
                    <tr>
                        <td>Số điện thoại</td>
                        <td><input type="text" name="cusPhone" required></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="cusEmail" required></td>
                    </tr>
                    <tr>
                        <td>Địa chỉ nhận hàng</td>
                        <td><input type="text" name="cusAddr" required></td>
                    </tr>
                    <tr>
                        <td>Phương thức giao hàng</td>
                        <td>
                            <jsp:useBean id="listSh" class="dal.OrderDAO" />
                            <select name="shID">
                                <c:forEach items="${listSh.allShipping}" var="sh">
                                    <option value="${sh.shID}">${sh.shName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                </table> <br>
                <input type="submit" value="Thanh toán">
            </form>
        </div>

        <script src="<%=request.getContextPath()%>/js/Jquery.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    </body>
</html>
