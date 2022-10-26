<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 등록 페이지</title>
<link rel="stylesheet" type="text/css" href="./css/basic.css">
<link rel="stylesheet" type="text/css" href="./css/login.css?v=1">
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="icon" href="./img/logo.png" sizes="128x128">
<link rel="icon" href="./img/logo.png" sizes="64x64">
<link rel="icon" href="./img/logo.png" sizes="32x32">
<link rel="icon" href="./img/logo.png" sizes="16x16">
<script src="./js/jquery.js"></script>
</head>
<body>
	<header class="headercss">
		<%@include file="./admin_header.jsp"%>
	</header>
	<nav class="navcss">
		<%@include file="./admin_menu.jsp"%>
	</nav>
	<form name="f" id="f" enctype="application/x-www-form-urlencoded" method="post" action="/portfolio/Information_Revise.do">
		<main class="maincss">
			<section
				style="width: 100%; height: 480px; background-color: rgb(31, 31, 31); margin-bottom: 20px;">
				<%@include file="./info_view.jsp"%>
			</section>
		</main>
	</form>
	<footer class="main_copyright">
		<%@include file="./admin_footer.jsp"%>
	</footer>
</body>
<script>
	function revise() {
		
		var tel = f.tel1.value+f.tel2.value+f.tel3.value;
		let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}'); // 이메일 확인 정규식
		
		if (f.pw1.value != f.pw2.value || f.pw1.value == "") {
			alert("비밀번호를 다시 확인해주세요.");
		}
		else if (f.name.value == "") {
			alert("이름을 다시 확인해주세요.");
			f.name.focus();
		}
		else if (regex.test(f.email.value) != true) {
			alert("이메일을 다시 확인해주세요.");
			f.email.focus();
		}
		else if (f.tel1.value == ""||f.tel2.value == ""||f.tel3.value == "") {
			alert("전화번호를 다시 확인해주세요.");
		}
		else if(tel.length<11){
			alert("전화번호 길이를 다시 확인해주세요.");
		}
		
		else if (f.depart.value == 0) {
			alert("부서를 선택해주세요.");
		}
		else if (f.position.value == 0) {
			alert("직책을 선택해주세요.");
		}
		else {
			f.submit();
		}

	}
</script>

</html>