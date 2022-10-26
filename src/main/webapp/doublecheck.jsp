<%@page import="java.sql.*"%>
<%@page import="port.Database_Information"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%
request.setCharacterEncoding("UTF-8");
%>
<%
Database_Information d = new Database_Information();
Connection con = d.cafe24();

String a[] = request.getQueryString().split("=");
String b = a[0];
String id = null;
String sql = null;

if(b.equals("id")){
id = request.getParameter("id").intern();
sql = "select * from admin where id ='"+id+"'";
}
else if(b.equals("productnum")){
id = request.getParameter("productnum").intern();
sql = "select * from product_list where pcode ="+id;
}
else if(b.equals("customerid")){
id = request.getParameter("customerid").intern();
sql = "select * from customer where id ='"+id+"'";
}

PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
JSONObject js = new JSONObject();
JSONArray ar = new JSONArray(); 


if(rs.next()==false){
	js.put("result","yes");
	ar.add(js);

	out.print(ar);
}
else{
	js.put("result","no");
	ar.add(js);

	out.print(ar);
}

con.close();
rs.close();
%>