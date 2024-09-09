<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>

* {margin:0; padding:0; box-sizing: border-box;}

 section {
      font-family: 'GmarketSansMedium';
      width:70%;
      height:360px;
      margin:auto;
      
      margin-bottom: 150px;
      border-radius: 30px;
      /*box-shadow: 0 0 40px rgba(0, 0, 0, 0.2);*/
   }

#slideouter{
 	width:100%;
 	magin:auto;
 	/*background:pink;*/
 	overflow:hidden;
}


#inner{	
	width:300%;
}
/* #inner:after {display:block; content:''; clear:both} */
#inner .slide_item {
	float: left;
	width:calc(100% / 3);
}
.slideimgs{
	width:100%;
}

#reserve-container {
	position:absolute;
	left:50%;
	top:50%;
	transform: translate(-50%, -100%);
	background: white;
	width:400px;
	padding:20px;
	border-radius: 10px;
	box-shadow: 0px 4px 8px rgba(0,0,0,0.2);
	text-align: center;
}

#reserve-container h3 {
	margin-bottom:20px;
}

#reserve-container button {
    background-color: #ff5e57;
    border: none;
    color: white;
    padding: 5px 16px;
    margin-top:12px;
    text-align: center;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

#reserve-container button:hover {
    background-color: #ff3b30;
}

#reserve-container button:focus {
    outline: none;
}
</style>
<script>
	$(function(){
		setInterval(function(){
		
			$("#inner").animate({
				marginLeft:"-100%"
			},2000,function(){
				$(".slide_item").eq(0).insertAfter($(".slide_item").eq(2))
				$("#inner").css("margin-left","0px");
			});
		},4000);
	});
	
	function closereserve() {
		document.getElementById("reserve-container").style.display="none";
	}

	
</script>
</head>
<body>
<!-- section을 기준으로 body에 들어갈 모든 내용을 규정해야함 -->
<section>
	<div id="slideouter">
		<div id="inner">
			<div class="slide_item"><img class="slideimgs" src="/static/client/main/1.jpg"></div>
			<div class="slide_item"><img class="slideimgs" src="/static/client/main/2.jpg"></div>
			<div class="slide_item"><img class="slideimgs" src="/static/client/main/3.jpg"></div>
		</div>
	</div>
</section>
<c:if test="${!empty rdto }">
<div id="reserve-container">
	<h2>${rdto.user_id}님 예약완료</h2>
	<h3>예약 번호 : ${rdto.res_code }</h4>
	<div>예약 날짜 : ${rdto.res_date }</div>
	<div>예약 시간 : ${rdto.res_time }</div>
	<button onclick="closereserve()">닫기</button>
</div>
</c:if>
지인쓰 바보
<hr>
dd
<hr>
dd
</body>
</html>