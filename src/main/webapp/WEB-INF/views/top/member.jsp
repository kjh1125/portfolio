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

<link rel="stylesheet" type="text/css" href="./css/jquery-ui-1.8.16.custom.css?v=1" />
<link rel="stylesheet" type="text/css" href="./css/slick.css?v=1"><!-- 반응형 슬라이드 -->
<link rel="stylesheet" type="text/css" href="./css/goods_info_style.css?v=1"><!-- 상품디스플레이 CSS -->
<link rel="stylesheet" type="text/css" href="./css/lib.css?v=1" />
<link rel="stylesheet" type="text/css" href="./css/common.css?v=1" />
<link rel="stylesheet" type="text/css" href="./css/board.css?v=1" />
<link rel="stylesheet" type="text/css" href="./css/buttons.css?v=1" />
<link rel="stylesheet" type="text/css" href="./css/mobile_pagination.css?v=1" />
<!-- <link rel="stylesheet" type="text/css" href="./css?k=quickdesign&v=20221004095207" /> --><!-- Quick Design CSS -->
<link rel="stylesheet" type="text/css" href="./css/broadcast.css?v=1" /> 
<link rel="stylesheet" type="text/css" href="./css/user.css?v=1" /><!-- ++++++++++++ 스킨 사용자/제작자 CSS ++++++++++++ -->
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
<form name="f" enctype="application/x-www-form-urlencoded" method="POST" action="./member.do">
<div class="resp_wrap display_wrap">
<%@include file="./member_join.html"%>
</div>
</form>
<div id="layout_footer" class="layout_footer">
    <%@include file="../footer.jsp"%>
</div>

</div>
</body>
<script>
var emailnum="";
function join(){
	var idregex = /^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{5,19}$/g; //영어로 시작하고 숫자가 포함되도록 하는 정규식(ID)
	var emailregex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}'); // 이메일 확인 정규식
	var telregex = /^[0-9]{10,11}$/; //전화번호 확인 정규식
	var today = new Date(); // DT 현재 시간
	f.tel.value = f.tel1.value+f.tel2.value+f.tel3.value;
	f.email.value = f.email1.value +"@"+ f.email2.value;
	
	if(f.id.value.indexOf(" ") != -1 || !idregex.test(f.id.value))
		{
		alert("ID가 형식에 맞지 않습니다.");
		}
	else if(f.pw.value != f.pw2.value || f.pw.value=="")
		{
		alert("비밀번호를 확인해주세요")
		
		}
	else if (f.name.value ==""){
		alert("이름을 확인해주세요");
		}
	else if(!emailregex.test(f.email.value)){
		alert("이메일을 확인해주세요");
	}
	else if(!telregex.test(f.tel.value)){
		alert("전화번호를 확인해주세요")
	}
	else if(f.address1.value==""||f.address2.value==""){
		alert("주소를 확인해주세요")
		}
	else if(f.idcheck.value=""){
		alert("중복 확인을 해주세요")
	}
	else if(emailnum==""||f.emailcheck.value!=emailnum)
		{
		alert("이메일 인증번호를 확인해주세요");
		
		}
	else{
		//Hidden DT 값에 현재 시간 2022-10-21 15:11:35 넣는 함수 
	    today.setHours(today.getHours() + 9);
	    f.dt.value= today.toISOString().replace('T', ' ').substring(0, 19);

		f.submit();
	}
	
	
}

function changeemail(){ //email2 부분 value 조정
	var emailcheck = document.getElementById("find_email").value;
	f.email2.value = emailcheck;
	
	
}

function idcheck1() { //중복확인
	var id1 = f.id.value;
	var idregex = /^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{5,19}$/g;

if(!idregex.test(id1)){
	alert("아이디 형식을 확인해주세요");
}
else{
     var aj;
	      function wck(){
	         if(window.XMLHttpRequest){
	     	       return new XMLHttpRequest();
	      	  }
	      }
	      function acall(){
	         if(aj.readyState == XMLHttpRequest.DONE && aj.status==200){   
	             
	        	 var remsg = JSON.parse(this.response);
	        	 
	        	if(remsg[0]["result"]=="yes"){
	        		alert('생성가능한 아이디입니다.');
	        		f.idcheck.value="true";
	        		f.id.readOnly="true";
	        	}
	        	else{
	        		alert('중복된 아이디입니다');
	        	}
	        	
	         }
	         
	      }
	     
	      var gopage = "./doublecheck.jsp?customerid="+id1;
	      aj = wck();
	      aj.onreadystatechange = acall;
	      aj.open("get",gopage,true);
	      aj.send();
	      
	   }

}


function emailcheck1() { //중복확인
f.email.value = f.email1.value +"@"+ f.email2.value;

     var aj;
	      function wck(){
	         if(window.XMLHttpRequest){
	     	       return new XMLHttpRequest();
	      	  }
	      }
	      function acall(){
	         if(aj.readyState == XMLHttpRequest.DONE && aj.status==200){   
	            
	        	alert("이메일을 확인 후 인증번호를 입력해주세요");
	        	emailnum=this.response;
	         }
	      }
	     
	      var gopage = "./mailcheck.do?email="+f.email.value;
	      aj = wck();
	      aj.onreadystatechange = acall;
	      aj.open("get",gopage,true);
	      aj.send();
	      
}
</script>

<!-- 주소찾기 API -->
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
                f.postcode.value = data.zonecode;
                f.address1.value = addr;
                // 커서를 상세주소 필드로 이동한다.
                f.address2.focus();
            }
        }).open();
    }
</script>



</html>