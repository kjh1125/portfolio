<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String nm = (String)session.getAttribute("nm");
String id = (String)session.getAttribute("id");

session.setMaxInactiveInterval(60*60); //세션 자동 종료시간 설정 (1시간)


%>
