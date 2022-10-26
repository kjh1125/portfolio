<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="port.Database_Information"%>


<%
try{
Database_Information d = new Database_Information();
Connection con = d.cafe24();
String a[] = request.getQueryString().split("=");
String b = a[0];
String update =null;
String sql = null;
PreparedStatement ps = null;

if(b.equals("adminupdate")){
	update = request.getParameter("adminupdate");
	sql = "update admin set approve='Y' where idx = ?";
}


ps = con.prepareStatement(sql);
ps.setString(1, update);
int n = ps.executeUpdate();

con.close();
ps.close();


}
catch(Exception e){
	
	
}
%>