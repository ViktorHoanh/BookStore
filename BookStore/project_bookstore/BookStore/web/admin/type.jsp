<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý thể loại sách</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
    </head>
    <body>
        <h1>Thể loại sách</h1>
        <div style="margin-bottom: 30px; margin-top: 30px;">
            <a href="action?tag=type&action=1"><button type="button" class="btn btn-default">Thêm mới</button></a>
        </div>
        <div style="margin-left: 10px;">
            <table border="1px" width="30%">
                <tr>
                    <th>ID</th>
                    <th>Thể loại</th>
                    <th>Số lượng sách</th>
                </tr>
                <c:forEach items="${requestScope.listT}" var="t" varStatus="status">
                    <tr>
                        <td>${t.tID}</td>
                        <td>${t.tName}</td>
                        <td>
                            ${requestScope.listNoB[status.index]}
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        
        <br>
        <a href="<%=request.getContextPath()%>/admin_page">
            <button type="button" class="btn btn-primary">Trở về trang quản lý</button>
        </a>
        <script src="<%=request.getContextPath()%>/js/Jquery.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    </body>
</html>
