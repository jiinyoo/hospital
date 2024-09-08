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
	    margin: 100px auto;
	}
	
	h2 {
		margin-bottom: 15px;
	}
	
	#non-container, #login-container {
	    width: 40%;
	    height: 300px;
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


	
</style>
</head>
<body>
	<section>
		<div id="non-container">
		<h2>비회원 예약</h2>
			<form method="post" action="reserve">
				<input type="text" name="user_id" placeholder="성함">
				<input type="text" name="user_phone" placeholder="연락처">
				<input type="text" name="user_jumin" placeholder="주민등록번호">
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
</body>
</html>