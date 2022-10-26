<%@page import="port2.dto.CS_FAQ_DTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="utf-8">
<div id="boardlayout" >
    <div class="subpage_wrap">
        <div id="subpageLNB" class="subpage_lnb">
<div id="boardLnbCommon">
    <h2 class="title1"><a href="/portfolio/cs.do/0" designElement="text" >CS CENTER</a></h3>
    <ul class="lnb_sub">
        <li ><a href="/portfolio/noticelist.do" designElement="text">공지사항</a></li>
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

        <!-- +++++ cscenter contents ++++ -->
        <div class="subpage_container">
            <!-- 전체 메뉴 -->
            <a id="subAllButton" class="btn_sub_all" href="#" designElement="text">MENU</a>

            <!-- -->
            <div class="cs_top2 mycs_fcont_margin">
                <a class="menu2" href="./1" designElement="text"><span class="area"><span class="text2">배송문의</span></span></a>
                <a class="menu3" href="./2" designElement="text"><span class="area"><span class="text2">반품/교환문의</span></span></a>
                <a class="menu1" href="./3" designElement="text"><span class="area"><span class="text2">상품문의</span></span></a>
                <a class="menu9" href="./4" designElement="text"><span class="area"><span class="text2">쿠폰내역</span></span></a>
                <a class="menu10" href="./5" designElement="text"><span class="area"><span class="text2">마일리지내역</span></span></a>
                <a class="menu5" href="./6" designElement="text"><span class="area"><span class="text2">기타</span></span></a>
            </div>

            <!-- 타이틀 -->
            <div class="title_container2">
                <h3 class="title_sub6"><span designElement="text" textIndex="8" >자주 묻는 질문</span> <span class="top5" designElement="text" textIndex="9" >TOP5</span></h3>
                <a class="btn_thebogi" href="#" designElement="text" textIndex="10" >더보기</a>
            </div>
            <!-- 반복 시작  -->
            <%int w=0; 
           
           // ArrayList<Map<String,Object>> ar = (ArrayList<Map<String,Object>>)request.getAttribute("data1");
            List<CS_FAQ_DTO> ar = (List<CS_FAQ_DTO>)request.getAttribute("list");
            int ct = ar.size();
            %>
            <%while(w<ct){ %>
            <ul class="faq_new v2">
                <li>
                    <div class="question">
                    <%
                    String msg = null;
                    switch(ar.get(w).getCate()) {
    				case "1":
    				msg ="[배송문의]";
    				break;
    				case "2":
    					msg ="[반품/교환문의]";
    					break;
    				case "3":
    					msg ="[상품문의]";
    					break;
    				case "4":
    					msg ="[쿠폰내역]";
    					break;
    				case "5":
    					msg ="[마일리지내역]";
    					break;
    					
    				default:
    					msg ="[기타문의]";
    					break;
    				
    				}
                    
                    %>
                        <p class="subject pointer boad_faqview_btn" board_seq="<%=w+1%>"><%=msg%> <span class="cat"><%=ar.get(w).getTitle()%></span>   </p>
                        
                       
                        <p class="add_info">

                        </p>
                    </div>
                    <div id="faqcontent_<%=w+1%>" class="answer hide">								
                        <p style="box-sizing: inherit;"><%=ar.get(w).getMemo()%></p>
                    </div>
                </li>
            </ul>
            <%w++;} %>
            <!-- 반복 끝  -->
           
            
            <script type="text/javascript">
            // FAQ 게시글 보기
            $('.boad_faqview_btn').on('click', function() { 
                var board_seq = $(this).attr('board_seq');
                $("#faqcontent_"+board_seq).toggle();
            }); 
            </script>
        </div>
        
    </div>
    <!-- <script type="text/javascript" src="../js/cscenter_ui.js"></script> --><!-- 고객센터 ui 공통 -->

</div>
        
        </div>
</div>