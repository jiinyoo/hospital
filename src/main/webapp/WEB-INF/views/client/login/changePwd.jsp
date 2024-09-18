<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <style>
        /* 스타일링 */
        .change-password-container {
            width: 80%;
            max-width: 600px;
            margin: 80px auto;
            padding: 40px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .change-password-container h3 {
            font-size: 24px;
            color: #007bff;
            margin-bottom: 20px;
            text-align: center;
        }

        .change-password-container input[type="password"] {
            width: calc(100% - 40px);
            padding: 15px;
            margin: 10px 0;
            font-size: 16px;
            border: 1px solid #ced4da;
            border-radius: 10px;
        }

        .change-password-container input[type="submit"] {
        	font-family: 'goorm-sans-bold';
            width: calc(100% - 40px);
            padding: 15px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 10px;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .change-password-container input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }

    </style>
    <script>
        function validatePwd() 
        {
            var newPwd=document.getElementsByName("new_pwd")[0].value;
            var confirmPwd=document.getElementsByName("confirm_pwd")[0].value;

            if (newPwd!==confirmPwd) 
            {
                document.getElementById("error-message").innerText="비밀번호가 일치하지 않습니다.";
                return false;
            } 
            else 
            {
                return true;
            }
        }
        
        window.onload = function() 
        {
            var success = "${success}";
            if (success === "true") {
                alert("비밀번호가 성공적으로 변경되었습니다.");
                window.location.href = "${pageContext.request.contextPath}/main/login";  // 성공 후 로그인 페이지로 이동
            } else if (success === "false") {
                alert("비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
            }
        }
        
    </script>
</head>
<body>
    <div class="change-password-container">
        <h3>비밀번호 변경</h3>
        <form method="post" action="${pageContext.request.contextPath}/main/changePwd" onsubmit="return validatePwd()">
            <input type="hidden" name="user_id" value="${user_id}"/>
            
            <label for="new_pwd">새로운 비밀번호</label>
            <input type="password" name="new_pwd" placeholder="새로운 비밀번호를 입력하세요" required>
            <br>
            <br>
            <label for="confirm_pwd">비밀번호 확인</label>
            <input type="password" name="confirm_pwd" placeholder="비밀번호를 다시 입력하세요" required>

            <!-- 에러 메시지 출력 영역 -->
            <div id="error-message" class="error-message"></div>
            
            <input type="submit" value="비밀번호 변경">
        </form>
    </div>

</body>
</html>
