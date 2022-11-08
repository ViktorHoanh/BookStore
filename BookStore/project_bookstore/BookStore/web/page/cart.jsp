<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng | Nhà sách</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_style.css">
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
        <style>
            .buy-order {
                display: flex;
                line-height: 1.5em;
                margin-bottom: 20px;
            }

            .minus,
            .add {
                background-color: white;
                border: 1px solid black;
            }

            .add:hover,
            .minus:hover {
                background-color: #a9bed3;
            }

            .minus {
                border-right: none;
                border-top-left-radius: 10px;
                border-bottom-left-radius: 10px;
                width: 30px;
            }

            .add {
                border-left: none;
                border-top-right-radius: 10px;
                border-bottom-right-radius: 10px;
                width: 30px;
            }

            .buy-order input {
                border: 1px solid black;
                width: 50px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <main>
            <h2 class="text-uppercase text-center">giỏ hàng</h2>
            <div class="container" style="margin-top: 1% ; margin-bottom: 1%;">
                <div class="row" style="color: blue;">
                    <div class="col-md-1">
                        <h4>STT</h4>
                    </div>
                    <div class="col-md-3">
                        <h4>Tên sách</h4>
                    </div>
                    <div class="col-md-2">
                        <h4>Đơn giá</h4>
                    </div>
                    <div class="col-md-2">
                        <h4>Số lượng</h4>
                    </div>
                    <div class="col-md-2">
                        <h4>Thành tiền</h4>
                    </div>
                    <div class="col-md-2 text-center">
                        <h4>Xóa sản phẩm</h4>
                    </div>
                </div>
                <c:set var="stt" value="${1}" />
                <c:set var="total" value="${0}" />
                <c:forEach items="${sessionScope.listI}" var="i">
                    <div class="row">
                        <div class="col-md-1">
                            <h4>${stt}</h4>
                        </div>
                        <div class="col-md-3">
                            <h4>${i.b.title}</h4>
                        </div>
                        <div class="col-md-2">
                            <h4>
                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${i.b.price}" /> VNĐ
                            </h4>
                        </div>
                        <div class="col-md-2">
                            <h4>
                                <div class="buy-order">
                                    <a href="<%=request.getContextPath()%>/cart?qty=${i.quantity-1}&stt=${stt}">
                                        <button class="minus">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </a>
                                    <input type="text" value="${i.quantity}" readonly name="quantity" id="qty">
                                    <a href="<%=request.getContextPath()%>/cart?qty=${i.quantity+1}&stt=${stt}">
                                        <button class="add">
                                            <i class="fas fa-plus"></i>
                                        </button> <br>
                                    </a>
                                </div>
                            </h4>
                        </div>
                        <div class="col-md-2">
                            <h4 id="cost">
                                <fmt:formatNumber type="number" maxFractionDigits="0" value="${i.b.price * i.quantity}" /> VNĐ
                            </h4>
                        </div>
                        <div class="col-md-2 text-center">
                            <a href="<%=request.getContextPath()%>/cart_delete?stt=${stt}"><i class="fas fa-trash-alt fa-2x" style="color: black;"></i></a>
                        </div>
                    </div>
                    <c:set var="stt" value="${stt + 1}" />   
                    <c:set var="total" value="${total + i.b.price * i.quantity}" />
                </c:forEach>
                <div class="row">
                    <div class="col-md-4 col-md-offset-6" style="color: red; padding-left: 6%;">
                        <h3>Tổng cộng: <fmt:formatNumber type="number" maxFractionDigits="0" value="${total}" /> VNĐ</h3>
                    </div>
                </div>
                <div class="row" style="padding-bottom: 20px;">
                    <div class="col-md-3 ">
                        <a href="<%=request.getContextPath()%>/home">
                            <button type="button" class="btn btn-light">Tiếp tục mua hàng</button>
                        </a>
                    </div>
                    <div class="col-md-1 col-md-offset-7" style="padding-left: 5%;">
                        <form action="cart_process" method="post">                  
                            <input class="btn btn-primary" type="submit" value="Thanh toán">
                        </form>                      
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp" %>
    </body>
</html>
