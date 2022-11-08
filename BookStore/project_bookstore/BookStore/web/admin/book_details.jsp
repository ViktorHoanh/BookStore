<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${requestScope.book.title}</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
    </head>
    <body>
        <c:set value="${requestScope.book}" var="b" />
        <div style="margin-left: 20px;">
            <h2>Chi tiết cuốn sách</h2>
            <ul>
                <img src="${b.image}" /> 
                <li>Tên sách: ${requestScope.book.title}</li>
                <li>Thể loại: ${b.t.tName}</li>
                <li>
                    Tác giả: 
                    <c:if test="${requestScope.listA.size()>=2}">
                        <c:forEach end="${requestScope.listA.size()-2}" items="${requestScope.listA}" var="a">
                            ${a.aName}, 
                        </c:forEach>
                    </c:if>
                    ${requestScope.listA.get(listA.size()-1).getaName()}
                </li>
                <c:if test="${requestScope.listTr.size()>0}">
                    <li>Dịch giả: 
                        <c:if test="${requestScope.listTr.size()>=2}">
                            <c:forEach end="${requestScope.listTr.size()-2}" items="${requestScope.listTr}" var="tr">
                                ${tr.trName},
                            </c:forEach>
                        </c:if>
                        ${requestScope.listTr.get(listTr.size()-1).getTrName()}
                    </li>
                </c:if>
                <li>Nhà xuất bản: ${b.p.pName}</li>
                <li>Số trang: ${b.noPage}</li>
                <li>Ngày phát hành: 
                    <fmt:parseDate value="${b.pubDate}" var="parsedDate" pattern="yyyy-MM-dd" />
                    <fmt:formatDate pattern="dd-MM-yyyy" value="${parsedDate}" />
                </li>
                <li>Số lượng sách đang có: ${b.quantity}</li>
                <li> Giá: 
                    <fmt:formatNumber type="number" maxFractionDigits="0" value="${b.price}" />
                    VNĐ
                </li>
                <li>Miêu tả: ${b.descrip}</li>
            </ul>

        </div>
        <script src="<%=request.getContextPath()%>/js/Jquery.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    </body>
</html>
