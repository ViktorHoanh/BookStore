<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý đơn hàng</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
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
        </style>
    </head>
    <body>
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
        <h1>Quản lý đơn hàng</h1>
        <div style="margin-left: 10px;">
            <table border="1px" width="95%">
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Tài khoản</th>
                    <th>Tên khách hàng</th>
                    <th>Số điện thoại</th>
                    <th>Ngày đặt hàng</th>
                    <th>Thao tác</th>
                </tr>
                <c:forEach items="${requestScope.listPerPage}" var="o">
                    <tr>
                        <td>${o.oID}</td>
                        <td>${o.user.user}</td>
                        <td>${o.cusName}</td>
                        <td>${o.cusPhone}</td>
                        <td>${o.oDate}</td>
                        <td style="width: 300px;">
                            <a href="action?tag=order&action=1&id=${o.oID}" style=" padding-left: 30px;"><button class="btn btn-success">Chi tiết</button></a>
                            <a href="action?tag=order&action=2&id=${o.oID}" style="padding-right: 30px; padding-left: 30px;"><button class="btn btn-success">Cập nhật</button></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <c:set var="curPage" value="${requestScope.curPage}" />
            <c:set var="NoPage" value="${requestScope.NoPage}" />
            <div class="pagination">   
                <c:if test="${curPage!=1}">
                    <button class="img-circle" onclick='window.location = "order?curPage=${1}"'><i class="fas fa-angle-double-left fa-2x"></i></button>
                    <button class="img-circle" onclick='window.location = "order?curPage=${curPage-1}"'><i class="fas fa-angle-left fa-2x"></i></button>
                    </c:if>
                    <%--<c:forEach begin="1" end="${requestScope.NoPage}" var="i">--%>
                    <c:forEach begin="${curPage>=2?curPage-1:curPage}" end="${curPage+2>NoPage?NoPage:curPage+2}" var="i">
                    <a class="${i==curPage?"active":""}" href="order?curPage=${i}">${i}</a>
                </c:forEach>
                <c:if test="${curPage!=requestScope.NoPage}">
                    <button class="img-circle" onclick='window.location = "order?curPage=${curPage+1}"'><i class="fas fa-angle-right fa-2x"></i></button>
                    <button class="img-circle" onclick='window.location = "order?curPage=${requestScope.NoPage}"'><i class="fas fa-angle-double-right fa-2x"></i></button>
                    </c:if>                   
            </div>
        </div>
        <jsp:useBean id="od" class="dal.OrderDAO" />
        <c:set var="listO" value="${requestScope.listO}" />
        <div style="margin-left: 20px; margin-bottom: 20px">
            <h2>Thông tin tổng hợp</h2>
            <table border="1px" width="20%" >
                <tr>
                    <td>Số đơn hàng đang xử lý</td>
                    <td>${od.getOrderByStatus(listO, 2).size()}</td>
                </tr>
                <tr>
                    <td>Số đơn hàng đang vận chuyển</td>
                    <td>${od.getOrderByStatus(listO, 3).size()}</td>
                </tr>
                <tr>
                    <td>Số đơn hàng đã giao</td>
                    <td>${od.getOrderByStatus(listO, 4).size()}</td>
                </tr>
                <tr>
                    <td>Số đơn đã hủy</td>
                    <td>${od.getOrderByStatus(listO, 5).size()}</td>
                </tr>
            </table>
        </div>           
        <a href="<%=request.getContextPath()%>/admin_page">
            <button type="button" class="btn btn-primary">Trở về trang quản lý</button>
        </a>
        <script src="<%=request.getContextPath()%>/js/Jquery.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    </body>
</html>
