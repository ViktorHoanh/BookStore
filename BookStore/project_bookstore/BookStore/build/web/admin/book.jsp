<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý sách</title>
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
        <div>
            <h3>Tổng quan</h3>
            <p>Số đầu sách hiện có: ${requestScope.size}</p>
            <p>Số lượng cuốn sách đang có: ${requestScope.totalBook}</p>
        </div>
        <div style="margin-bottom: 30px; margin-top: 30px;">
            <a href="action?tag=book&action=3"><button type="button" class="btn btn-default">Thêm mới</button></a>
        </div>
        <div style="margin-left: 10px;">
            <table border="1px" width="95%">
                <tr>
                    <th>ID</th>
                    <th>Tên sách</th>
                    <th>Thể loại</th>
                    <th>Giá tiền</th>
                    <th>Số lượng</th>
                    <th>Thao tác</th>
                </tr>
                <c:forEach items="${requestScope.listPerPage}" var="b">
                    <tr>
                        <td>${b.bID}</td>
                        <td>${b.title}</td>
                        <td>${b.t.tName}</td>
                        <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${b.price}" /></td>
                        <td>${b.quantity}</td>
                        <td style="width: 400px;">
                            <a href="action?tag=book&action=1&id=${b.bID}" style=" padding-left: 30px;"><button class="btn btn-success">Chi tiết</button></a>
                            <a href="action?tag=book&action=2&id=${b.bID}" style="padding-right: 30px; padding-left: 30px;"><button class="btn btn-success">Chỉnh sửa</button></a>
                            <a href="#" onclick="doDelete(${b.bID})" class="btn btn-success">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <c:set var="curPage" value="${requestScope.curPage}" />
            <c:set var="NoPage" value="${requestScope.NoPage}" />
            <div class="pagination">   
                <c:if test="${curPage!=1}">
                    <button class="img-circle" onclick='window.location = "book?curPage=${1}"'><i class="fas fa-angle-double-left fa-2x"></i></button>
                    <button class="img-circle" onclick='window.location = "book?curPage=${curPage-1}"'><i class="fas fa-angle-left fa-2x"></i></button>
                    </c:if>
                    <%--<c:forEach begin="1" end="${requestScope.NoPage}" var="i">--%>
                    <c:forEach begin="${curPage>=2?curPage-1:curPage}" end="${curPage+2>NoPage?NoPage:curPage+2}" var="i">
                    <a class="${i==curPage?"active":""}" href="book?curPage=${i}">${i}</a>
                </c:forEach>
                <c:if test="${curPage!=requestScope.NoPage}">
                    <button class="img-circle" onclick='window.location = "book?curPage=${curPage+1}"'><i class="fas fa-angle-right fa-2x"></i></button>
                    <button class="img-circle" onclick='window.location = "book?curPage=${requestScope.NoPage}"'><i class="fas fa-angle-double-right fa-2x"></i></button>
                    </c:if>                   
            </div>
        </div>

        <a href="<%=request.getContextPath()%>/admin_page">
            <button type="button" class="btn btn-primary">Trở về trang quản lý</button>
        </a>
        <script>
            function doDelete(id) {
                if (confirm("Are you sure to delete this book with id=" + id + " ?")) {
                    window.location = "delete?tag=book&id=" + id;
                }
            }
        </script>
        <script src="<%=request.getContextPath()%>/js/Jquery.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    </body>
</html>
