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
            <h2>Chỉnh sửa thông tin sách</h2>
            <form action="update?tag=book" method="post">
                <table>
                    <tr>
                        <td>ID:</td>
                        <td><input type="text" name="id" value="${b.bID}" readonly></td>
                    </tr>
                    <tr>
                        <td>Ảnh:</td>
                        <td><input type="text" name="image" value="${b.image}"></td>
                    </tr>
                    <tr>
                        <td>Tên sách:</td>
                        <td><input type="text" name="title" value="${b.title}"></td>
                    </tr>
                    <tr>
                        <td>Thể loại:</td>
                        <td><input type="text" name="type" value="${b.t.tName}"></td>
                    </tr>
                    <tr>
                        <td>Tác giả:</td>
                        <td>
                            <c:forEach items="${requestScope.listA}" var="a">                  
                                <input type="text" name="authors" value="${a.aName}" readonly>
                            </c:forEach>       
                        </td>
                    </tr>
                    <tr>
                        <td>Dịch giả:</td>
                        <td>
                            <c:forEach items="${requestScope.listTr}" var="tr">                  
                                <input type="text" name="trans" value="${tr.trName}" readonly>
                            </c:forEach>   
                        </td>
                    </tr>
                    <tr>
                        <td>Nhà xuất bản: </td>
                        <td><input type="text" name="publisher" value="${b.p.pName}" readonly></td>
                    </tr>
                    <tr>
                        <td> Số trang:</td>
                        <td><input type="text" name="no_page" value="${b.noPage}"></td>
                    </tr>
                    <tr>
                        <td>Ngày phát hành:</td>
                        <td><input type="date" name="pub_date" value="${b.pubDate}"></td>
                    </tr>
                    <tr>
                        <td>Số lượng:</td>
                        <td><input type="text" name="quantity" value="${b.quantity}"></td>
                    </tr>
                    <tr>
                        <td>Giá:</td>
                        <td><input type="text" name="price" value="${b.price}"></td>
                    </tr>
                    <tr>
                        <td>Miêu tả</td>
                        <td><textarea name="describe" cols="50" rows="5">${b.descrip}</textarea><br></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Chỉnh sửa"></td>
                    </tr>
                </table>
            </form>

        </div>

        <script src="<%=request.getContextPath()%>/js/Jquery.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    </body>
</html>
