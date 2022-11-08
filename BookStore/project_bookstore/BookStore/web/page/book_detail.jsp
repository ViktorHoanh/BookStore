<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${requestScope.book.title}</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_style.css">
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
        <style>
            .book-img {
                padding-top: 20px;
                padding-bottom: 20px;
            }

            .image-detail {
                width: 330px;
                height: 330px;
            }

            .book-title {
                border-bottom: 3px #CACBCC solid;
                margin-right: 3%;
                margin-bottom: 15px;
            }

            .book-info {
                margin-top: 20px;
            }

            .info1 {
                padding-left: 0px;
            }

            .info1 ul {
                line-height: 2.6em;
                padding-left: 0px;
                list-style: none;
            }

            .info1 ul>li::before {
                content: "•";
                padding-right: 5px;
            }

            .info1 ul>li {
                border-bottom: 1px solid green;
                margin-right: 4%;
            }

            .book-price {
                background-color: #FAFAFA;
                border-radius: 4px;
                padding: 2px 0px 10px 15px;
            }

            .buy-order {
                display: flex;
                line-height: 2em;
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

/*            .disable {
                color: rgb(142, 179, 180);
            }*/
            .describe{
                padding-right: 20%;
                padding-left: 20%;
                line-height: 2em;
                padding-bottom: 10px;
            }
            .book{
                margin-bottom: 0px;
                margin-left: 25px;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%
            String str = request.getAttribute("javax.servlet.forward.request_uri") + "?";
            Enumeration<String> paramNames = request.getParameterNames();
            while (paramNames.hasMoreElements()) {
                String paramName = paramNames.nextElement();
                String[] paramValues = request.getParameterValues(paramName);
                for (int i = 0; i < paramValues.length; i++) {
                    String paramValue = paramValues[i];
                    str = str + paramName + "=" + paramValue;
                    str = str + "&";
                }
//                str = str + "&";
            }
        %>
        <c:set scope="session" var="pre_url" value="<%= str.substring(0, str.length()-1) %>" />
        <main>
            <c:set value="${requestScope.book}" var="b" />
            <div class="container" style="margin-top: 1% ; margin-bottom: 1%;">
                <div class="row">
                    <div class="col-md-4 book-img">
                        <img class="image-detail" src="${b.image}" alt="book_img">
                    </div>
                    <div class="col-md-8">
                        <div class="row book-title">
                            <h3 class="text-uppercase" style="color: #967D00;">${b.title}</h3>
                        </div>
                        <div class="row book-info">
                            <div class="col-md-6 info1">
                                <ul>
                                    <li>Thể loại: <b>${b.t.tName}</b> </li>
                                    <li>Tác giả: 
                                        <c:if test="${requestScope.listA.size()>=2}">
                                            <c:forEach end="${requestScope.listA.size()-2}" items="${requestScope.listA}" var="a">
                                                <b>${a.aName}, </b>
                                            </c:forEach>
                                        </c:if>
                                        <b>${requestScope.listA.get(listA.size()-1).getaName()}</b>
                                    </li>
                                    <c:if test="${requestScope.listTr.size()>0}">
                                        <li>Dịch giả: 
                                            <c:if test="${requestScope.listTr.size()>=2}">
                                                <c:forEach end="${requestScope.listTr.size()-2}" items="${requestScope.listTr}" var="tr">
                                                    <b>${tr.trName}, </b>
                                                </c:forEach>
                                            </c:if>
                                            <b>${requestScope.listTr.get(listTr.size()-1).getTrName()}</b>
                                        </li>
                                    </c:if>
                                    <li>Nhà xuất bản: <b>${b.p.pName}</b></li>
                                    <li>Số trang: ${b.noPage}</li>
                                    <li>Ngày phát hành: 
                                        <fmt:parseDate value="${b.pubDate}" var="parsedDate" pattern="yyyy-MM-dd" />
                                        <fmt:formatDate pattern="dd-MM-yyyy" value="${parsedDate}" />
                                    </li>
                                    <li>Tình trang: ${requestScope.tinh_trang} </li>
                                </ul>
                            </div>
                            <div class="col-md-6 info2">
                                <div class="book-price">
                                    <h2 style="color: red;">            
                                        <fmt:formatNumber type="number" maxFractionDigits="0" value="${b.price}" />
                                        VNĐ
                                    </h2>
                                    <p>
                                        Cam kết hàng chính hãng <br>
                                        Uy tín số 1 Việt Nam
                                    </p>
                                </div>
                                <h3>Số lượng</h3>
                                <div class="buy-order">
                                    <button class="minus" onclick="minus()"><i class="fas fa-minus"></i></button>
                                    <input type="text" value="1" name="quantity" id="qty">
                                    <button class="add" onclick="add()"><i class="fas fa-plus"></i></button> <br>
                                </div>
                                <a href="#" type="button" class="btn btn-warning" onclick="now()">Mua Ngay</a>
                                <a href="#" type="button" class="btn btn-warning" onclick="cart()">Thêm vào giỏ hàng</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container" style="margin-top: 1% ; margin-bottom: 1%;">
                <h3 class="text-center"><span style="background-color: #0F5731; color: white;padding: 8px;">Giới thiệu
                        sách</span></h3>
                <div class="describe">${b.descrip}</div>
            </div>
            <div class="container" style="margin-top: 1% ; margin-bottom: 1%;">
                <h3 class="text-center"><span style="background-color: #0F5731; color: white;padding: 8px;">Sản phẩm liên
                        quan</span></h3>
                <div class="row" >
                    <c:forEach items="${requestScope.relatedList}" var="rl">
                        <div class="col-md-2 book">
                            <a href="book_detail?bID=${rl.bID}">
                                <img class="img-responsive"
                                     src="${rl.image}"
                                     alt="book_img" >
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </main>
        <script>
            function now() {
                var x = document.getElementById("qty");
                window.location = "buy?action=now&bID=${b.bID}&quantity=" + x.value;
            }
            function cart(){
                var x = document.getElementById("qty");
                window.location = "buy?action=cart&bID=${b.bID}&quantity=" + x.value;
            }           
            function minus() {
                var x = document.getElementById("qty");
                if (x.value == 1)
                    return;
                x.value--;
            }
            function add() {
                var x = document.getElementById("qty");
                x.value++;
            }
        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>
