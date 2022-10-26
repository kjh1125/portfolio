<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.taglibs.standard.tag.rt.fmt.FormatNumberTag"%>
<%@page import="org.apache.taglibs.standard.tag.common.fmt.FormatNumberSupport"%>
<%@page import="java.util.regex.Pattern"%>
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

PreparedStatement psct = null;
PreparedStatement ps = null;
List<Map<String, Object>> data = null;
Database_Information db = new Database_Information();
Connection con = null;
String sql = null;

Date dt = new Date();
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
String to = simpleDateFormat.format(dt);
int today = Integer.parseInt(to);

try {
	con = db.cafe24();
	
	sql = "select * from newcoupon order by idx desc"; 
	ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	data = new ArrayList();
	
	
	while (rs.next()) {
		Map<String, Object> mp = new HashMap();
		mp.put("idx", rs.getString("idx"));
		mp.put("name", rs.getString("name"));
		mp.put("type", rs.getString("type"));
		mp.put("startdate", rs.getString("startdate").substring(0,10));
		mp.put("enddate", rs.getString("enddate").substring(0,10));
		mp.put("cptype", rs.getString("cptype"));
		mp.put("discount", rs.getString("discount"));
		mp.put("pricemin", rs.getString("pricemin"));
		data.add(mp);
	}

	

} catch (Exception e) {

}
%>

<p>쇼핑몰 관리 페이지</p>
<%

int ww = 0;

String startdate = null;
String enddate = null;
int sdate = 0;
int edate = 0;
int usecoupon = 0;

while (ww < data.size()) {
	startdate = (String)data.get(ww).get("startdate");
	enddate = (String)data.get(ww).get("enddate");
	sdate = Integer.parseInt(startdate.replace("-", ""));
	edate = Integer.parseInt(enddate.replace("-", ""));

	if(today>=sdate && today<=edate){
   	 usecoupon++;
    }
ww++;
}
%>
    <div class="subpage_view">
        <span>※ 쿠폰발행 현황 리스트 | <em>[ 사용중인 쿠폰 <%=usecoupon%> ]</em> #선택하여 삭제</span>
        <span>
         <ol class="coupon_title">
            <li>번호</li>
            <li>쿠폰명</li>
            <li>쿠폰종류</li>
            <li>사용시작일</li>
            <li>사용종료일</li>
            <li>쿠폰타입</li>
            <li>할인금액</li>
            <li>최소주문금액</li>
         </ol>
         <%
	int w = 0;
	int no = 0;
	String type = "";
	while (w < data.size()) {
		no=data.size()-w;
		
		
	%>	
         <ol class="coupon_lists" onclick="del2(<%=data.get(w).get("idx")%>)">
            <li><%=no%></li>
            <li style="text-align: center;"><%=data.get(w).get("name")%></li>
            <li><%=data.get(w).get("type")%></li>
            <li><%=data.get(w).get("startdate")%></li>
            <li><%=data.get(w).get("enddate")%></li>
            <li><%=data.get(w).get("cptype")%></li>
            <%type = (String)data.get(w).get("cptype");%>
            <% if(type.equals("정액할인")){ %>
			<li><fmt:formatNumber value='<%=(String)data.get(w).get("discount")%>' pattern="#,###"/></li>
            <%}; %>
            <% if(type.equals("정률할인")){ %>
            <li><%=data.get(w).get("discount")+"%"%></li>
            <%}; %>
            <li><fmt:formatNumber value='<%=(String)data.get(w).get("pricemin")%>' pattern="#,###"/></li>
         </ol>
      <%
     
	w++;
	} ;
	%>   
         <%
	if (data.size() == 0) {
	%>
         <ol class="coupon_none_lists">
            <li>등록된 쿠폰이 없습니다.</li>
        </ol>
        <%
	}
	%>
        </span>
        <span><input type="button" value="쿠폰 등록하기" class="shopping_btn" onclick = window.open("./admin_coupon_config.jsp","_self")></span>
    <!-- </div>
    <div class="subpage_view">
        <span>※ 팝업창 현황 리스트 </span>
        <span>
         <ol class="popup_title">
            <li>번호</li>
            <li>팝업명</li>
            <li>팝업 창크기</li>
            <li>링크</li>
            <li>사용시작일</li>
            <li>사용종료일</li>
         </ol>
         <ol class="popup_lists">
            <li>1</li>
            <li>가을신상품 소개</li>
            <li>300 * 200</li>
            <li>http://</li>
            <li>2022-09-01</li>
            <li>2022-09-30</li>
         </ol>
         <ol class="coupon_none_lists">
            <li>등록된 팝업창이 없습니다.</li>
        </ol>
        </span>
        <span><input type="button" value="팝업창 등록하기" class="shopping_btn"></span>
    </div> -->