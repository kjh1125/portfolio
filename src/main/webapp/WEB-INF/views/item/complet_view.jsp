<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.List"%>
<%@page import="port2.dto.Product_DTO"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.inicis.std.util.SignatureUtil"%>
<%@page import="java.util.*"%>

<%
List<Product_DTO> data = (List<Product_DTO>)request.getAttribute("list");

int ea = Integer.parseInt(request.getParameter("ea"));
//결제수단
String payment = request.getParameter("payment");

//주문자 정보
String cnm = request.getParameter("cname");
String ctel = request.getParameter("ctel1")+request.getParameter("ctel2")+request.getParameter("ctel3");
String ctel1 =request.getParameter("ctel1")+"-"+request.getParameter("ctel2")+"-"+request.getParameter("ctel3");
String cemail = request.getParameter("cemail");

//배송받는 사람
String pnm = request.getParameter("person_nm");
String post = request.getParameter("person_post");
String addr = request.getParameter("person_addr");
String addr_dtc = request.getParameter("person_addrdtc");
String ptel = request.getParameter("person_phone1")+"-"+request.getParameter("person_phone2")+"-"+request.getParameter("person_phone3");
String memo = request.getParameter("memo");
%>

<%
	String mid					= "INIpayTest";		                    // 상점아이디					
	String signKey			    = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";	// 웹 결제 signkey
	
	String mKey = SignatureUtil.hash(signKey, "SHA-256");

	String timestamp			= SignatureUtil.getTimestamp();			// util에 의해서 자동생성
	String orderNumber			= mid+"_"+SignatureUtil.getTimestamp();	// 가맹점 주문번호(가맹점에서 직접 설정)
	int p	= data.get(0).getSaleprice()*ea;								// 상품가격(특수기호 제외, 가맹점에서 직접 설정)
	String price = Integer.toString(p);
	
	Map<String, String> signParam = new HashMap<String, String>();
	signParam.put("oid", orderNumber); // 난수 6~8자리
	signParam.put("price", price); // 최종가격
	signParam.put("timestamp", timestamp);
	String signature = SignatureUtil.makeSignature(signParam); 
	
%>
<!-- 이니시스 -->
<input type="hidden" name="version" value="1.0">
<input type="hidden" name="gopaymethod" value="<%=payment%>"><!-- 결제수단 -->
<input type="hidden" name="mid" value="<%=mid%>"><!-- 이니시스 제공한 mid -->
<input type="hidden" name="oid" value="<%=signParam.get("oid")%>">
<input type="hidden" name="price" value="<%=signParam.get("price")%>"><!-- 최종결제금액 -->
<input type="hidden" name="timestamp" value="<%=signParam.get("timestamp")%>">
<input type="hidden" name="signature" value="<%=signature%>">
<input type="hidden" name="mKey" value="<%=mKey%>">
<input type="hidden" name="currency" value="WON"> <!--결제통화수단(WON)-->
<!-- 결제자정보 -->
<input type="hidden" name="buyername" value="<%=cnm%>"><!-- 결제자명 -->
<input type="hidden" name="buyertel" value="<%=ctel%>"><!-- 휴대폰번호 (숫자만) -->
<input type="hidden" name="buyeremail" value="<%=cemail%>"><!-- 결제자 이메일주소 -->
<input type="hidden" name="goodname" value="<%=data.get(0).getPnm()%>"><!-- 상품명 -->
<input type="hidden" name="goodea" value="<%=ea%>"><!-- 상품갯수 -->
<!-- 결제완료 또는 취소 // 상대경로 적용 안 됨 -->
<input type="hidden" name="returnUrl" value="http://kjhwinter1.cafe24.com/portfoilo/INIstdpay_pc_return.do"> <!-- http://localhost:8080/portfoilo/INIstdpay_pc_return.do -->
<input type="hidden" name="closeUrl" value="http://kjhwinter1.cafe24.com/portfoilo/close.do"> <!-- http://localhost:8080/portfoilo/close.do -->

