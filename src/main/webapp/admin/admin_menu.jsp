<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<meta charset="UTF-8">
<div class="nav_div">
    <ol>
        <li title="쇼핑몰 기본설정" onclick = window.open("/portfolio/admin/config/admin_config.jsp","_self")>쇼핑몰 기본설정</li>
        <li title="회원관리">회원관리</li>
        <li title="공지사항" onclick = window.open("/portfolio/admin/notice/admin_notice.jsp","_self")>공지사항</li>
        <li title="쇼핑몰관리" onclick = window.open("/portfolio/admin/manage/admin_shopping.jsp","_self")>쇼핑몰관리</li>
        <li title="상품리스트" onclick = window.open("/portfolio/admin/product/admin_product.jsp","_self")>상품리스트</li>
        <li title="주문내역">주문내역</li>
        <li title="매출내역">매출내역</li>
    </ol>
</div>