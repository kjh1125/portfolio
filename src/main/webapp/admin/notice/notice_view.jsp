<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%@ include file = "./noticeview_out.jsp" %>

<input type="hidden" name="idx" value="<%=idx%>">
<meta charset="UTF-8">
<p>공지사항 VIEW 페이지</p>
<div class="write_view">
<ul>
    <li>공지번호</li>
    <li>22 번째 공지글</li>
</ul>
<ul>
    <li>공지사항 여부</li>
    <li>
        <label class="label_notice"><em class="cbox"><input type="checkbox" name="chk" <%if(al.get(0).get("chk").equals("on")){out.print("checked");} %>></em> 공지 출력 </label> ※ 공지출력을 체크할 시 해당 글 내용은 최상단에 노출 되어 집니다.
    </li>
</ul>
<ul>
    <li>공지사항 제목</li>
    <li>
        <input type="text" class="notice_input1" name ="title" value="<%=al.get(0).get("title")%>"> ※ 최대 150자까지 입력이 가능
    </li>
</ul>
<ul>
    <li>글쓴이</li>
    <li>
        <input type="text" class="notice_input2" value="관리자" readonly> ※ 관리자 이름이 노출 됩니다.       
    </li>
</ul>
<ul>
    <li>첨부파일</li>
    <li>
        <input type="file" name="file"> ※ 새로운 첨부파일 적용시 기본 첨부파일은 삭제 됩니다.
        <em class="fileview">기존 첨부 파일명 : <%=al.get(0).get("file")%></em>
    </li>
</ul>
<ul class="ul_height">
    <li>공지내용</li>
    <li>
        <textarea class="notice_input3" placeholder="공지내용 출력" name="memo"><%=al.get(0).get("memo")%></textarea>
    </li>
</ul>
</div>
<div class="board_btn">
    <button class="border_list" onclick=window.open("./admin_notice.jsp","_self")>공지목록</button>
    <button class="border_modify" onclick="revise()">공지수정</button>
    <button class="border_del" onclick="del2(<%=idx%>)">공지삭제</button>
</div>