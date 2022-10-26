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
<link rel="stylesheet" type="text/css" href="../css/category.css?v=2">
<link rel="icon" href="./img/logo.png" sizes="128x128">
<link rel="icon" href="./img/logo.png" sizes="64x64">
<link rel="icon" href="./img/logo.png" sizes="32x32">
<link rel="icon" href="./img/logo.png" sizes="16x16">
<script src="../js/jquery.js"></script>
</head>
<body>
	<header class="headercss">
		<%@include file="../admin_header.jsp"%>
	</header>
	<nav class="navcss">
		<%@include file="../admin_menu.jsp"%>
	</nav>
	<form name="f" enctype="application/x-www-form-urlencoded"
		method="post" action="/portfolio/Category_Insert.do">
		<main class="maincss">
			<section style="height: auto;">
				<%@include file="./cate_write.jsp"%>
			</section>
		</main>
	</form>
	<footer class="main_copyright">
		<%@include file="../admin_footer.jsp"%>
	</footer>
</body>
<script>
	function cate_write() {

		f.submit();

	}

	function code123() {

		var a = f.bcode.value;
		var b = f.scode.value;
		f.code.value = a + b;
		switch (a) {
		case '01':
			f.bcodenm.value = '가구';
			break;
		case '02':
			f.bcodenm.value = '전자기기';
			break;
		case '03':
			f.bcodenm.value = '여행상품';
			break;
		}
		if(a=='01'){
			switch (b) {
			case '01':
				f.scodenm.value = '매트리스';
				break;
			case '02':
				f.scodenm.value = '서랍장';
				break;
			case '03':
				f.scodenm.value = '소파';
				break;
			}
		}
		else if(a=='02'){
			switch (b) {
			case '01':
				f.scodenm.value = '컴퓨터';
				break;
			case '02':
				f.scodenm.value = '휴대폰';
				break;
			case '03':
				f.scodenm.value = 'USB';
				break;
			}	
		}
		else if(a=='03'){
			switch (b) {
			case '01':
				f.scodenm.value = '제주도';
				break;
			case '02':
				f.scodenm.value = '하와이';
				break;
			case '03':
				f.scodenm.value = '경주';
				break;
			}
		}
		

	}
</script>

</html>