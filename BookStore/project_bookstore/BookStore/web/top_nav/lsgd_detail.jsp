<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết đơn hàng</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
    </head>
    <body>
        <h1>Chi tiết đơn hàng</h1>
        <c:set value="${requestScope.order}" var="o" />
        <div style="margin-left: 20px;">
            <ul>
                <li>Mã đơn hàng: ${o.oID}</li>
                <li>Tài khoản: ${o.user.user}</li>
                <li>Ngày đặt hàng:
                    <fmt:parseDate value="${o.oDate}" var="parsedDate" pattern="yyyy-MM-dd" />
                    <fmt:formatDate pattern="dd-MM-yyyy" value="${parsedDate}" />
                </li>
                <li>Tên khách hàng: ${o.cusName}</li>
                <li>SĐT: ${o.cusPhone}</li>
                <li>Địa chỉ: ${o.cusAddr}</li>
                <li>Email: ${o.cusEmail}</li>
                <li>Phương thức giao hàng: ${o.s.shName}</li>
                <li>Phí vận chuyển: <fmt:formatNumber type="number" maxFractionDigits="0" value="${o.s.cost}" /></li>
                <li>Giỏ hàng
                    <table border="1px" width="40%">
                        <tr>
                            <th>Tên sách</th>
                            <th>Đơn giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                        </tr>
                        <c:set value="${0}" var="total" />
                        <c:forEach items="${requestScope.listOL}" var="ol">
                            <tr>
                                <td>${ol.b.title}</td>
                                <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${ol.b.price}" /></td>
                                <td>${ol.quantity}</td>
                                <td>
                                    <fmt:formatNumber type="number" maxFractionDigits="0" value="${ol.quantity * ol.b.price}" />
                                </td>
                                <c:set value="${total + ol.quantity * ol.b.price}" var="total" />
                            </tr>
                        </c:forEach>
                    </table>
                    => <b>Tổng cộng: </b> <fmt:formatNumber type="number" maxFractionDigits="0" value="${total+o.s.cost}" />  (đã bao gồm phí vận chuyển)
                </li>
                <li>Trạng thái đơn hàng
                    <table border="1px" width="40%">
                        <tr>
                            <th>Ngày</th>
                            <th>Trạng thái</th>
                        </tr>
                        <c:forEach items="${requestScope.listOS}" var="os">
                            <tr>
                                <td>
                                    <fmt:parseDate value="${os.sDate}" var="parsedDate" pattern="yyyy-MM-dd" />
                                    <fmt:formatDate pattern="dd-MM-yyyy" value="${parsedDate}" />
                                </td>
                                <td>${os.s.sValue}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </li>           
            </ul>
        </div>

        <script src="<%=request.getContextPath()%>/js/Jquery.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    </body>
</html>
