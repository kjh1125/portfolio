<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="port.Database_Information"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");
String idx = request.getParameter("idx");

Database_Information db = new Database_Information();
String sql = "select * from notice where idx="+idx;
PreparedStatement ps = null;
ResultSet rs = null;
ArrayList<Map<String,Object>> al = null;
Connection con = db.cafe24();
try{
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	al = new ArrayList();
	
	while(rs.next()){
		Map<String,Object> mp = new HashMap();
		mp.put("chk", rs.getString("chk"));
		mp.put("title", rs.getString("title"));
		mp.put("file", rs.getString("file"));
		mp.put("memo", rs.getString("memo"));
		mp.put("count", rs.getString("count"));
		al.add(mp);
	}

	
}
catch(Exception e){
	
}
%>