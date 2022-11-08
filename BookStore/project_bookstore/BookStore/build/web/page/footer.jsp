<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<footer>
    <section>
        <div class="row bot-nav">
            <div class="col-md-3">
                <ul>
                    <li>
                        <a href="<%=request.getContextPath()%>/info?tag=lien_he">Liên hệ</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/info?tag=huong_dan">Hướng dẫn đặt hàng</a>
                    </li>
                </ul>
            </div>
            <div class="col-md-3">
                <ul>
                    <li>
                        <a href="<%=request.getContextPath()%>/info?tag=van_chuyen">Chính sách vận chuyển</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/info?tag=bao_mat">Chính sách bảo mật</a>
                    </li>
                </ul>
            </div>
            <div class="col-md-3 col-md-offset-3" style="padding-top: 30px;">
                <a href="https://www.facebook.com/"><i class="fab fa-facebook-square fa-3x"></i></a>
                <a href="https://www.youtube.com/"><i class="fab fa-youtube fa-3x"></i></a>
                <a href="https://www.instagram.com/?hl=en"><i class="fab fa-instagram fa-3x"></i></a>
            </div>
        </div>
        <!-- </div> -->
    </section>
    <section class="text-center copyright">
        <p>&#169 <fmt:formatDate pattern="yyyy" value="<%= new java.util.Date() %>" />
            - Bản quyền thuộc về Công ty TNHH 1 thành viên Hoanh</p>
        <p>Nhận đặt hàng trực tuyến và giao hàng tận nơi</p>
        <p>Uy tín, chất lượng</p>
        <p>Trang sách online số 1 Việt Nam</p>
    </section>
</footer>
<script src="<%=request.getContextPath()%>/js/Jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>