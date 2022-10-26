<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="port.Database_Information"%>

<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");
String id1 = (String)session.getAttribute("id");

Database_Information db = new Database_Information();
String sql = "select * from admin where id='" + id1 + "'";
PreparedStatement ps = null;
ResultSet rs = null;
ArrayList<Map<String, Object>> al = null;
Connection con = db.cafe24();
try {
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	al = new ArrayList();

	while (rs.next()) {
		Map<String, Object> mp = new HashMap();
		mp.put("idx", rs.getString("idx"));
		mp.put("name", rs.getString("name"));
		mp.put("email", rs.getString("email"));
		mp.put("tel", rs.getString("tel"));
		mp.put("depart", rs.getString("depart"));
		mp.put("position", rs.getString("position"));
		mp.put("approve", rs.getString("approve"));
		al.add(mp);
	}

} catch (Exception e) {

}
%>

<div class="admin_login_add">
	<ul>
		<li class="font_color1">관리자 정보 수정</li>
		<li><input type="text" class="add_input1" name="id" value="<%=id1%>" readonly></li>
		<li><input type="text" class="add_input1" placeholder="변경할 패스워드를 입력하세요" name="pw1"> 
		<input type="text" class="add_input1" placeholder="동일한 패스워드를 입력하세요" name="pw2"></li>
		<li class="font_color1">관리자 기본정보 입력</li>
		<li><input type="text" class="add_input1" name="name"
			value="<%=al.get(0).get("name")%>"></li>
		<li><input type="text" class="add_input1 emails" name="email"
			value="<%=al.get(0).get("email")%>"></li>
		<li class="font_color1">
			<%
			String totaltel = (String) al.get(0).get("tel");
			String tel1 = totaltel.substring(0, 3);
			String tel2 = totaltel.substring(3, 7);
			String tel3 = totaltel.substring(7, 11);
			%> <input type="text" class="add_input1 hp1" maxlength="3"
			name="tel1" value="<%=tel1%>" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> - <input type="text"
			class="add_input1 hp2" maxlength="4" name="tel2" value="<%=tel2%>" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			- <input type="text" class="add_input1 hp2" maxlength="4" name="tel3"
			value="<%=tel3%>" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
		</li>
		<li class="font_color1">관리자 담당부서 및 직책</li>
		<li><select class="add_select1" name="depart">
				<option value="0">담당자 부서를 선택하세요</option>
				<option value="1">임원</option>
				<option value="2">전산팀</option>
				<option value="3">디자인팀</option>
				<option value="4">CS팀</option>
				<option value="5">MD팀</option>
		</select> <select class="add_select1" name="position">
				<option value="0">담당자 직책을 선택하세요</option>
				<option value="1">대표</option>
				<option value="2">부장</option>
				<option value="3">팀장</option>
				<option value="4">과장</option>
				<option value="5">대리</option>
				<option value="6">사원</option>
		</select></li>
		<li class="font_color1">※ 아이디 외에 모든 정보는 수정 할 수 있습니다.</li>
	</ul>
	<span class="admin_addbtn">
		<button type="button" class="btn_button btncolor1" title="관리자 등록" onclick="revise();")>정보
			수정</button>
	</span>
</div>