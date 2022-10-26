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
<main class="maincss">
<section style="height: auto;">
<%@include file="./product_list.jsp" %>
</section>
</main>
<footer class="main_copyright">
<%@include file="../admin_footer.jsp" %>
</footer>
</body>

<script>
function check() {  
	var a = allcheck.checked;
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

function pagego(pgno){
 	var s = document.getElementById("search").value;
 	var c = document.getElementById("searchcategory");
 	var cateval = (c.options[c.selectedIndex].value);
	
	location.href="./admin_product.jsp?page="+pgno+"&type="+cateval+"&search="+s;
	
}

function del(){
	var a = document.getElementsByName('check');
	var w = 0;
	var add ='';
	for(var checkbox of a){
	if(checkbox.checked==true){
		w++;
		add+=checkbox.value+',';
	}
		
	}
	if(w==0){
		alert('삭제할 카테고리를 선택하세요');
	}
	if(w!=0){
		 var aj;
	      function wck(){
	         if(window.XMLHttpRequest){
	     	       return new XMLHttpRequest();
	      	  }
	      }
	      function acall(){
	         if(aj.readyState == XMLHttpRequest.DONE && aj.status==200){   
	            
	        	 alert('삭제완료');
	        	 location.reload();
	         }
	         
	      }
	      
	      var gopage = "../delete.jsp?productdel="+add;
	      aj = wck();
	      aj.onreadystatechange = acall;
	      aj.open("get",gopage,true);
	      aj.send();
	      
	   }
		
	}



</script>
</html>