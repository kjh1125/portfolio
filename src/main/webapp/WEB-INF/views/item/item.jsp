<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko"  xmlns:fb="http://ogp.me/ns/fb#"  xmlns:og="http://ogp.me/ns#">
<head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# website: http://ogp.me/ns/fb/website#">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<title>인테리어 TRENDY LIVING IDEA</title>
<link rel="image_src" href="./images/snslogo.png"/>

<!-- 구글 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700&amp;subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="./css/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet" type="text/css" href="./css/slick.css"><!-- 반응형 슬라이드 -->
<link rel="stylesheet" type="text/css" href="./css/goods_info_style.css"><!-- 상품디스플레이 CSS -->
<link rel="stylesheet" type="text/css" href="./css/lib.css" />
<link rel="stylesheet" type="text/css" href="./css/common.css?v=20221004" />
<link rel="stylesheet" type="text/css" href="./css/board.css" />
<link rel="stylesheet" type="text/css" href="./css/buttons.css" />
<link rel="stylesheet" type="text/css" href="./css/mobile_pagination.css" />
<!-- <link rel="stylesheet" type="text/css" href="./css?k=quickdesign&v=20221004095207" /> --><!-- Quick Design CSS -->
<link rel="stylesheet" type="text/css" href="./css/broadcast.css" /> 
<link rel="stylesheet" type="text/css" href="./css/user.css" /><!-- ++++++++++++ 스킨 사용자/제작자 CSS ++++++++++++ -->
<link rel="stylesheet" href="./css/swiper.css" />
<!-- /CSS -->
<link rel="stylesheet" type="text/css" href="./css/jquery_swipe.css" />

<!-- 파비콘 -->
</head>

<!-- 자바스크립트 -->
<script src="./js/jquery.min.js"></script>
<script src="./js/jquery-ui.min.js"></script>
<script src="./js/jquery.poshytip.min.js"></script>
<script src="./js/jquery.activity-indicator-1.0.0.min.js"></script>
<script src="./js/jquery.cookie.js"></script>
<script src="./js/jquery.slides.min.js"></script>
<script src="./js/jquery.placeholder.js"></script>
<script src="./js/jquery.validate.js"></script>
<script src="./js/jquery.ezmark.min.js"></script>
<script src="./js/custom-select-box.js"></script>
<script src="./js/custom-mobile-pagination.js"></script>
<script src="./js/slick.min.js"></script>
<script src="./js/jquery.event.swipe.js"></script>
<script src="./js/swiper.js"></script>
<body>
<style>
        #layout_body { background-color:#ffffff; }
        #layer_pay {position:absolute;top:0px;width:100%;height:100%;background-color:#ffffff;text-align:center;z-index:999999;}
        #payprocessing {text-align:center;position:absolute;width:100%;top:150px;z-index:99999999px;}
        #layout_body { max-width:100%; padding-left:0; padding-right:0; }
        #layout_footer { margin-top:0; }
</style>

<div id="wrap">
<div id="layout_wrap" class="layout_wrap">
    <%@include file="../top.jsp"%>
</div>
<form name="f" method="post" action="./order.do" enctype="application/x-www-form-urlencoded">
<div class="resp_wrap display_wrap">
    <%@include file="./item_view.jsp"%>
</div>
</form>

<div id="layout_footer" class="layout_footer">
        <%@include file="../footer.jsp"%>
</div>

</div>
</body>
<script>
function price(n){

var ea = n;
var price = f.saleprice.value;
var tprice = document.getElementById('total_goods_price'); //총 상품금액 위치 불러오기

var total = n*price; // DB에 값을 넘기기 위한 용
var total1 = (n*price).toLocaleString(); // 홈페이지에 고객에게 보여주기 위해 , 추가.

f.totalprice.value = total;

tprice.innerHTML=total1+"&#x20a9;"; // 마지막에 원표시 추가

}

function buy(){
	f.submit();
	
}

function basket(item){
	
	
	     var aj;
		      function wck(){
		         if(window.XMLHttpRequest){
		     	       return new XMLHttpRequest();
		      	  }
		      }
		      function acall(){
		         if(aj.readyState == XMLHttpRequest.DONE && aj.status==200){   
		             
		        	 alert("장바구니에 추가되었습니다.");
		        	
		         }
		         
		      }
		     
		      var gopage = "./basket.do?item="+item;
		      aj = wck();
		      aj.onreadystatechange = acall;
		      aj.open("get",gopage,true);
		      aj.send();
		      
		
	
	
}






</script>


</html>