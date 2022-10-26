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
String id1 = (String)session.getAttribute("id");

Database_Information db = new Database_Information();
String sql = "select * from admin order by idx";
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
		mp.put("idx", rs.getString("idx"));
		mp.put("name", rs.getString("name"));
		mp.put("id", rs.getString("id"));
		mp.put("tel", rs.getString("tel"));
		mp.put("email", rs.getString("email"));
		mp.put("depart", rs.getString("depart"));
		mp.put("position", rs.getString("position"));
		mp.put("dt", rs.getString("dt").substring(0, 10));
		mp.put("approve", rs.getString("approve"));
		al.add(mp);
	}
	
}
catch(Exception e){
	
}
%>


<meta charset="UTF-8">
<p>신규등록 관리자</p>
<ol class="new_admin_title">
    <li>NO</li>
    <li>관리자명</li>
    <li>아이디</li>
    <li>전화번호</li>
    <li>이메일</li>
    <li>담당부서</li>
    <li>담당직책</li>
    <li>가입일자</li>
    <li>승인여부</li>
</ol>

<%
int w = 0;
int ww = 1;
int e = 0;
String depart ="";
String position ="";
String n = "";
while(w<al.size()){
	
	if(!al.get(w).get("approve").equals("Y")&&id1.equals("admin")){
		e++;
		n = (String)al.get(w).get("depart");
		switch(n){
		case "1":
			depart = "임원";
		break;
		case "2":
			depart = "전산팀";
		break;
		case "3":
			depart = "디자인팀";
		break;
		case "4":
			depart = "CS팀";
		break;
		case "5":
			depart = "MD팀";
		break;
		
		}
		
		n = (String)al.get(w).get("position");
		switch(n){
		case "1":
			position = "대표";
		break;
		case "2":
			position = "부장";
		break;
		case "3":
			position = "팀장";
		break;
		case "4":
			position = "과장";
		break;
		case "5":
			position = "대리";
		break;
		case "6":
			position = "사원";
		break;
		
		}
		
%>
<ol class="new_admin_lists">
    <li><%=ww %></li>
    <li><%=al.get(w).get("name") %></li>
    <li><%=al.get(w).get("id") %></li>
    <li><%=al.get(w).get("tel") %></li>
    <li><%=al.get(w).get("email") %></li>
    <li><%=depart%></li>
    <li><%=position%></li>
    <li><%=al.get(w).get("dt")%></li>
    <li>
        <input type="button" value="승인" class="new_addbtn1" title="승인" onclick="update(<%=al.get(w).get("idx") %>)">
        <input type="button" value="미승인" class="new_addbtn2" title="미승인" onclick="del(<%=al.get(w).get("idx") %>)">
    </li>
</ol>
<%
	ww++;}
w++;}%>

<% if(e==0){ %>
<ol class="new_admin_none">
    <li>신규 등록된 관리자가 없습니다.</li>
</ol>
<%}; %>