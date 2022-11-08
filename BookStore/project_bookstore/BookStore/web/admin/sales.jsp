<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thống kê doanh số</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
    </head>
    <body>
        <h2 style="color: blue;">Doanh số bán hàng</h2>
        <div class="container">
            <div class="row" style="margin-bottom: 20px;">
                <form action="sales" method="post">
                    <!--                    Thời gian &nbsp;
                                        <select name="" id="">
                                            <option value="">Tất cả</option>
                                            <option value="">Trong tuần</option>
                                            <option value="">Trong tháng</option>
                                        </select>-->
                    Phân loại &nbsp;
                    <select name="tag">
                        <option value="0" ${requestScope.tag == 0 ? "selected" : ""}>Tất cả</option>
                        <option value="1" ${requestScope.tag == 1 ? "selected" : ""}>Thể loại</option>
                        <option value="2" ${requestScope.tag == 2 ? "selected" : ""}>Sách</option>
                        <option value="3" ${requestScope.tag == 3 ? "selected" : ""}>Nhà xuất bản</option>
                    </select>
                    <input type="submit" value="Lọc">
                </form>

            </div>
            <div class="row">
                <c:if test="${requestScope.tag == 0}">
                    <div class="col-md-9">
                        <h3 style="color: red;margin-left: -20px;">Thống kê chung</h3>
                        <h4>
                            <b>Tổng doanh số: </b> 
                            <fmt:formatNumber type="number" maxFractionDigits="0" value="${requestScope.total_sales}" /> VNĐ
                        </h4>
                        <h4>
                            <b>Ngày đạt doanh số cao nhất: </b> 
                            <fmt:parseDate value="${requestScope.highest_day}" var="parsedDate" pattern="yyyy-MM-dd" />
                            <fmt:formatDate pattern="dd-MM-yyyy" value="${parsedDate}" />
                        </h4>
                        <h4>
                            <b>Giá trị hàng đang xử lý:</b> 
                            <fmt:formatNumber type="number" maxFractionDigits="0" value="${requestScope.value_order_2}" /> VNĐ
                        </h4>
                        <h4>
                            <b>Giá trị hàng đang vận chuyển:</b>
                            <fmt:formatNumber type="number" maxFractionDigits="0" value="${requestScope.value_order_3}" /> VNĐ
                        </h4>
                        <h4>
                            <b>Giá trị hàng bị hủy: </b> 
                            <fmt:formatNumber type="number" maxFractionDigits="0" value="${requestScope.value_order_5}" /> VNĐ
                        </h4>
                    </div>
                </c:if>
                <c:if test="${requestScope.tag == 1 || requestScope.tag == 2 || requestScope.tag == 3}">
                    <div class="col-md-9">
                        <h3>Biểu đồ doanh số</h3>
                        <canvas id="myChart"></canvas>
                        <script>
                            var colors = ['aqua', 'black', 'blue', 'fuchsia', 'gray', 'green',
                                'lime', 'maroon', 'navy', 'olive', 'orange', 'purple', 'red',
                                'silver', 'teal', 'yellow'];
                            var xValues = new Array();
                            var yValues = new Array();
                            var barColors = new Array();
                            <c:forEach items="${requestScope.x_value}" var="x">
                            xValues.push("${x}");
                            </c:forEach>
                            <c:forEach items="${requestScope.y_value}" var="y">
                            yValues.push("${y}");
                            var rand = Math.floor(Math.random() * colors.length);
                            barColors.push(colors[rand]);
                            colors.splice(rand, 1);
                            </c:forEach>
                            new Chart("myChart", {
                                type: "bar",
                                data: {
                                    labels: xValues,
                                    datasets: [{
                                            label: 'Doanh số',
                                            backgroundColor: barColors,
                                            data: yValues
                                        }]
                                },
                                options: {
                                    legend: {display: false},
                                    title: {
                                        display: true
                                    }
                                }
                            });
                        </script>
                    </div>
                </c:if>
                <c:if test="${requestScope.tag == 2}" >
                    <div class="col-md-3" style="margin-top: 40px;">
                        <p><b>Sách có doanh số cao nhất:</b> ${requestScope.best_sale}</p>
                        <p><b>Sách bán chạy nhất:</b> ${requestScope.best_seller.title}</p>
                        <p><b>Sách được đặt hàng nhiều nhất:</b> ${requestScope.most_order.title}</p>
                    </div>
                </c:if>
            </div>
        </div>

        <a href="<%=request.getContextPath()%>/admin_page">
            <button type="button" class="btn btn-primary">Trở về trang quản lý</button>
        </a>
        <script src="<%=request.getContextPath()%>/js/Jquery.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    </body>
</html>