<div id="layout_body" class="layout_body">
    <div class="subpage_wrap">
        <div class="subpage_container v3 Pb10">
            <!-- 타이틀 -->
            <div class="title_container">
                <h2><span designElement="text">주문완료</span></h2>
            </div>
            <div class="mypage_greeting">
                <span class="username"><%=cnm%></span>님의 주문이 정상적으로 처리되었습니다.
            </div>
        </div>
    </div>
    <div class="subpage_wrap order_payment">
        <div class="subpage_container v2 Pt0 Pb40 order_payment_left2">
            <h2 class="title_od1 Pt15"><span>주문상품</span></h2>
            <div class="cart_contents">
                <div class="cart_list">
                    <ul class="shipping_group_list">
                        <li class="goods_delivery_info clearbox">
                            <ul class="detail">
                                <li class="th">배송 :</li>
                                <li class="silmul">
                                    <span>직접배송</span>
                                        <strong>무료</strong>
                                </li>
                            </ul>
                        </li>
    
                        <li class="cart_goods ">
                            <div class="cart_goods_detail">
                                <div class="cgd_contents">
                                    <div class="block block1">
                                        <ul>
                                            <li class="option_area">
                                                <div class="goods_name v2">
                                                    <a href=""><%=data.get(0).getPnm()%></a>
                                                </div>
                                                <ul class="cart_option">
                                                    <li><span class="xtle">색상</span> 블루</li>
                                                </ul>
                                                <div class="cart_quantity">
                                                    <span class="xtle">수량</span> <%=ea%>개
                                                    <span class="add_txt">(<span class="cart_price_num"><fmt:formatNumber value='<%=data.get(0).getSaleprice()*ea%>' pattern="#,###"/></span>&#x20a9;)</span>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
    
            <div class="goods_delivery_info Pt10 y1">
                <b>기본배송비 : 0&#x20a9;</b>
                </span>
            </div>
            <div class="order_subsection v2">
                <h3 class="title3"><span>주문자</span></h3>
                <ul class="list_01 v2">
                    <li>
                        <span class="name1 pointcolor2 imp"><%=cnm%></span>
                    </li>
                    <li>
                        <span class="phone1"><%=ctel1%></span>
                    </li>
                    <li><span class="email1"><%=cemail%></span></li>
                    <li class="desc">
                        주문자 정보로 주문 관련 정보가 문자와 이메일로 발송됩니다.<br />
                        비회원은 이메일과 주문번호로 주문조회가 가능합니다.<br />
                    </li>
                </ul>
    
                <h3 class="title3"><span>배송지</span></h3>
                <ul class="list_01 v2">
                    <li>
                        <span class="name1 pointcolor imp"><%=pnm%></span>
                        <span class="gray_06">(대한민국)</span>
                    </li>
                    <li>
                        [ <%=post%> ]
                        <%=addr%><br/>
                        <span class="desc">
                        <%=addr_dtc%>
                        </span>
                    </li>
                    <li>
                        <%=ptel%>
                    </li>
                    <li>
                        <%=memo%>
                    </li>
                </ul>
            </div>
        </div>
    
    
        <div class="subpage_container v2 Pt0 Pb40 order_payment_right2">
            <div class="order_subsection v2">
                <h3 class="title3 Pt15"><span>결제 금액</span></h3>
                <div class="order_price_total">
                    <ul>
                        <li class="th"><strong><span>상품금액</span></strong></li>
                        <li class="td"><fmt:formatNumber value='<%=data.get(0).getSaleprice()*ea%>' pattern="#,###"/>&#x20a9;</li>
                    </ul>
                    <ul>
                        <li class="th">
                            <span>배송비</span>&nbsp;
                        </li>
                        <li class="td">
                            (+) 0&#x20a9;
                        </li>
                    </ul>
                    <ul class="total">
                        <li class="th"><span>총 결제금액</span></li>
                        <li class="td">
                            <span class="price"><span class="settle_price"><fmt:formatNumber value='<%=data.get(0).getSaleprice()*ea%>' pattern="#,###"/></span>&#x20a9;</span>
                        </li>
                    </ul>
                </div>		
                <h3 class="title3"><span>주문결제정보</span>&nbsp;</h3>
                <table class="table_row_a" cellpadding="0" cellspacing="0">
                    <colgroup><col width="100"><col></colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><p>주문번호</p></th>
                            <td>
                                123456789 &nbsp;
                                <span class="Dib desc">(2022-10-25 14:26)</span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><p>주문상태</p></th>
                            <td>주문접수</td>
                        </tr>
                        <tr>
                            <th scope="row"><p>결제일시</p></th>
                            <td>
                                입금대기
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><p>결제방식</p></th>
                            <td>
                                <%=payment%>
                            </td>
                        </tr>
                        <!--무통장 일 경우에만 작동-->
                        <tr class="hide">
                            <th scope="row"><p>입금계좌</p></th>
                            <td>신한은행 100-033-123456 예금주:주식회사 더조은</td>
                        </tr>
                        <tr class="hide">
                            <th scope="row"><p>입금기간</p></th>
                            <td>2022년 11월 07일까지 (이후 입금되지 않았을 경우 자동으로 주문무효 처리)</td>
                        </tr>
                        <!--무통장 일 경우-->
                        <tr>
                            <th scope="row"><p>결제금액</p></th>
                            <td><strong><fmt:formatNumber value='<%=data.get(0).getSaleprice()*ea%>' pattern="#,###"/>&#x20a9;</strong></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <div class="Pb60 C">
        <a href="#" class="btn_resp size_c color2"><span>주문취소</span></a>
        <a href="javascript:void payment()" class="btn_resp size_c color5"><span>결제하기</span></a>
    </div>
    <style type="text/css">
    @media only screen and (max-width:767px) {
        .subpage_wrap.order_payment { display:block; width:auto; }
        .subpage_wrap.order_payment .subpage_container { display:block; padding:10px 10px 40px; }
        .subpage_wrap.order_payment .subpage_container.v2 { display:block; padding:10px 10px 40px; }
        .subpage_wrap.order_payment .order_payment_left2 { padding-right:0; }
        .subpage_wrap.order_payment .order_payment_right2 { padding-left:0; }
    }
    </style>