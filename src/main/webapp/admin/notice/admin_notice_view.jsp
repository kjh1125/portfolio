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
    <link rel="stylesheet" type="text/css" href="../css/notice.css?v=5">
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
<form name="f" id="f" enctype="multipart/form-data" method="post" action="/portfolio/Notice_Revise.do">
<main class="maincss">
<section style="height: auto;">
<%@include file="./notice_view.jsp" %>
</section>
</main>
</form>
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
	        	 location.href="./admin_notice.jsp";
	         }
	         
	      }
	      
	      var gopage = "../delete.jsp?noticeview="+idx;
	      aj = wck();
	      aj.onreadystatechange = acall;
	      aj.open("get",gopage,true);
	      aj.send();
	      
	   }
	else{
		alert("아니오를 눌렀습니다.");
		
	}
}
		
function revise(){
	f.submit();
	
}


</script>

</html>