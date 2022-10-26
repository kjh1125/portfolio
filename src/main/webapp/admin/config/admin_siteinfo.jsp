<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%@ include file = "./adminsiteinfo_out.jsp" %>

<p>홈페이지 가입환경 설정</p>

<div class="subpage_view">
<ul class="info_form">

    <li>홈페이지 제목</li>
    <li >
        <input type="text" class="in_form1" name="hometitle" value="<%=al.get(0).get("hometitle")%>">
    </li>
</ul>    
<ul class="info_form">
    <li>관리자 메일 주소</li>
    <li>
        <input type="text" class="in_form2" name="homeemail" value="<%=al.get(0).get("homeemail")%>"> ※ 관리자가 보내고 받는 용도로 사용하는 메일 주소를 입력합니다.(회원가입,인증메일,회원메일발송 등에서 사용)
    </li>
</ul> 
<ul class="info_form">
    <li>포인트 사용 유/무</li>
    <li class="checkcss">
        <em><label><input type="radio" class="ckclass" name="homepointuse" value="Y" <%if(al.get(0).get("homepointuse")=="Y"){out.print("checked");} %>>포인트 사용</label></em> 
        <em><label><input type="radio" class="ckclass" name="homepointuse" value="N" <%if(al.get(0).get("homepointuse")=="N"){out.print("checked");} %>>포인트 미사용</label></em>
    </li>
</ul>
<ul class="info_form2" style="border-bottom:1px solid rgb(81, 61, 61);">
    <li>회원가입시 적립금</li>
    <li>
        <input type="text" class="in_form3" value="<%=al.get(0).get("homepoint")%>" name="homepoint" maxlength="5"> 점
    </li>
    <li>회원가입시 권한레벨</li>
    <li>
        <input type="text" class="in_form3" value="<%=al.get(0).get("homelevel")%>" name="homelevel" maxlength="1"> 레벨
    </li>
</ul> 
</div>

<p>홈페이지 기본환경 설정</p>

<div class="subpage_view">
<ul class="info_form2">
    <li>회사명</li>
    <li>
        <input type="text" class="in_form0" name="defaultcomname" value="<%=al.get(0).get("defaultcomname")%>"> 
    </li>
    <li>사업자등록번호</li>
    <li>
        <input type="text" class="in_form0" name="defaultcomnum" value="<%=al.get(0).get("defaultcomnum")%>"> 
    </li>
</ul> 
<ul class="info_form2">
    <li>대표자명</li>
    <li>
        <input type="text" class="in_form0" name="defaultname" value="<%=al.get(0).get("defaultname")%>"> 
    </li>
    <li>대표전화번호</li>
    <li>
        <input type="text" class="in_form0" name="defaulttel" value="<%=al.get(0).get("defaulttel")%>"> 
    </li>
</ul>
<ul class="info_form2">
    <li>통신판매업 신고번호</li>
    <li>
        <input type="text" class="in_form0" name="defaultsalesnum" value="<%=al.get(0).get("defaultsalesnum")%>"> 
    </li>
    <li>부가통신 사업자번호</li>
    <li>
        <input type="text" class="in_form0" name="defaultaddcomnum" value="<%=al.get(0).get("defaultaddcomnum")%>"> 
    </li>
</ul>
<ul class="info_form2">
    <li>사업장 우편번호</li>
    <li>
        <input type="text" class="in_form0" name="defaultpostnum" value="<%=al.get(0).get("defaultpostnum")%>"> 
    </li>
    <li>사업장 주소</li>
    <li>
        <input type="text" class="in_form2" name="defaultcomaddress" value="<%=al.get(0).get("defaultcomaddress")%>"> 
    </li>
</ul>
<ul class="info_form2" style="border-bottom:1px solid rgb(81, 61, 61);">
    <li>정보관리책임자명</li>
    <li>
        <input type="text" class="in_form0" name="defaultinfoname" value="<%=al.get(0).get("defaultinfoname")%>"> 
    </li>
    <li>정보책임자 E-mail</li>
    <li>
        <input type="text" class="in_form1" name="defaultinfoemail" value="<%=al.get(0).get("defaultinfoemail")%>"> 
    </li>
</ul>
</div>

<p>결제 기본환경 설정</p>

