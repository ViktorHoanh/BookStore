<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm sách</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
        <script src="https://kit.fontawesome.com/7334cbdae0.js" crossorigin="anonymous"></script>
        <script src="//cdn.ckeditor.com/4.17.2/standard/ckeditor.js"></script> 
        <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/logo.png">
    </head>
    <body>
        <h2>Thêm sách mới</h2>
        <div style="margin-left: 20px;">
            <form action="add_book" method="post">
                <table>
                    <tr>
                        <td>ID:</td>
                        <td><input type="text" name="bID" required></td>
                    </tr>
                    <tr>
                        <td>Ảnh:</td>
                        <td><input type="text" name="image" required></td>
                    </tr>
                    <tr>
                        <td>Tên sách:</td>
                        <td><input type="text" name="title" required></td>
                    </tr>
                    <tr>
                        <td>Thể loại:</td>
                        <jsp:useBean id="listT" class="dal.TypeDAO" />
                        <td>
                            <select name="tID">
                                <c:forEach items="${listT.allType}" var="t">
                                    <option value="${t.tID}">${t.tName}</option>
                                </c:forEach>
                            </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="add?tag=type">Thể loại khác</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Tác giả:</td>
                        <jsp:useBean id="listA" class="dal.AuthorDAO" />
                        <td>               
                            <select name="aID">
                                <c:forEach items="${listA.allAuthor}" var="a">
                                    <option value="${a.aID}">${a.aName}</option>
                                </c:forEach>
                            </select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="add?tag=author">Tác giả khác</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Dịch giả:</td>
                        <jsp:useBean id="listTr" class="dal.TranslatorDAO" />
                        <td>
                            <select name="trID">
                                <option value="0">Không có dịch giả</option>
                                <c:forEach items="${listTr.allTrans}" var="tr">                  
                                    <option value="${tr.trID}">${tr.trName}</option>
                                </c:forEach>  
                            </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="add?tag=trans">Dịch giả khác</a>
                        </td>
                    </tr>
                    <tr>
                        <td>Nhà xuất bản: </td>
                        <jsp:useBean id="listP" class="dal.PubDAO" />
                        <td>
                            <select name="pID">
                                <c:forEach items="${listP.allPub}" var="p">
                                    <option value="${p.pID}">${p.pName}</option>
                                </c:forEach>
                            </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="add?tag=publish">NXB khác</a>
                        </td>
                    </tr>
                    <tr>
                        <td> Số trang:</td>
                        <td><input type="text" name="no_page" required></td>
                    </tr>
                    <tr>
                        <td>Ngày phát hành:</td>
                        <td><input type="date" name="pub_date" required></td>
                    </tr>
                    <tr>
                        <td>Số lượng:</td>
                        <td><input type="text" name="quantity" required></td>
                    </tr>
                    <tr>
                        <td>Giá:</td>
                        <td><input type="text" name="price" required></td>
                    </tr>
                    <tr>
                        <td>Miêu tả</td>
                        <td><textarea name="describe" cols="50" rows="5" id="describe" required></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" value="Thêm mới"></td>
                    </tr>
                </table>
            </form>

        </div>
        
                        
        <script>
            CKEDITOR.replace('describe');
        </script>
        <script src="<%=request.getContextPath()%>/js/Jquery.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    </body>
</html>
