<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý đơn hàng</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
    </head>
    <body>
        <!--Cập nhật = insert thêm 1 row mới vào Order_Status-->
        <h1>Cập nhật</h1>
        <c:set value="${requestScope.order}" var="o" />
        <div style="margin-left: 20px;">
            <form action="update?tag=order" method="post">
                <ul>
                    <li>Mã đơn hàng: <input type="text" name="oID" value="${o.oID}" readonly> </li>
                    <li>Tài khoản: <input type="text" name="user" value="${o.user.user}" readonly> </li>
                    <li>Ngày đặt hàng:<input type="date" name="oDate" value="${o.oDate}" readonly></li>
                    <li>Tên khách hàng:<input type="text" name="cusName" value="${o.cusName}" readonly></li>
                    <li>SĐT:<input type="text" name="cusPhone" value="${o.cusPhone}" readonly> </li>
                    <li>Địa chỉ:<input type="text" name="cusAddr" value="${o.cusAddr}" readonly></li>
                    <li>Email:<input type="text" name="cusEmail" value="${o.cusEmail}" readonly></li>
                    <li>Phương thức giao hàng: <input type="text" name="shID" value="${o.s.shName}" readonly></li>
                    <li>Trạng thái đơn hàng hiện tại: ${requestScope.currentOS.s.sValue}</li>  
                    <li>Cập nhật trạng thái đơn hàng: 
                        <jsp:useBean id="listS" class="dal.OrderDAO" />
                        <select name="sID">
                            <c:forEach items="${listS.allStatus}" var="s">
                                <option value="${s.sID}">${s.sValue}</option>
                            </c:forEach>
                        </select>
                    </li>
                </ul>
                        <input type="submit" value="Cập nhật">
            </form>
        </div>

        <script src="<%=request.getContextPath()%>/js/Jquery.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    </body>
</html>
