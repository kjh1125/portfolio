<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@include file="./session.jsp"%>

<%
if(nm==null||nm==""||id==null||id==""){
	out.print("<script>alert('정상적이지 않은 접근입니다.');location.href='./index.jsp';</script>");
}	
%>

<meta charset="UTF-8">
<div class="header_div">
    <p onclick = window.open("/portfolio/admin/admin_main.jsp","_self")><img src="./img/logo.png" class="logo_sm" > ADMINISTRATOR</p>
    <p><%=id%> 관리자 <a href="/portfolio/admin/admin_info.jsp" style="color:white;">[개인정보 수정]</a> <a href="./logout.jsp" style="color:white;">[로그아웃]</a></p>
</div>