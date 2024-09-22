<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<style>

   body 
   {
      font-family: 'goorm-sans-bold';
      background-color: #f2f4f9;
      margin: 0;
      padding: 0;    
   }

   .user-container 
   {
      width: 80%;
      max-width: 900px;
      margin: 80px auto;
      padding: 40px;
      padding-left:80px;
      background-color: #ffffff;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      display: flex;
      justify-content: space-between;
      align-items: center;
   }

        .user-left {
            display: flex;
            align-items: center;
            width: 50%;
        }

        .user-left .icon {
            font-size: 60px;
            color: #007bff;
            margin-right: 20px;
        }

        .user-left h3 {
            font-size: 24px;
            color: #007bff;
            margin-bottom: 10px;
        }
        
        .user-left p {
            font-size: 14px;
            color: #555;
        }

        .user-right {
            width: 44%;
            text-align: left;
        }

        .user-right .info-item {
            margin: 14px 0;
            font-size: 18px;
            color: #555;
        }

        .user-right .info-item strong {
            display: inline-block;
            width: 120px;
        }

        .btn-container {
            text-align: center;
            margin-top: 30px;
        }

        .btn-container a {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-container a:hover {
            background-color: #0056b3;
        }
    </style>
    
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/js/all.min.js"></script>
    
</head>
<body>
    <div class="user-container">
    
        <div class="user-left">
        
            <i class="fas fa-user icon"></i>
            
            <div>
                <h3>회원 정보</h3>
                <p>회원님의 정보를 확인하세요.</p>
            </div>
            
        </div>

        <div class="user-right">
        
            <div class="info-item"><strong>아이디</strong> ${user.user_id}</div>
            <div class="info-item"><strong>이름</strong> ${user.user_name}</div>
            <div class="info-item"><strong>전화번호</strong> ${user.user_phone}</div>
            <div class="info-item"><strong>이메일</strong> ${user.user_email}</div>
            
            <c:set var="jumin" value="${fn:replace(user.user_jumin, '-', '')}" />
            <c:set var="juminFront" value="${fn:substring(jumin, 0, 6)}" />
            <c:set var="juminFirstBack" value="${fn:substring(jumin, 6, 7)}" />
            <div class="info-item">
            	<strong>주민번호</strong> ${juminFront}-${juminFirstBack}<c:forEach var="i" begin="1" end="6">*</c:forEach>
            </div>
            
            <div class="info-item"><strong>주소</strong> ${user.user_addr}</div>
            <div class="info-item"><strong>가입일</strong> ${user.writeday}</div>

            <div class="btn-container">
                <a href="updateUser">정보 수정</a>
            </div>
            
        </div>
        
    </div>

</body>
</html>
