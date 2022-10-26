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
int total = 0;

// nullexception 방지
String pgno = request.getParameter("page")==null||request.getParameter("page").equals("undefined")?"0":request.getParameter("page");
String type = request.getParameter("type")==null?"":request.getParameter("type").intern();
String search = request.getParameter("search")==null?"":request.getParameter("search").intern();

PreparedStatement psct = null;
PreparedStatement ps = null;
List<Map<String, Object>> data = null;
Database_Information db = new Database_Information();
Connection con = null;
String sql = null;
String ct = null;

if(type=="catename"){
	if(search==""){
	ct = "select count(*) as ct from cate_list";
	}
	else{
	ct = "select count(*) as ct from cate_list where bcodenm like '%"+search+"%'";	
	}
}
else if (type=="catecode"){
	if(search==""){
		ct = "select count(*) as ct from cate_list";
		}
		else{
		ct = "select count(*) as ct from cate_list where code like '%"+search+"%'";	
		}
}
else{
	ct = "select count(*) as ct from cate_list";
}


try {
	con = db.cafe24();
	psct = con.prepareStatement(ct);
	ResultSet rsct = psct.executeQuery();
	while (rsct.next()) {
		total = rsct.getInt("ct");
	}

	if (pgno == "0") {
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

	if(type=="catename"){
		if(search==""){
		sql = "select * from cate_list order by idx desc limit " + startpage + "," + pageview;
		}
		else{
		sql = "select * from cate_list where bcodenm like '%"+search+"%' order by idx desc limit " + startpage + "," + pageview;	
		}
	}
	else if (type=="catecode"){
		if(search==""){
	sql = "select * from cate_list order by idx desc limit " + startpage + "," + pageview;
	}
	else{
	sql = "select * from cate_list where code like '%"+search+"%' order by idx desc limit " + startpage + "," + pageview;
	}
	}
	else{
		sql = "select * from cate_list order by idx desc limit " + startpage + "," + pageview;
	}
	
	ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	data = new ArrayList();
	
	while (rs.next()) {
		Map<String, Object> mp = new HashMap();
		mp.put("idx", rs.getString("idx"));
		mp.put("code", rs.getString("code"));
		mp.put("bcode", rs.getString("bcode"));
		mp.put("bcodenm", rs.getString("bcodenm"));
		mp.put("scode", rs.getString("scode"));
		mp.put("scodenm", rs.getString("scodenm"));
		mp.put("cuse", rs.getString("cuse"));
		data.add(mp);
	}
	con.close();
} catch (Exception e) {

}
%>

<meta charset="UTF-8">
<p>카테고리관리 페이지</p>
<div class="subpage_view">
    <span>등록된 카테고리 <%=total%>건</span>
    <span>
        <form>
        <select class="p_select1" id="searchcategory">
            <option value="catename" <%if(type.equals("catename")){out.print("selected");};%>>카테고리명</option>
            <option value="catecode" <%if(type.equals("catecode")){out.print("selected");};%>>카테고리코드</option>
        </select>
        <input type="text" class="p_input1" placeholder="검색어를 입력해 주세요" name="stext" id="stext" value="<%=search%>">
        <input type="button" value="검색" title="카테고리 검색" class="p_submit" onclick="pagego()">
        </form>
    </span>
</div>
<div class="subpage_view2">
    <ul>
        <li><input type="checkbox" id = "allcheck" name="allcheck" onclick="check()"></li>
        <li>분류코드</li>
        <li>대메뉴 코드</li>
        <li>대메뉴명</li>
        <li>소메뉴 코드</li>
        <li>소메뉴명</li>
        <li>사용 유/무</li>
        <li>관리</li>
    </ul>
    <%
	int w = 0;
	int no = 0;
	while (w < data.size()) {
		no = total - startpage - w;
	%>
    <ul>
        <li><input type="checkbox" name="check" value='<%=data.get(w).get("idx")%>'></li>
        <li style="text-align: left; text-indent: 5px;"><%=data.get(w).get("code")%></li>
        <li><%=data.get(w).get("bcode")%></li>
        <li style="text-align: left; text-indent: 5px;"><%=data.get(w).get("bcodenm")%></li>
        <li><%=data.get(w).get("scode")%></li>
        <li style="text-align: left; text-indent: 5px;"><%=data.get(w).get("scodenm")%></li>
        <li><%=data.get(w).get("cuse")%></li>
        <li>[수정]</li>
    </ul>
    <%
	w++;
	} ;
	%>
    <%
	if (data.size() == 0) {
	%>
    <ul>
        <li style="width: 100%;">등록된 카테고리가 없습니다.</li>
    </ul>
    <%
	}
	%>
</div>
<div class="subpage_view3">
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
<div class="subpage_view4">
    <input type="button" value="카테고리 삭제" title="카테고리 삭제" class="p_button" onclick="del()">
    <span style="float: right;">
    <input type="button" value="상품 리스트" title="상품 리스트" class="p_button p_button_color1" onclick = window.open("./admin_product.jsp","_self")>
    <input type="button" value="카테고리 등록" title="카테고리 등록" class="p_button p_button_color2" onclick = window.open("./admin_category_write.jsp","_self")>
    </span>
</div>

