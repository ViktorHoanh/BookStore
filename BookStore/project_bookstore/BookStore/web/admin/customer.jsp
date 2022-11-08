<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thống kê khách hàng</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
    </head>
    <body style="margin-left: 20px;">
        <h2 style="color: blue;">Thống kê theo khách hàng </h2>
        <div class="container" style="margin-bottom: 30px;">
            <div class="row">
                <h4>1. Về tài khoản người dùng</h4>
                <ul>
                    <li> <b>Số lượng tài khoản:</b> ${requestScope.NoAcc}</li> 
                    <li><b>Số lượng đơn hàng đã giao dịch:</b> ${requestScope.NoOrder}</li> 
                    <li>
                        <b>Trung bình đơn hàng: </b>
                        <fmt:formatNumber type="number" maxFractionDigits="2" value="${requestScope.NoOrder/requestScope.NoAcc}" />
                    </li> 
                    <li><b>Số tài khoản có giao dịch trong tháng: </b> ${requestScope.NoAccOrderInMonth} </li>
                </ul>
            </div>
            <div class="row">
                <h4>2. Các tài khoản chi tiêu nhiều nhất</h4>
                <table border="1px" width="60%" style="margin-left: 20px;">
                    <tr>
                        <th>Tài khoản</th>
                        <th>Tổng số tiền</th>
                        <!-- Chi tiết chính là lịch sử giao dịch -->
                        <th>Chi tiết</th>  
                    </tr>
                    <c:forEach items="${requestScope.listA.entrySet()}" var="a">
                        <tr>
                            <td>${a.getKey()}</td>
                            <td>
                                <fmt:formatNumber type="number" maxFractionDigits="1" value="${a.getValue()}" /> VNĐ                             
                            </td>
                            <td><a href="cus_detail?user=${a.getKey()}">Chi tiết</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </body>
        <a href="<%=request.getContextPath()%>/admin_page">
            <button type="button" class="btn btn-primary">Trở về trang quản lý</button>
        </a>
        <script src="<%=request.getContextPath()%>/js/Jquery.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>    
</html>
