<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
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
	}
	
	#jumin-container input {
		width:48%;
		vertical-align: middle;
	}

	
	#jumin-container span {
		vertical-align: middle; /* '-' 수직 중앙 정렬 */
	}
	
	#err {text-align: center;}
</style>
<script>
	function non() {
		var phone1=document.getElementById("phone1").value;
		var phone2=document.getElementById("phone2").value;
		var phone3=document.getElementById("phone3").value;
		
		var jumin1=document.getElementById("jumin1").value;
		var jumin2=document.getElementById("jumin2").value;
		
		// 이름이 입력되지 않았을 경우 경고
	    if (document.getElementsByName("user_id")[0].value.trim()==="") {
	        alert("성함을 입력해주세요.");
	        return false;
	    }

	    // 연락처가 제대로 입력되었는지 확인
	    if (phone1.length!==3 || phone2.length!==4 || phone3.length!==4) {
	        alert("유효한 연락처를 입력해주세요.");
	        return false;
	    }

	    // 주민등록번호 앞자리와 뒷자리가 제대로 입력되었는지 확인
	    if (jumin1.length!==6 || jumin2.length!==7) {
	        alert("유효한 주민등록번호를 입력해주세요.");
	        return false;
	    }

	    if(true) {
	    	document.getElementsByName("user_phone")[0].value=phone1+"-"+phone2+"-"+phone3;
	    	document.getElementsByName("user_jumin")[0].value=jumin1+"-"+jumin2;
	    	
	    	return true;
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
		<h2>비회원 예약</h2>
			<form method="post" action="reserve" onsubmit="return non()">
				<input type="hidden" name="user_phone">
				<input type="hidden" name="user_jumin">	
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
				<input type="submit" value="예약하기">
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
	<c:if test="${param.err==1 }">
	<div id="err">세션이 만료되었습니다.</div>
	</c:if>
</body>
</html>