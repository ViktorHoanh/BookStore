<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ | Nhà sách</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/home_style.css">
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
        <style>
            .pagination {
                /*padding-left: 30%;*/
                margin-left: 8px;
            }
            .pagination a {
                color: black;
                font-size: 22px;
                padding: 8px 16px;
                text-decoration: none;
            }
            .pagination a:hover{
                background-color: #8484cc;
            }
            .pagination a.active {
                background-color: #8484cc;
                color: white;
            }
            .img-circle{
                border: 1px solid #269abc;
            }
            .book a{
                text-decoration: none;
            }
            .book a > p{
                font-size: 1.1em;
                font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
                padding-right: 20px;
            }
            .book a > h5{
                color: red;
                font-weight: bold;
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
            <!-- neu ko chon 1 option nao` thi` se~ random ra cac quyen sach bat ki de hien thi -->
            <h2 class="text-uppercase text-center">Tìm kiếm sách</h2>
            <div class="container" style="margin-bottom: 3%;">
                <c:if test="${ empty requestScope.listB }">
                    <h3 style="color: red;">Không có sách phù hợp</h3>
                </c:if>
                <c:if test="${! empty requestScope.listB }">
                    Sắp xếp theo:
                    <select name="sort" onchange="myFunc(this)">
                        <option value="normal" ${requestScope.sort eq "normal"? "selected" : ""}>Phù hợp nhất</option>
                        <option value="desc" ${requestScope.sort eq "desc"? "selected" : ""}>Giá từ cao xuống thấp</option>
                        <option value="asc" ${requestScope.sort eq "asc"? "selected" : ""}>Giá từ thấp tới cao</option>
                    </select>
                    <div class="row" style="margin-bottom: 15px">
                        <c:forEach items="${requestScope.listPerPage}" var="b">
                            <div class="col-md-3 book">       
                                <a href="book_detail?bID=${b.bID}">
                                    <img src="${b.image}" alt="book_img" class="img-responsive">
                                    <p>${b.title}</p>
                                    <h5>Giá: <fmt:formatNumber type="number" maxFractionDigits="0" value="${b.price}" />
                                        VNĐ
                                    </h5>
                                    <div class="pop-up">
                                        <a class="btn btn-primary" href="buy?action=cart&bID=${b.bID}">Thêm vào giỏ hàng</a> <br>
                                        <a class="btn btn-primary" href="buy?action=now&bID=${b.bID}">Mua ngay</a>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                    <c:set var="curPage" value="${requestScope.curPage}" />
                    <c:set var="key" value="${requestScope.key}" />
                    <c:set var="NoPage" value="${requestScope.NoPage}" />
                    <c:set value="${requestScope.sort}" var="sort" />
                    <div class="pagination">   
                        <c:if test="${curPage!=1}">
                            <button class="img-circle" onclick='window.location = "search?curPage=${1}&key=${key}&sort=${sort}"'><i class="fas fa-angle-double-left fa-2x"></i></button>
                            <button class="img-circle" onclick='window.location = "search?curPage=${curPage-1}&key=${key}&sort=${sort}"'><i class="fas fa-angle-left fa-2x"></i></button>
                            </c:if>
                            <%--<c:forEach begin="1" end="${requestScope.NoPage}" var="i">--%>
                            <c:forEach begin="${curPage>=2?curPage-1:curPage}" end="${curPage+2>NoPage?NoPage:curPage+2}" var="i">
                            <a class="${i==curPage?"active":""}" href="search?curPage=${i}&key=${key}&sort=${sort}">${i}</a>
                        </c:forEach>
                        <c:if test="${curPage!=requestScope.NoPage}">
                            <button class="img-circle" onclick='window.location = "search?curPage=${curPage+1}&key=${key}&sort=${sort}"'><i class="fas fa-angle-right fa-2x"></i></button>
                            <button class="img-circle" onclick='window.location = "search?curPage=${requestScope.NoPage}&key=${key}&sort=${sort}"'><i class="fas fa-angle-double-right fa-2x"></i></button>
                            </c:if>                   
                    </div>
                </c:if>

            </div>
        </main>

        <%@include file="footer.jsp" %>
        <script>
            function myFunc(x) {
                var y = x.value;
                window.location = "search?key=${key}&sort=" + y;
            }
        </script>
    </body>
</html>