<div class="subpage_view">  
<ul class="info_form2">
    <li>무통장 은행</li>
    <li>
        <input type="text" class="in_form0" name="paynobank" value="<%=al.get(0).get("paynobank")%>"> 
    </li>
    <li>은행계좌번호</li>
    <li>
        <input type="text" class="in_form1" name="paybanknum" value="<%=al.get(0).get("paybanknum")%>"> 
    </li>
</ul>
<ul class="info_form">
    <li>신용카드 결제 사용</li>
    <li class="checkcss">
        <em><label><input type="radio" class="ckclass" name="paycarduse" value="Y" <%if(al.get(0).get("paycarduse")=="Y"){out.print("checked");} %>> 사용</label></em> 
        <em><label><input type="radio" class="ckclass" name="paycarduse" value="N" <%if(al.get(0).get("paycarduse")=="N"){out.print("checked");} %>> 미사용</label></em> ※ 해당 PG사가 있을 경우 사용으로 변경합니다.
    </li>
</ul>
<ul class="info_form">
    <li>휴대폰 결제 사용</li>
    <li class="checkcss">
        <em><label><input type="radio" class="ckclass" name="payphoneuse" value="Y" <%if(al.get(0).get("payphoneuse")=="Y"){out.print("checked");} %>> 사용</label></em> 
        <em><label><input type="radio" class="ckclass" name="payphoneuse" value="N" <%if(al.get(0).get("payphoneuse")=="N"){out.print("checked");} %>> 미사용</label></em> ※ 주문시 휴대폰 결제를 가능하게 할 것인지를 설정합니다.
    </li>
</ul>
<ul class="info_form">
    <li>도서상품권 결제사용</li>
    <li class="checkcss">
        <em><label><input type="radio" class="ckclass" name="paybookuse" value="Y" <%if(al.get(0).get("paybookuse")=="Y"){out.print("checked");} %>> 사용</label></em> 
        <em><label><input type="radio" class="ckclass" name="paybookuse" value="N" <%if(al.get(0).get("paybookuse")=="N"){out.print("checked");} %>> 미사용</label></em> ※ 도서상품권 결제만 적용이 되며, 그 외에 상품권은 결제 되지 않습니다.
    </li>
</ul>
<ul class="info_form2">
    <li>결제 최소 포인트</li>
    <li>
        <input type="text" class="in_form0" maxlength="5" name="paypaymin" value="<%=al.get(0).get("paypaymin")%>"> 점
    </li>
    <li>결제 최대 포인트</li>
    <li>
        <input type="text" class="in_form0" maxlength="5" name="paypaymax" value="<%=al.get(0).get("paypaymax")%>"> 점
    </li>
</ul>
<ul class="info_form">
    <li>현금 영수증 발급사용</li>
    <li class="checkcss">
        <em><label><input type="radio" class="ckclass" name="paycashuse" value="Y" <%if(al.get(0).get("paycashuse")=="Y"){out.print("checked");} %>> 사용</label></em> 
        <em><label><input type="radio" class="ckclass" name="paycashuse" value="N" <%if(al.get(0).get("paycashuse")=="N"){out.print("checked");} %>> 미사용</label></em> ※ 현금영수증 관련 사항은 PG사 가입이 되었을 경우 사용가능 합니다.
    </li>
</ul>
<ul class="info_form2">
    <li>배송업체명</li>
    <li>
        <input type="text" class="in_form0" name="paydelenm" value="<%=al.get(0).get("paydelenm")%>"> 
    </li>
    <li>배송비 가격</li>
    <li>
        <input type="text" class="in_form0" name="paydeleprice" maxlength="7" value="<%=al.get(0).get("paydeleprice")%>"> 원
    </li>
</ul>
<ul class="info_form" style="border-bottom:1px solid rgb(81, 61, 61);">
    <li>희망배송일</li>
    <li class="checkcss">
        <em><label><input type="radio" class="ckclass" name="paydeledate" value="Y" <%if(al.get(0).get("paydeledate")=="Y"){out.print("checked");} %>> 사용</label></em> 
        <em><label><input type="radio" class="ckclass" name="paydeledate" value="N" <%if(al.get(0).get("paydeledate")=="N"){out.print("checked");} %>> 미사용</label></em> ※ 희망배송일 사용시 사용자가 직접 설정 할 수 있습니다.
    </li>
</ul >
</div>

<div class="btn_div">
    <button type="button" class="sub_btn1" title="설정 저장" onclick="insertinfo()">설정 저장</button>
    <button type="button" class="sub_btn2" title="저장 취소" onclick=window.location.reload()>저장 취소</button>
</div>
