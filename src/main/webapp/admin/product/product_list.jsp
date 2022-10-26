<%@page import="port.Database_Information"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%

request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=utf-8");

int pageview = 10; // 한페이지당 보여주는 데이터 갯수
int startpage = 0; // 시작페이지 값
int pagenumber = 1; // 페이징 갯수
int total = 0;
String pgno = request.getParameter("page")==null||request.getParameter("page").equals("undefined")?"0":request.getParameter("page").intern();
String type =  request.getParameter("type")==null?"":request.getParameter("type").intern();
String search1 = request.getParameter("search")==null?"":request.getParameter("search").intern();

String ct = null;
PreparedStatement psct = null;
PreparedStatement ps = null;
List<Map<String, Object>> data = null;
Database_Information db = new Database_Information();
Connection con = null;
String sql = null;

if(type=="title"){
	if(search1==""){
	ct = "select count(*) as ct1 from product_list";
	}
	else{
	ct = "select count(*) as ct1 from product_list where pnm like '%"+search1+"%'";	
	}
}
else if (type=="code"){
	if(search1==""){
		ct = "select count(*) as ct1 from product_list";
		}
		else{
		ct = "select count(*) as ct1 from product_list where pcode like '%"+search1+"%'";	
		}
}
else{
	ct = "select count(*) as ct1 from product_list";	
}


try {
	con = db.cafe24();
	psct = con.prepareStatement(ct);
	ResultSet rsct = psct.executeQuery();
	while (rsct.next()) {
		total = rsct.getInt("ct1");
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

	
	if(type=="title"){
		if(search1==""){
		sql = "select * from product_list order by idx desc limit " + startpage + "," + pageview;
		}
		else{
		sql = "select * from product_list where pnm like '%"+search1+"%' order by idx desc limit " + startpage + "," + pageview;	
		}
	}
	else if (type=="code"){
		if(search1==""){
	sql = "select * from product_list order by idx desc limit " + startpage + "," + pageview;
	}
	else{
	sql = "select * from product_list where pcode like '%"+search1+"%' order by idx desc limit " + startpage + "," + pageview;
	}
	}
	else{
		sql = "select * from product_list order by idx desc limit " + startpage + "," + pageview;
	}
	
	ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	data = new ArrayList();
	
	while (rs.next()) {
		Map<String, Object> mp = new HashMap();
		mp.put("idx", rs.getString("idx"));
		mp.put("code", rs.getString("code"));
		mp.put("bcode", rs.getString("bcode"));
		mp.put("scode", rs.getString("scode"));
		mp.put("pcode", rs.getString("pcode"));
		mp.put("pnm", rs.getString("pnm"));
		mp.put("psub", rs.getString("psub"));
		mp.put("price", rs.getString("price"));
		mp.put("sale", rs.getString("sale"));
		mp.put("saleprice", rs.getString("saleprice"));
		mp.put("saleea", rs.getString("saleea"));
		mp.put("saleuse", rs.getString("saleuse"));
		mp.put("earlysoldout", rs.getString("earlysoldout"));
		mp.put("file1", rs.getString("file1"));
		mp.put("file2", rs.getString("file2"));
		mp.put("file3", rs.getString("file3"));
		mp.put("productdetail", rs.getString("productdetail"));
		data.add(mp);
	}
	con.close();
} catch (Exception e) {

}
%>


<meta charset="UTF-8">
<p>상품관리 페이지</p>
<div class="subpage_view">
    <span>등록된 상품 <%=total%>건</span>
    <span>  
        <select class="p_select1" id="searchcategory">
            <option value="title" <%if(type.equals("title")){out.print("selected");};%>>상품명</option>
            <option value="code" <%if(type.equals("code")){out.print("selected");};%>>상품코드</option>
        </select>
        <input type="text" class="p_input1" placeholder="검색어를 입력해 주세요" id="search" name="search" value='<%=search1%>'>
        <input type="button" value="검색" title="상품검색" class="p_submit" onclick="pagego()">
    </span>
</div>
<div class="subpage_view2">
    <ul>
        <li><input type="checkbox" id = "allcheck" name="allcheck" onclick="check()"></li>
        <li>코드</li>
        <li>이미지</li>
        <li>상품명</li>
        <li>카테고리 분류</li>
        <li>판매가격</li>
        <li>할인가격</li>
        <li>할인율</li>
        <li>재고현황</li>
        <li>판매유/무</li>
        <li>품절</li>
        <li>관리</li>
    </ul>
    <%
	int w = 0;

	while (w < data.size()) {
			
	%>
    <ul>
        <li><input type="checkbox" name="check" value='<%=data.get(w).get("idx")%>'></li>
        <li><%=data.get(w).get("pcode")%></li>
        <li><img src=<%=data.get(w).get("file1")%> width="60" height="25" ></li>
        <li><%=data.get(w).get("pnm")%></li>
        <li><%=data.get(w).get("code")%> 분류</li>
        <li><fmt:formatNumber value='<%=(String)data.get(w).get("price")%>' pattern="#,###"/></li>
        <li><fmt:formatNumber value='<%=(String)data.get(w).get("saleprice")%>' pattern="#,###"/></li>
        <li><%=data.get(w).get("sale")%>%</li>
        <li><%=data.get(w).get("saleea")%></li>
        <li><%=data.get(w).get("saleuse")%></li>
        <li><%
        String ea = (String)data.get(w).get("saleea");
        int ea1 = Integer.parseInt(ea);
        if(ea1>0){out.print("N");};
        if(ea1==0){out.print("Y");};%></li>
        <li>관리</li>
    </ul>
     <%
	w++;
	} ;
	%>
     <%
	if (data.size() == 0) {
	%>
    <ul>
        <li style="width: 100%;">등록된 상품이 없습니다.</li>
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
    <input type="button" value="선택상품 삭제" title="선택상품 삭제" class="p_button" onclick="del()">
    <span style="float: right;">
    <input type="button" value="신규상품 등록" title="신규상품 등록" class="p_button p_button_color1" onclick = window.open("./admin_product_write.jsp","_self")>
    <input type="button" value="카테고리 등록" title="카테고리 등록" class="p_button p_button_color2" onclick = window.open("./admin_category_write.jsp","_self")>
    </span>
</div>