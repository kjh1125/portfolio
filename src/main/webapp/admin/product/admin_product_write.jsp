<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쇼핑몰 환경설정</title>
    <link rel="stylesheet" type="text/css" href="../css/basic.css">
    <link rel="stylesheet" type="text/css" href="../css/login.css?v=1">
    <link rel="stylesheet" type="text/css" href="../css/main.css?v=1">
    <link rel="stylesheet" type="text/css" href="../css/product.css?v=5">
    <link rel="icon" href="./img/logo.png" sizes="128x128">
    <link rel="icon" href="./img/logo.png" sizes="64x64">
    <link rel="icon" href="./img/logo.png" sizes="32x32">
    <link rel="icon" href="./img/logo.png" sizes="16x16">
    <script src="../js/jquery.js"></script>
</head>

<body>
<header class="headercss">
<%@include file="../admin_header.jsp" %>
</header>
<nav class="navcss">
<%@include file="../admin_menu.jsp" %>
</nav>
<form name="f" enctype="multipart/form-data" method="post" action="/portfolio/Product_Insert.do">
<main class="maincss">
<section style="height: auto;">
<%@include file="./product_write.jsp" %>
</section>
</main>
</form>
<footer class="main_copyright">
<%@include file="../admin_footer.jsp" %>
</footer>
</body>

<script src="../ckeditor/ckeditor.js"></script>
<script>
CKEDITOR.replace("pmain",{height:280});
</script>
<script>

function submit1(){
	var pmain = CKEDITOR.instances.pmain.getData();
	
	if(f.bcode.value==""){
		alert("대메뉴 카테고리를 설정하세요");
	}
	else if(f.scode.value==""){
		alert("소메뉴 카테고리를 설정하세요");
	}
	else if(f.doublecheck.value=="false"){
		alert("중복확인 해주세요");
	}
	else if(f.pnm.value==""){
		alert("상품명을 입력하세요");
	}
	else if(f.psub.value==""){
		alert("상품 부가설명을 입력하세요");
	}
	else if(f.price.value==""||f.sale.value==""||f.saleprice.value==""||f.saleea.value==""){
		alert("가격과 재고를 입력하세요");
	}
	else if(pmain.value=""){
		alert("상세설명을 입력하세요");
	}
	
	else{
		f.submit();
	}
	
}

function sale1(){
	var a = f.price.value;
	var b = f.sale.value;
	
	var c = Math.round(a*(1-b/100));
	
	f.saleprice.value=Math.round(c/10)*10; // 10: 1의 자리 반올림 출력 100: 10의 자리 반올림
	
	
}


function doublecheck1() { //중복확인
	var pcode = f.pcode.value;

if(pcode==""){
	alert("상품코드를 입력하세요");
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
	        		alert('생성가능한 번호입니다.');
	        		f.doublecheck.value="true";
	        		f.pcode.readOnly="true";
	        	}
	        	else{
	        		alert('중복된 번호입니다');
	        	}
	        	
	         }
	         
	      }
	      
	      var gopage = "/portfolio/doublecheck.jsp?productnum="+pcode;
	      aj = wck();
	      aj.onreadystatechange = acall;
	      aj.open("get",gopage,true);
	      aj.send();
	      
	   }

	
	
}

</script>


</html>