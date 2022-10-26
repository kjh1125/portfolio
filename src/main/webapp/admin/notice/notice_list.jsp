<%@page import="port.Database_Information"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%


request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=utf-8");

int pageview = 10; // 한페이지당 보여주는 데이터 갯수
int startpage = 0; // 시작페이지 값
int pagenumber = 1; // 페이징 갯수

String pgno = request.getParameter("page")==null?"0":request.getParameter("page");

PreparedStatement psct = null;
PreparedStatement ps = null;
List<Map<String, Object>> data = null;
List<Map<String, Object>> data1 = null;
Database_Information db = new Database_Information();
Connection con = null;
String sql = null;
String ct = "select count(*) as ct from notice";

int total = 0;
try {
	con = db.cafe24();
	psct = con.prepareStatement(ct);
	ResultSet rsct = psct.executeQuery();
	while (rsct.next()) {
		total = rsct.getInt("ct");
	}

	if (pgno == null || pgno == "0") {
		startpage = 0;
	} else {
		startpage = (Integer.parseInt(pgno) - 1) * pageview;
	}

	//페이징 총 갯수 파악
	if (total % pageview == 0) {
		pagenumber = total / pageview;
	} else {
		pagenumber = (total / pageview) + 1;
	}

	sql = "select * from notice where chk='no' order by idx desc limit " + startpage + "," + pageview; // 데이터 리스트
	ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	data = new ArrayList();
	
	while (rs.next()) {
		Map<String, Object> mp = new HashMap();
		mp.put("title", rs.getString("title"));
		mp.put("dt", rs.getString("dt"));
		mp.put("count", rs.getString("count"));
		mp.put("idx", rs.getString("idx"));
		data.add(mp);
	}
	sql = "select * from notice where chk='on' order by idx desc;";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	data1 = new ArrayList();
	
	while (rs.next()) {
		Map<String, Object> mp = new HashMap();
		mp.put("title", rs.getString("title"));
		mp.put("dt", rs.getString("dt"));
		mp.put("count", rs.getString("count"));
		mp.put("idx", rs.getString("idx"));
		data1.add(mp);
	}
	con.close();
} catch (Exception e) {

}
%>


<meta charset="UTF-8">
<p>공지사항 관리페이지</p>
<div class="subpage_view">
	<ul>
		<li><input type="checkbox" id = "allcheck" name="allcheck" onclick="check()"></li>
		<li>NO</li>
		<li>제목</li>
		<li>글쓴이</li>
		<li>날짜</li>
		<li>조회</li>
	</ul>

<%
int ww = 0;
while(ww<data1.size()){
	
		%>
		<ol>
		<li><input type="checkbox" name="check" value="<%=data1.get(ww).get("idx")%>"></li>
		<li>공지</li>
		<li onclick="view(<%=data1.get(ww).get("idx")%>)"><%=data1.get(ww).get("title")%></li>
		<li>관리자</li>
		<li><%=data1.get(ww).get("dt")%></li>
		<li><%=data1.get(ww).get("count")%></li>
	</ol>
		
		<%
	ww++;
}
%>

	<%
	int w = 0;
	int no = 0;
	while (w < data.size()) {
		no = total - data1.size() - startpage - w;
	%>
	<ol onmouseover=this.style.backgroundColor='#E0ffff' onmouseout=this.style.backgroundColor='#ffffff'>
		<li><input type="checkbox" name="check" value="<%=data.get(w).get("idx")%>"></li>
		<li><%=no%></li>
		<li onclick="view(<%=data.get(w).get("idx")%>)"><%=data.get(w).get("title")%></li>
		<li>관리자</li>
		<li><%=data.get(w).get("dt")%></li>
		<li><%=data.get(w).get("count")%></li>
	</ol>
	
	<%
	w++;
	} ;
	%>

	<%
	if (data.size() == 0) {
	%>

	<ol class="none_text">
		<li>등록된 공지 내용이 없습니다.</li>
	</ol>
	<%
	}
	%>

</div>

<div class="board_btn">
	<button class="border_del" onclick="del()">공지삭제</button>
	<button class="border_add" onclick=window.open("./admin_notice_write.jsp","_self")>공지등록</button>
</div>

<div class="border_page">
	<ul class="pageing">
		<%
		int pno = Integer.parseInt(pgno)-1;
		if(pno<=0){
		pno=1;	
		}
		%>
	
		<li onclick="pagego(1)"><img src="../ico/double_left.svg"></li>
		<li onclick="pagego(<%=pno%>)"><img src="../ico/left.svg"></li>
		<%
		int p = 1;
		while (p <= pagenumber) {
		%>
		<li onclick="pagego(<%=p%>)"><%=p%></li>
		<%
		p++;
		}
		%>
		<%
		int pno2 = Integer.parseInt(pgno)+1;
		if(pno2>pagenumber){
			pno2--;
		}
		%>
		<li onclick="pagego(<%=pno2%>)"><img src="../ico/right.svg"></li>
		<li onclick="pagego(<%=pagenumber%>)"><img src="../ico/double_right.svg"></li>
	</ul>
</div>

