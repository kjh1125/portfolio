
<%@page import="port2.dto.Product_DTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String code = (String)request.getAttribute("code")==null?"":(String)request.getAttribute("code"); 
List<Product_DTO> data = (List<Product_DTO>)request.getAttribute("list");

%>

<meta charset="utf-8">
<div class="title_group1" name="menu" id="menu">
    <h3 class="title1"><span designElement="text" textIndex="1"  textTemplatePath="cmVzcG9uc2l2ZV93cmlzdHdhdGNoX2NsYXNzaWNfZ2wvbWFpbi9pbmRleC5odG1s" >Celebrity Collection</span></h3>
</div>
<div class="show_display_col4" >
<style>
.designDisplay_633b83b7559e9 .goods_list li.gl_item{ width:300px; }
</style>
<div id='designDisplay_633b83b7559e9' class='designDisplay' designElement='display' templatePath='main/index.html' displaySeq='10344' page='' perpage='' category='' displayStyle='responsible'>
<ul class="displayTabContainer displayTabType1" >
        <li onclick="collection('0103')" <%if(code=="0103"||code==""){out.print("class='current'");} %> style="width:25%">소파/거실장</li>
        <li onclick="collection('0101')" <%if(code=="0101"){out.print("class='current'");} %> style="width:25%">침대/매트리스</li>
        <li onclick="collection('0102')" <%if(code=="0102"){out.print("class='current'");} %> style="width:25%">식탁/식탁의자</li>
        <li onclick="collection('0104')" <%if(code=="0104"){out.print("class='current'");} %> style="width:25%">쿠션/조명</li>
</ul>

<div class="designDisplay_633b83b7559e9 display_responsible_class displayTabContentsContainer displayTabContentsContainerBox" style="display: block;">
<style>
    .designDisplay_633b83b7559e9.goods_list li.gl_item{ width:300px; }
</style>
<ul class="goods_list designDisplay_633b83b7559e9 goods_info_style_2">




<!--Celebrity Collection 상품출력 반복코드 -->

<%
int w=0;
while(w<data.size()){
%>    
<!--Celebrity Collection 상품출력 반복코드 -->
<li class="gl_item">
<div class="gl_inner_item_wrap">
    <!--상품이미지-->
    <div class="gli_image goodsDisplayImageWrap">
        <a href="./item.do?item=<%=data.get(w).getIdx()%>" class="respItemImageArea">
            <img src="<%=data.get(w).getFile1()%>" data-src="<%=data.get(w).getFile1()%>" class="goodsDisplayImage lazyload" onerror="this.src='./images/noimage.gif'" alt="<%=data.get(w).getPnm()%>"/>
        </a>
        <div class="respGoodsZzim">
            <a class="zzimArea" href="javascript:void(0)" onclick="display_goods_zzim(this, 767)">
                <img src="./images/icon_zzim.png" class="zzimImage normal " alt="찜하기" title="찜하기" />
                <img src="./images/icon_zzim_on.png" class="zzimImage active hide" alt="찜한 상품" title="찜한 상품" />
            </a>
        </div>
    </div>

    <div class="resp_display_goods_info infO_style_2">
    <!-- +++++++++++++++++++++++++++++++++ NEW 상품 정보 ++++++++++++++++++++++++++++++++ -->
        <!-- 컬러옵션 -->
        <div class="goodS_info displaY_color_option">
        </div>

        <div class="infO_group">

            <!-- 브랜드명 -->
            <div class="goodS_info displaY_brand_name">
                <span class="areA">AQUARIC</span>
            </div>

            <!-- 상품명-->
            <div class="goodS_info displaY_goods_name">
                <span class="areA"><a href="/goods/view?no=767"><%=data.get(w).getPnm() %></a></span>
            </div>
        </div>

        <!-- 짧은 설명 -->
        <div class="goodS_info displaY_goods_short_desc">
            <span class="areA"><%=data.get(w).getPsub() %></span>
        </div>



        <div class="infO_group">
            <!-- (할인혜택)판매가 -->
            <div class="goodS_info displaY_sales_price">
                <span class="areA">
                    <span class="nuM"><fmt:formatNumber value='<%=data.get(w).getSaleprice()%>' pattern="#,###"/>&#x20a9;</span>
                </span>
            </div>
        </div>
    </div>
</div>
</li>
<!--Celebrity Collection 상품출력 반복코드 끝 -->

<%
w++;
}
%>

</div>
