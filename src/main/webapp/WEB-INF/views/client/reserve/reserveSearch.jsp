<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
	    width: 800px;
	    display: flex;
	    justify-content: space-around;
	    align-items: center; /* 수평 중앙 정렬 */
	    margin:auto;
	    margin-top:100px;
	}
	
	h2 {
		margin-bottom: 15px;
	}
	
	#login-container h2 {
		margin-bottom: 33px;
	}
	
	#non-container, #login-container {
	    width: 40%;
	    height: 250px;
	    margin: auto;
	    display: flex;
	    flex-direction: column;
	    
	    align-items: center; /* 수평 중앙 정렬 */
	}
	
	form input[type="text"],form input[type="password"] {
	    margin: 5px 0; /* 입력 필드 사이의 간격 */
	    height: 30px;
	    border:none;
	    border-bottom: 1px solid black;
	    width: 300px;
	}
	
	form input[type="submit"] {
		width:280px;
		height: 30px;
		margin-top:5px;
		border:none;
		background: #7D78FF;
		color: white;
	}
	
	form input[type="submit"]:hover {
		background: #ccc;
	}
	
	form {
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	
	#radio-container input {
		margin-left: 15px;
	}
	#phone-container {
		display: flex;
		justify-content: space-between;
		align-items: center; /* 수평, 수직 중앙 정렬 */
		margin: 0px 10px;
	}
	
	#phone-container input {
		width:30%;
		vertical-align: middle; /* 입력 필드 수직 중앙 정렬 */
	}

	#phone-container span {
		vertical-align: middle; /* '-' 수직 중앙 정렬 */
	}
	
	#jumin-container {
		display: flex;
		justify-content: space-between;
		align-items:center;
		margin: 0px 10px;
		display:none;
	}
	
	#jumin-container input {
		width:48%;
		vertical-align: middle;
	}
	
	#jumin-container span {
		vertical-align: middle; /* '-' 수직 중앙 정렬 */
	}
</style>
<script>
	window.onload=function() {
		document.getElementById("phone").checked=true;
	}

	function self(my) {
		var phone=document.getElementById("phone-container");
		var jumin=document.getElementById("jumin-container");
		var chk=document.getElementById("chk");
		
		if(my.id==="phone") {
			phone.style.display="flex";
			jumin.style.display="none";
			chk.value="0";
		} else {
			phone.style.display="none";
			jumin.style.display="flex";
			chk.value="1";
		}
	}
	
	function onlyNum(my,next,maxlength) {
		my.value=my.value.replace(/[^0-9]/g,"");
		
		if(my.value.length==maxlength) {
			document.getElementById(next).focus();
		}
	}
</script>
</head>
<body>
	<section>
		<div id="non-container">
		<h2>비회원 조회</h2>
			<form method="post" action="reserveView" onsubmit="return non()">
				<input type="hidden" name="user_phone">
				<input type="hidden" name="user_jumin">	
				<input type="hidden" name="chk" id="chk" value="0">
				<div id="radio-container">
					<label><input type="radio" id="phone" name="sel" onclick="self(this)">핸드폰으로 조회</label>
					<label><input type="radio" id="jumin" name="sel" onclick="self(this)">주민번호로 조회</label>
				</div>
				<input type="text" name="user_id" placeholder="성함">
				<div id="phone-container">
					<input type="text" id="phone1" placeholder="연락처" maxlength="3" oninput="onlyNum(this,'phone2',3)">
					<span>-</span>
					<input type="text" id="phone2" maxlength="4" oninput="onlyNum(this,'phone3',4)">
					<span>-</span>
					<input type="text" id="phone3" maxlength="4" oninput="onlyNum(this,null,null)">
				</div>
				<div id="jumin-container">
					<input type="text" id="jumin1" placeholder="주민등록번호" maxlength="6" oninput="onlyNum(this,'jumin2',6)">
					<span>-</span>
					<input type="password" id="jumin2" maxlength="7" oninput="onlyNum(this,null,null)">
				</div>
				<input type="submit" value="조회하기">
			</form>
		</div>
		<div id="login-container">
		<h2>회원 로그인</h2>
			<form method="post" action="loginOk">
				<input type="text" name="user_id" placeholder="아이디">
				<input type="password" name="user_pwd" placeholder="비밀번호">
				<input type="submit" value="로그인">
			</form>
		</div>
	</section>
</body>
</html>