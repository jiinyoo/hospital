<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <style>
        body {
            font-family: 'goorm-sans-bold';
            background-color: #f2f4f9;
            margin: 0;
            padding: 0;
        }

        .edit-container {
            width: 80%;
            max-width: 900px;
            margin: 80px auto;
            padding: 30px;
            padding-left: 80px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .edit-left {
            display: flex;
            align-items: center;
            width: 50%;
        }

        .edit-left .icon {
            font-size: 60px;
            color: #007bff;
            margin-right: 20px;
        }

        .edit-left h3 {
            font-size: 24px;
            color: #007bff;
            margin-bottom: 10px;
        }

        .edit-left p {
            font-size: 14px;
            color: #555;
        }

        .edit-right {
            font-size: 18px;
            width: 47%;
        }

        .edit-right input[type="text"],
        .edit-right input[type="submit"] {
            width: calc(80% - 30px);
            padding: 10px;
            margin: 10px 0;
            font-size: 15px;
            border: 1px solid #ced4da;
            border-radius: 7px;
        }

        .edit-right input[type="submit"] {
        	font-family: 'goorm-sans-bold';
            width: 40%;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            font-size: 18px;
            border-radius: 5px;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .edit-right input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .info-label {
            margin-right: 10px;
            font-weight: bold;
            display: inline-block;
            width: 80px;
            color: #333;
        }

        .form-group {
            margin: 10px 0;
        }

        .user-id-display {
            font-weight: bold;
            font-size: 18px;
            color: #333;
        }
        
        .user-id-display strong {
            display: inline-block;
            width: 100px;
            font-weight: bold;
            margin-top:20px;
            margin-bottom: 10px;
            color: #333;
        }

        /* 수정 버튼을 오른쪽으로 정렬 */
        .form-group.submit-group {
        	margin-top:18px;
        	padding-left:30px;
            text-align: center;
        }
        
    </style>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
</head>
<body>
	
    <div class="edit-container">
        <div class="edit-left">
            <i class="fas fa-user-edit icon"></i>
            <div>
                <h3>회원 정보 수정</h3>
                <p>회원님의 정보를 수정하세요.</p>
            </div>
        </div>

        <div class="edit-right">
            <form method="post" action="updateOkUser">
                <!-- 아이디는 텍스트로만 표시 -->
                <div class="form-group">
                    <span class="user-id-display"><strong>아이디</strong> ${user.user_id}</span>
                    <input type="hidden" name="user_id" value="${user.user_id}">
                </div>

                <div class="form-group">
                    <label class="info-label">이름</label>
                    <input type="text" name="user_name" value="${user.user_name}" placeholder="이름을 입력하세요">
                </div>

                <div class="form-group">
                    <label class="info-label">전화번호</label>
                    <input type="text" name="user_phone" value="${user.user_phone}" placeholder="전화번호를 입력하세요">
                </div>

                <div class="form-group">
                    <label class="info-label">이메일</label>
                    <input type="text" name="user_email" value="${user.user_email}" placeholder="이메일을 입력하세요">
                </div>

                <div class="form-group">
                    <label class="info-label">주민번호</label>
                    <input type="text" name="user_jumin" value="${user.user_jumin}" placeholder="주민번호를 입력하세요">
                </div>

                <div class="form-group">
                    <label class="info-label">주소</label>
                    <input type="text" name="user_addr" value="${user.user_addr}" placeholder="주소를 입력하세요">
                </div>

                <div class="form-group submit-group">
                    <input class="submit" type="submit" value="정보 수정">
                </div>
            </form>
        </div>
    </div>
</body>
</html>
