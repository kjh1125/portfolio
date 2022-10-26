<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* session.removeAttribute("nm");
session.removeAttribute("id");*/

// Session 정보 일괄 삭제
session.invalidate();

out.print("<script>alert('정상적으로 로그아웃 되었습니다.');location.href='./index.jsp';</script>");
%>