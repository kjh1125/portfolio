<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쇼핑몰 환경설정</title>
    <link rel="stylesheet" type="text/css" href="../css/basic.css">
    <link rel="stylesheet" type="text/css" href="../css/login.css?v=1">
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="stylesheet" type="text/css" href="../css/shipping.css?v=1">
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
<main class="maincss">
<section style="height: auto;">
<%@include file="./shopping_list.jsp" %>
</section>
</main>
<footer class="main_copyright">
<%@include file="../admin_footer.jsp" %>
</footer>
</body>
<script>
function del2(idx){
	
	
	if(confirm("해당 내용을 정말로 삭제하시겠습니까?")){
		 var aj;
	      function wck(){
	         if(window.XMLHttpRequest){
	     	       return new XMLHttpRequest();
	      	  }
	      }
	      function acall(){
	         if(aj.readyState == XMLHttpRequest.DONE && aj.status==200){   
	            
	        	 alert('삭제완료');
	        	 location.href="./admin_shopping.jsp";
	         }
	         
	      }
	      
	      var gopage = "../delete.jsp?coupon="+idx;
	      aj = wck();
	      aj.onreadystatechange = acall;
	      aj.open("get",gopage,true);
	      aj.send();
	      
	   }
	else{
		alert("아니오를 눌렀습니다.");
		
	}
}


</script>

</html>