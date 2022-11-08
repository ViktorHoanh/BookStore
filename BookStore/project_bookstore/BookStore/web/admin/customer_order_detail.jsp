<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết giao dịch</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_style.css">
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
        <style>
            .nav a{
                text-decoration: none;
                color: black;
            }
            .status {
                padding: 7px 7px 7px 7px;
            }

            .status:hover {
                color: blue;
                border-bottom: 1px solid blue;
            }
        </style>
    </head>
    <body>
        <main>
            <h2 style="color: blue" class="text-uppercase text-center">Chi tiết giao dịch tài khoản ${requestScope.user}</h2>
            <div class="container" style="margin-bottom: 3%;">
                <jsp:useBean id="od" class="dal.OrderDAO" />
                <div class="row nav" style="margin-bottom: 30px;">
                    <div class="col-md-1"></div>
                    <a href="#">
                        <div class="col-md-2 text-center status" onclick="myfunc(1, this)">
                            Tất cả
                        </div>
                    </a>
                    <c:forEach items="${od.allStatus}" var="s">
                        <a href="#">
                            <div class="col-md-2 text-center status" onclick="myfunc(${s.sID}, this)">
                                ${s.sValue}
                            </div>
                        </a>   
                    </c:forEach>
                </div>
                <div class="row text-uppercase" style="color: blueviolet;">
                    <div class="col-md-3">
                        <h4>Mã đơn hàng</h4>
                    </div>
                    <div class="col-md-3">
                        <h4>Tổng tiền sách</h4>
                    </div>
                    <div class="col-md-3">
                        <h4>Trạng thái</h4>
                    </div>
                </div>
                <!--All order-->
                <c:forEach items="${requestScope.listO}" var="o">
                    <div class="row s1" style="border-bottom: 1px solid brown;">
                        <div class="col-md-3">
                            <h5>${o.oID}</h5>
                        </div>
                        <div class="col-md-3">
                            <c:set var="total" value="${od.getPriceOfOrder(o.oID)}" />
                            <h5>
                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${total}" /> VNĐ
                            </h5>
                        </div>
                        <div class="col-md-3">
                            <h5>${od.getCurrentStatus(o.oID).s.sValue}</h5>
                        </div>
                        <div class="col-md-3">
                            <a href="history_detail?id=${o.oID}" style="text-decoration: none;"><h4>Chi tiết</h4></a>
                        </div>
                    </div>
                </c:forEach>
                <!--Status: Đang xử lí-->
                <c:forEach items="${od.getOrderByStatus(requestScope.listO, 2)}" var="o2">
                    <div class="row s2" style="border-bottom: 1px solid brown;display: none;">
                        <div class="col-md-3">
                            <h5>${o2.oID}</h5>
                        </div>
                        <div class="col-md-3">
                            <c:set var="total" value="${od.getPriceOfOrder(o2.oID)}" />
                            <h5>
                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${total}" /> VNĐ
                            </h5>
                        </div>
                        <div class="col-md-3">
                            <h5>${od.getCurrentStatus(o2.oID).s.sValue}</h5>
                        </div>
                        <div class="col-md-3">
                            <a href="history_detail?id=${o2.oID}" style="text-decoration: none;"><h4>Chi tiết</h4></a>
                        </div>
                    </div>
                </c:forEach>
                <!--Status: Đang vận chuyển-->
                <c:forEach items="${od.getOrderByStatus(requestScope.listO, 3)}" var="o3">
                    <div class="row s3" style="border-bottom: 1px solid brown;display: none;">
                        <div class="col-md-3">
                            <h5>${o3.oID}</h5>
                        </div>
                        <div class="col-md-3">
                            <c:set var="total" value="${od.getPriceOfOrder(o3.oID)}" />
                            <h5>
                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${total}" /> VNĐ
                            </h5>
                        </div>
                        <div class="col-md-3">
                            <h5>${od.getCurrentStatus(o3.oID).s.sValue}</h5>
                        </div>
                        <div class="col-md-3">
                            <a href="history_detail?id=${o3.oID}" style="text-decoration: none;"><h4>Chi tiết</h4></a>
                        </div>
                    </div>
                </c:forEach>
                <!--Status: Đã giao-->
                <c:forEach items="${od.getOrderByStatus(requestScope.listO, 4)}" var="o4">
                    <div class="row s4" style="border-bottom: 1px solid brown;display: none;">
                        <div class="col-md-3">
                            <h5>${o4.oID}</h5>
                        </div>
                        <div class="col-md-3">
                            <c:set var="total" value="${od.getPriceOfOrder(o4.oID)}" />
                            <h5>
                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${total}" /> VNĐ
                            </h5>
                        </div>
                        <div class="col-md-3">
                            <h5>${od.getCurrentStatus(o4.oID).s.sValue}</h5>
                        </div>
                        <div class="col-md-3">
                            <a href="history_detail?id=${o4.oID}" style="text-decoration: none;"><h4>Chi tiết</h4></a>
                        </div>
                    </div>
                </c:forEach>
                <!--Status: Đã hủy-->
                <c:forEach items="${od.getOrderByStatus(requestScope.listO, 5)}" var="o5">                   
                    <div class="row s5" style="border-bottom: 1px solid brown; display: none;" >
                        <div class="col-md-3">
                            <h5>${o5.oID}</h5>
                        </div>
                        <div class="col-md-3">
                            <c:set var="total" value="${od.getPriceOfOrder(o5.oID)}" />
                            <h5>
                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${total}" /> VNĐ
                            </h5>
                        </div>
                        <div class="col-md-3">
                            <h5>${od.getCurrentStatus(o5.oID).s.sValue}</h5>
                        </div>
                        <div class="col-md-3">
                            <a href="history_detail?id=${o5.oID}" style="text-decoration: none;"><h4>Chi tiết</h4></a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </main>
        <script>
            function myfunc(x,k) {
                for (let i = 1; i <= 5; i++) {
                    if (i === x) {
                        var arrX = document.getElementsByClassName("s" + i);
                        for (let n = 0; n < arrX.length; n++) {
                            arrX[n].style.display = 'block';
                        }
                    } else {
                        var arrY = document.getElementsByClassName("s" + i);
                        for (let m = 0; m < arrY.length; m++) {
                            arrY[m].style.display = 'none';
                        }
                    }
                }
                var arrNav = document.getElementsByClassName('status');
                for (let nav = 0; nav < arrNav.length; nav++) {
                    arrNav[nav].style.borderBottom = 'none';
                }
                k.style.borderBottom = '2px solid blue';
            }
        </script>
        <a href="<%=request.getContextPath()%>/customer">
            <button type="button" class="btn btn-primary">Trở về trang thống kê</button>
        </a>
        <script src="<%=request.getContextPath()%>/js/Jquery.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>    
    </body>
</html>
