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
    <!--상단 영역 top.html-->   
</div>
<form name="f" method="post" enctype="application/x-www-form-urlencoded" action="./complet.do">
<div class="resp_wrap display_wrap">
  <%@include file="./order_view.jsp"%>
<!--상품상세 페이지 영역 item_view.html-->
</div>
</form>

<div id="layout_footer" class="layout_footer">
<%@include file="../footer.jsp"%>
    <!--회사소개 영역 footer.html-->
</div>

</div>
</body>

<script>

function check() {  
	var a = f.allcheck.checked;
	var checkboxes = document.getElementsByName('check');

	if(a==true){
		for(var checkbox of checkboxes){
		      checkbox.checked = true;
		   } 
		
	}
	else{
		for(var checkbox of checkboxes){
		      checkbox.checked = false;
		   } 
	}
	
}

function copy(){
	
	f.person_nm.value = f.cname.value;
	f.person_phone1.value = f.ctel1.value;
	f.person_phone2.value = f.ctel2.value;
	f.person_phone3.value = f.ctel3.value;
	
}

function pay1(){
	
	var tel = f.ctel1.value+f.ctel2.value+f.ctel3.value; //주문자 전화번호
	var telregex = /^[0-9]{10,11}$/; //전화번호 확인 정규식
	var emailregex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}'); // 이메일 확인 정규식
	var tel1 = f.person_phone1.value+f.person_phone2.value+f.person_phone3.value; //받는 사람 전화번호
	var checkboxes = document.getElementsByName('check');
	var agree1 = document.getElementById('agree1').checked;
	var agree2 = document.getElementById('agree2').checked;
	var agree3 = document.getElementById('agree3').checked;
	var agree4 = document.getElementById('agree4').checked;
	
	if(f.cname.value==""){
		alert("이름을 입력해주세요");
	}
	else if(agree1!=true||agree2!=true||agree3!=true||agree4!=true){
		alert("체크박스를 모두 선택해주세요");
	}
	else if(!telregex.test(tel)){
		alert("전화번호를 확인해주세요")
	}
	else if(!emailregex.test(f.cemail.value)){
		alert("이메일을 확인해주세요");
	}
	else if(f.person_nm.value==""){
		alert("받는 분의 이름을 입력해주세요");
	}
	else if(f.person_addr.value==""||f.person_addrdtc.value==""){
		alert("주소를 입력해주세요");
	}
	else if(!telregex.test(tel1)){
		alert("받는 분의 전화번호를 입력해주세요");
	}
	
	else{
		
		f.submit();		
	}
	
}

</script>


<!-- 주소 검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
               
                var addr = ''; // 주소 변수
               
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                f.person_post.value = data.zonecode;
                f.person_addr.value = addr;
                // 커서를 상세주소 필드로 이동한다.
                f.person_addrdtc.focus();
            }
        }).open();
    }
</script>


</html>