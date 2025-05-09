<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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



#reserve-container button:hover {
    background-color: #ff3b30;
}

#reserve-container button:focus {
    outline: none;
}

.none {
	min-height: 600px; 
}
</style>
</head>
<body>
<div class="none"></div>
<c:if test="${!empty rdto }">
<div id="reserve-container">
	<h2>${rdto.user_id}님 예약완료</h2>
	<h3>예약 번호 : ${rdto.res_code }</h4>
	<div>예약 날짜 : ${rdto.res_date }</div>
	<div>예약 시간 : ${rdto.res_time }</div>
</div>
</c:if>
</body>
</html>