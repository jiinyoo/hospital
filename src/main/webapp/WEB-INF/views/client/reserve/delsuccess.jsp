<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:400px;
		margin:250px auto;
		min-height: 500px;
	}
</style>
<script>
	var countdown=2;
	
	window.onload=function() {
		var ele=document.getElementById("countdown");
		
		timer=setInterval(function() {
			ele.innerHTML=countdown;
			countdown--;
			
			if(countdown<0) {
				clearInterval(timer);
				window.location.href="/main/index";
			}
		},1000)
	}
</script>
</head>
<body>
	<section>
		<div>예약 취소가 완료되었습니다.</div>
		<div><span id="countdown">3</span>초 후에 메인으로 이동합니다.</div>
	</section>
</body>
</html>