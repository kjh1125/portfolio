<%@page import="port2.dto.CS_Notice_DTO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%

List<CS_Notice_DTO> data = (List<CS_Notice_DTO>)request.getAttribute("data");
int pgnum = (int)request.getAttribute("pagenumber");
int startpage = (int)request.getAttribute("startpage");
int total = (int)request.getAttribute("total");
String type = (String)request.getAttribute("type");
String search = (String)request.getAttribute("search");
%>


<meta charset="utf-8">
<div id="boardlayout" >
    <div class="subpage_wrap">
        <div id="subpageLNB" class="subpage_lnb">
<div id="boardLnbCommon">
    <h2 class="title1"><a href="/portfolio/cs.do/0" designElement="text" >CS CENTER</a></h3>
    <ul class="lnb_sub">
        <li ><a href="./noticelist.do" designElement="text">공지사항</a></li>
        <li ><a href="/portfolio/cs.do/0" designElement="text">자주 묻는 질문</a></li>
        <li ><a href="" designElement="text">상품문의</a></li>
        <li ><a href="" designElement="text"><b>상품후기</b></a></li>
    </ul>
</div>
<script>
$(function() {
    // 고객센터 LNB 텍스트 수정기능으로 삭제시, 클라이언트단에서 삭제 처리
    $('#boardLnbCommon a').each(function(e) {
        if ( $(this).text() == '' ) {
            $(this).parent('li, h2').remove();
        }
    });
});
</script>
        </div>
    <div class="subpage_container">
        <!-- 전체 메뉴 -->
        <a id="subAllButton" class="btn_sub_all" href="javascript:void(0)"><span designElement="text" textIndex="1"  textTemplatePath="cmVzcG9uc2l2ZV93cmlzdHdhdGNoX2NsYXNzaWNfZ2wvYm9hcmQvaW5kZXguaHRtbA==" >MENU</span></a>

        <!-- 타이틀 ( 관리자에서 설정한 "게시판명"이 노출됩니다. ) -->
        <div class="title_container">
            <h2>공지사항</h2>
        </div>

        <div id="bbslist">
<ul class="bbs_top_wrap">
    <li class="left">
        <select name="category" id="searchcategory">
            <option value="all" <%if(type.equals("all")){out.print("selected");}; %>>- 전체 -</option>
            <option value="공지" <%if(type.equals("공지")){out.print("selected");}; %>>공지</option>
            <option value="긴급공지" <%if(type.equals("긴급공지")){out.print("selected");}; %>>긴급공지</option>
        </select>
    </li>
    <li class="right2">
        <span class="searchform">
            <input type="text" name="search_text" id="search_text" class="res_bbs_search_input" value="<%=search%>" title="제목, 내용" />
            <button type="button" class="btn_resp size_b" onclick="pagego()">검색</button>
            <button type="button" class="btn_resp size_b" onclick=window.open("./noticelist.do","_self")>초기화</button>
        </span>
    </li>
</ul>
<div class="article_info hide">
총 0개 (현재 0/총 0페이지)
</div>

<%
	if (data.size() == 0) {
	%>
<!--등록된 글이 없을 경우-->
<div class="no_data_area2">
    등록된 게시글이 없습니다.
</div>

	<%
	}
	%>


<!--등록된 글이 있을 경우-->

<div class="res_table">
<ul class="thead">
<li style="width:45px;"><span designElement="text">번호</span></li>
<li><span designElement="text">제목</span></li>
<li style="width:94px;"><span designElement="text">작성자</span></li>
<li style="width:84px;"><span designElement="text">등록일</span></li>
</ul>

<!--반복구간 사항-->
<%
int w=0;
int no = 0;
while(w<data.size()){ 
	no = total - startpage - w;
%>

<ul class="tbody">
<li class="mo_hide">
<span class="mtitle" designElement="text">번호:</span> <%=no%></li>
<li class="subject">
    <%=data.get(w).getTitle()%>
</li>
<li class="subject" style="text-align: center;">
    관리자
</li>
<li class="subject" style="text-align: center;">
    <%=data.get(w).getDt()%>
</li>
</ul>

<!--반복구간 종료-->
<%
w++;} %>
</div>
<div id="pagingDisplay" class="paging_navigation">
<p>
<%
		int p = 1;
		
		while (p <= pgnum) {
		%>
<a class="on red" onclick="pagego(<%=p%>)"><%=p%></a>
<%
		p++;
		}
		%>
</p>
</div>
     </div>
    </div>
<!--공지사항 끝-->