<%@page import="java.sql.*"%>
<%@page import="port.Database_Information"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
request.setCharacterEncoding("UTF-8");
%>
<%
try{
Database_Information d = new Database_Information();
Connection con = d.cafe24();
String a[] = request.getQueryString().split("=");
String b = a[0];
String del = null;
String sql = null;
PreparedStatement ps = null;

if(b.equals("catedel")){
	del = request.getParameter("catedel");
	sql = "delete from cate_list where idx = ?";
}
else if(b.equals("noticedel")){
	del = request.getParameter("noticedel");
	sql = "delete from notice where idx = ?";
}
else if(b.equals("noticeview")){
	del = request.getParameter("noticeview");
	sql = "delete from notice where idx = ?";
	
}
else if(b.equals("productdel")){
	del = request.getParameter("productdel");
	sql = "delete from product_list where idx = ?";
	
}
else if(b.equals("admindel")){
	del = request.getParameter("admindel");
	sql = "delete from admin where idx = ?";
	
}
else if(b.equals("coupon")){
	del = request.getParameter("coupon");
	sql = "delete from newcoupon where idx = ?";
	
}


String del1[] = del.split(",");


int w = 0;
while(w<del.length()){
	
ps = con.prepareStatement(sql);
ps.setString(1, del1[w]);
int n = ps.executeUpdate();
w++;
}

con.close();
ps.close();
}
catch(Exception e){
	
}
%>