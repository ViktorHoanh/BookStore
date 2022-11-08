<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<header>
    <div class="row text-uppercase top-nav">
        <div class="col-md-6">
            <a href="<%=request.getContextPath()%>/home">Trang chủ</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
            <a href="<%=request.getContextPath()%>/info?tag=gioi_thieu">Giới thiệu</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
            <a href="<%=request.getContextPath()%>/history">Lịch sử giao dịch</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <c:if test="${sessionScope.acc.role==1}">
                |&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/admin_page">Quản lý trang</a>
            </c:if>
        </div>
        <c:if test="${sessionScope.acc==null}">
            <div class="col-md-4 col-md-offset-2">
                <a href="<%=request.getContextPath()%>/register">Đăng kí</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                <a href="<%=request.getContextPath()%>/login">Đăng nhập</a>
            </div>
        </c:if>
        <c:if test="${sessionScope.acc!=null}">
            <div class="col-md-4 col-md-offset-2">
                <a href="<%=request.getContextPath()%>/account" style="font-size: 0.8em; color: blue;">Xin chào ${sessionScope.acc.user}</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                <a href="<%=request.getContextPath()%>/logout">Đăng xuất</a>
            </div>
        </c:if>
    </div>

    <div class="row logo-search-cart">
        <div class="col-md-2">
            <a href="<%=request.getContextPath()%>/home"><img src="<%=request.getContextPath()%>/images/logo.png" alt="logo_web" height="100px" width="100px" class="img-circle"></a>
        </div>
        <div class="col-md-5 text-uppercase">
            <h3>Bởi vì sách là cả thế giới</h3>
        </div>
        <div class="col-md-4 search-cart">
            <div class="search">
                <form action="search">
                    <input type="text" name="key" value="${requestScope.key}" placeholder="Tìm kiếm sách ...">
                    <button type="submit"><i class="fas fa-search"></i></button>
                </form>
            </div>
            <div class="cart">
                <a href="<%=request.getContextPath()%>/cart_process"><i class="fas fa-shopping-cart fa-2x"></i></a>
                <p id="in-cart">${sessionScope.NoItem}</p>
            </div>
        </div>
    </div>

    <div class="row text-uppercase main-nav">
        <div class="col-md-3 dropdown">
            <h4 class="dropdown-toggle" type="button" data-toggle="dropdown">Danh mục sách</h4>
            <ul class="dropdown-menu">
                <!-- href cua a se la` servlet?typeID=... -->
                <jsp:useBean id="listT" class="dal.TypeDAO" />
                <c:forEach items="${listT.allType}" var="t">
                    <li><a href="search_tag?tag=type&id=${t.tID}">${t.tName}</a></li>
                    </c:forEach>              
            </ul>
        </div>
        <div class="col-md-3">
            <a href="search_tag?tag=sell"><h4>Sách bán chạy</h4></a>
        </div>
        <div class="col-md-3">
            <a href="search_tag?tag=new"><h4>Sách mới</h4></a>
        </div>
        <div class="col-md-3 dropdown">
            <h4 class="dropdown-toggle" type="button" data-toggle="dropdown">nhà xuất bản</h4>
            <ul class="dropdown-menu">
                <jsp:useBean id="listP" class="dal.PubDAO" />
                <c:forEach items="${listP.allPub}" var="p">
                    <li><a href="search_tag?tag=pub&id=${p.pID}">${p.pName}</a></li>
                    </c:forEach>
            </ul>
        </div>
    </div>
</header>
