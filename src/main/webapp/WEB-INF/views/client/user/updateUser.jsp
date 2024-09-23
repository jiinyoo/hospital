<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <style>
        body {
            font-family: 'goorm-sans-bold', sans-serif;
            background-color: #f2f4f9;
            margin: 0;
            padding: 0;
        }

        .edit-container {
            width: 90%;
            max-width: 900px;
            margin: 80px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .edit-left {
            display: flex;
            
            justify-content: center;
            width: 44%;
            
        }

        .edit-left .icon {
            font-size: 60px;
            color: #007bff;
            margin-bottom: 20px;
            margin-right: 10px;
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
            margin-right:10px;
        }

        .edit-right label {
            font-weight: bold;
            display: inline-block;
            width: 100px;
        }

        .edit-right input[type="text"],
        .edit-right input[type="submit"] {
        	width: 100%;
            padding: 7px;
            margin: 20px 0;
            font-size: 14px;
            border: 1px solid #ced4da;
            border-radius: 7px;
        }

        .edit-right input[type="submit"] {
        	font-family: 'goorm-sans-bold';
        	width: 40%;
        	padding: 10px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .edit-right input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .info-label {
            margin-right: 3px;
            font-weight: bold;
            display: inline-block;
            width: 80px;
            color: #333;
        }

        .form-group {
            margin: 10px 0;
        }

        .input-group {
            display: flex;
            align-items: center;
        }

        .input-group input[type="text"] {
            width: 50%;
            padding: 7px;
            text-align: center;
        }

        .input-group span {
            padding:  7px;
        }

        .form-group.submit-group {
            text-align: center;
            margin-top:14px;
            font-size: 14px;
        	
        }
    </style>
    
    <script type="text/javascript">
    function check() 
    {
        var user_email=document.mform.e1.value+ "@" +document.mform.e2.value;
        var user_phone=document.mform.phone1.value+ "-" +document.mform.phone2.value + "-" + document.mform.phone3.value;
        var user_jumin=document.mform.jumin1.value+ "-" +document.mform.jumin2.value;

        document.mform.user_email.value=user_email;
        document.mform.user_phone.value=user_phone;
        document.mform.user_jumin.value=user_jumin;

        return true;
    }

    function onlyNum(my, next, maxlength) 
    {
        my.value=my.value.replace(/[^0-9]/g,"");
        if (my.value.length==maxlength && next!=null) 
        {
            document.getElementById(next).focus();
        }
    }
</script>

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
            <form name="mform" method="post" action="updateOkUser" onsubmit="return check()">
                <input type="hidden" name="user_email">
                <input type="hidden" name="user_phone">
                <input type="hidden" name="user_jumin">
                
                <div class="form-group">
                    <label class="info-label">아이디</label>
                    <span>${user.user_id}</span>
                    <input type="hidden" name="user_id" value="${user.user_id}">
                    <button type="button" onclick="location.href='/main/uchangePwd'" style="font-family: 'goorm-sans-bold'; margin-left: 100px; padding: 10px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;">
        				비밀번호 변경
    				</button>
                </div>
					<br>
                <div class="form-group">
                    <label class="info-label">이름</label>
                    <input type="text" name="user_name" value="${user.user_name}" placeholder="이름을 입력하세요">
                </div>

                <div class="form-group">
                    <label class="info-label">전화번호</label>
                    <div class="input-group">
                        <input type="text" name="phone1" value="${fn:split(user.user_phone, '-')[0]}" maxlength="3" oninput="onlyNum(this, 'phone2', 3)">
                        <span>-</span>
                        <input type="text" name="phone2" value="${fn:split(user.user_phone, '-')[1]}" maxlength="4" oninput="onlyNum(this, 'phone3', 4)">
                        <span>-</span>
                        <input type="text" name="phone3" value="${fn:split(user.user_phone, '-')[2]}" maxlength="4" oninput="onlyNum(this, null, null)">
                    </div>
                </div>

                <div class="form-group">
                    <label class="info-label">이메일</label>
                    <div class="input-group">
                        <input type="text" name="e1" value="${fn:split(user.user_email, '@')[0]}" placeholder="이메일 ID">
                        <span>@</span>
                        <input type="text" name="e2" value="${fn:split(user.user_email, '@')[1]}" placeholder="도메인">
                    </div>
                </div>

                <div class="form-group">
                    <label class="info-label">주민번호</label>
                    <div class="input-group">
                        <input type="text" name="jumin1" value="${fn:split(user.user_jumin, '-')[0]}" maxlength="6" oninput="onlyNum(this, 'jumin2', 6)">
                        <span>-</span>
                        <input type="text" name="jumin2" value="${fn:split(user.user_jumin, '-')[1]}" maxlength="7" oninput="onlyNum(this, null)">
                    </div>
                </div>

                <div class="form-group">
                    <label class="info-label">주소</label>
                    <input type="text" name="user_addr" value="${user.user_addr}" placeholder="주소를 입력하세요">
                </div>

                <div class="form-group submit-group">
                    <input class="submit" type="submit" value="정보 수정">
                    <button type="button" onclick="location.href='/main/userInfo'"  style="font-family:'goorm-sans-bold'; margin-left: 20px; font-size: 16px; padding: 10px; background-color: #007bff; color: white; border: none; border-radius: 5px; cursor: pointer;">수정 취소</button>
                </div>
                
            </form>
        </div>
    </div>
</body>
</html>
