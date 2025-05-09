<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
  body 
  {
    font-family: 'goorm-sans-bold';
    background-color: #f2f4f9;
    margin: 0;
    padding: 0;
  }

  .register-container 
  {
    width: 80%;
    max-width: 500px;
    margin: 50px auto;
    padding: 30px;
    background-color: #ffffff;
    border-radius: 15px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
  }

  h3 
  {
    text-align: center;
    color: #007bff;
    margin-bottom: 30px;
  }

  .form-group 
  {
    margin-bottom: 15px;
  }

  .form-group input[type="text"],
  .form-group input[type="password"],
  .form-group input[type="submit"],
  .form-group select 
  {
  	font-family: 'goorm-sans-bold';
    width: calc(100% - 10px);
    padding: 12px;
    margin: 5px 0;
    border: 1px solid #ced4da;
    border-radius: 10px;
    font-size: 14px;
    box-sizing: border-box;
  }

  .form-group input[type="submit"] 
  {
  	font-family: 'goorm-sans-bold';
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-top: 14px;
    font-size: 16px;
  }

  .form-group input[type="submit"]:hover 
  {
    background-color: #0056b3;
  }

  .form-group span 
  {
    display: block;
    font-size: 12px;
    margin-top: 5px;
  }

  .form-group span.green 
  {
    color: #28a745;
  }

  .form-group span.red 
  {
    color: #dc3545;
  }

  .email-group 
  {
  	width: calc(100% - 10px);
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 5px;
  }

  .email-group input[type="text"],
  .email-group select 
  {
    width: 48%;
  }

  #phone-container,
  #jumin-container 
  {
  	width: calc(100% - 10px);
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
  }

  #phone-container input 
  {
  	font-family: 'goorm-sans-bold';
    width: 30%;
    padding: 12px;
    margin: 5px 0;
    border: 1px solid #ced4da;
    border-radius: 10px;
    font-size: 14px;
  }
  
  #jumin-container input 
  {
  	font-family: 'goorm-sans-bold';
    width: 47%;
    padding: 12px;
    margin: 5px 0;
    border: 1px solid #ced4da;
    border-radius: 10px;
    font-size: 14px;
  }

  #phone-container span,
  #jumin-container span {
    vertical-align: middle;
    font-size: 18px;
  }

  #jumin-container input[type="password"] 
  {
    letter-spacing: 3px;
  }
  
  .additional-links 
  {
    text-align: center;
    margin-top: 15px;
    padding-left: 20px;
  }

  .additional-links a 
  {
    margin: 0 10px;
    font-size: 14px;

    color: #007bff;
    text-decoration: none;
  }

  .additional-links a:hover 
  {
    text-decoration: underline;
  }

</style>

<script>
  
  function adServer(server) 
  {
    document.mform.e2.value=server;
  }

  var uchk=0;
  function useridCheck(user_id) 
  {
    if (user_id.trim().length>=6) 
    {
      var chk=new XMLHttpRequest();
      chk.onload=function() 
      {
        if (chk.responseText=="0") 
        {
          document.getElementById("uId").innerText="사용가능한 아이디 입니다";
          document.getElementById("uId").style.color="green";
          uchk=1;
        } 
        else 
        {
          document.getElementById("uId").innerText="사용불가능한 아이디 입니다";
          document.getElementById("uId").style.color="red";
          uchk=0;
        }
      }
      chk.open("get","useridCheck?user_id="+user_id);
      chk.send();
    } 
    else 
    {
      document.getElementById("uId").innerText="아이디를 확인해주세요";
      document.getElementById("uId").style.color="red";
      uchk=0;
    }
  }

  var pchk=0;
  function pwdCheck(n) 
  {
    var user_pwd=document.mform.user_pwd.value;
    var pwd2=document.mform.pwd2.value;
    var pwdPattern=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,20}$/;

    if (!pwdPattern.test(user_pwd)) 
    {
      document.getElementById("pId").innerText="비밀번호는 8~20자, 영문, 숫자, 특수문자를 포함해야 합니다.";
      document.getElementById("pId").style.color="red";
      pchk=0;
      
      return;
    }

    if (n==1 || (n==0 && pwd2!="")) 
    {
      if (user_pwd==pwd2) 
      {
        document.getElementById("pId").innerText="비밀번호가 일치합니다";
        document.getElementById("pId").style.color="green";
        pchk = 1;
      } 
      else 
      {
        document.getElementById("pId").innerText="비밀번호가 일치하지 않습니다";
        document.getElementById("pId").style.color="red";
        pchk = 0;
      }
    }
  }

  function check() {
	    var user_email = document.mform.e1.value + "@" + document.mform.e2.value;
	    var user_phone = document.mform.phone1.value + "-" + document.mform.phone2.value + "-" + document.mform.phone3.value;
	    var user_jumin = document.mform.jumin1.value + "-" + document.mform.jumin2.value;
	    var user_pwd = document.mform.user_pwd.value;
	    var pwdPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;

	    if (uchk == 0) {
	        alert("아이디를 확인하세요");
	        return false;
	    }

	    if (document.mform.user_name.value == "") {
	        alert("이름을 입력하세요");
	        return false;
	    }

	    if (!pwdPattern.test(user_pwd)) {
	        alert("비밀번호는 8~20자, 영문, 숫자, 특수문자를 포함해야 합니다.");
	        return false;
	    }

	    if (pchk == 0) {
	        alert("비밀번호를 확인하세요");
	        return false;
	    }

	    if (document.mform.phone1.value == "" || document.mform.phone2.value == "" || document.mform.phone3.value == "") {
	        alert("전화번호를 입력하세요");
	        return false;
	    }

	    if (document.mform.e1.value == "" || document.mform.e2.value == "") {
	        alert("이메일을 입력하세요");
	        return false;
	    }

	    if (document.mform.jumin1.value == "" || document.mform.jumin2.value == "") {
	        alert("주민번호를 입력하세요");
	        return false;
	    }

	    if (document.mform.user_addr.value == "") {
	        alert("주소를 입력하세요");
	        return false;
	    }

	    // 전화번호와 주민번호를 합친 값을 숨겨진 필드에 설정
	    document.mform.user_email.value = user_email;
	    document.mform.user_phone.value = user_phone;
	    document.mform.user_jumin.value = user_jumin;
	    

	    return true;
	}


  function onlyNum(my, next, maxlength) 
  {
    my.value=my.value.replace(/[^0-9]/g,"");
    
    if(my.value.length==maxlength && next!=null) 
    {
      document.getElementById(next).focus();
    }
  }

</script>
</head>
<body>

  <div class="register-container">
    <form name="mform" method="post" action="userOk" onsubmit="return check()">

      <input type="hidden" name="user_email">
      <input type="hidden" name="user_phone">
      <input type="hidden" name="user_jumin">
      <h3> 회원 가입 </h3>

      <div class="form-group">
        <input type="text" name="user_id" id="txt" placeholder="아이디" onblur="useridCheck(this.value)">
        <span id="uId"></span>
      </div>

      <div class="form-group">
        <input type="text" name="user_name" id="txt" placeholder="이름">
      </div>

      <div class="form-group">
        <input type="password" name="user_pwd" id="txt" onkeyup="pwdCheck(0)" placeholder="비밀번호">
      </div>

      <div class="form-group">
        <input type="password" name="pwd2" id="txt" onkeyup="pwdCheck(1)" placeholder="비밀번호 확인">
        <span id="pId"></span>
      </div>

      <div id="phone-container">
        <input type="text" name="phone1" id="phone1" placeholder="연락처" maxlength="3" oninput="onlyNum(this,'phone2',3)">
        <span>-</span>
        <input type="text" name="phone2" id="phone2" maxlength="4" oninput="onlyNum(this,'phone3',4)">
        <span>-</span>
        <input type="text" name="phone3" id="phone3" maxlength="4" oninput="onlyNum(this,null,null)">
      </div>

      <div class="form-group email-group">
        <input type="text" name="e1" id="txt" placeholder="이메일 아이디">@
        <input type="text" name="e2" id="txt" placeholder="이메일 주소">
        <select onchange="adServer(this.value)">
          <option>직접입력</option>
          <option value="naver.com">네이버</option>
          <option value="daum.net">다음</option>
          <option value="yahoo.com">야후</option>
          <option value="google.com">구글</option>
        </select>
      </div>

      <div id="jumin-container">
        <input type="text" name="jumin1" id="jumin1" placeholder="주민등록번호" maxlength="6" oninput="onlyNum(this,'jumin2',6)">
        <span>-</span>
        <input type="password" name="jumin2" id="jumin2" maxlength="7" oninput="onlyNum(this,null)">
      </div>

      <div class="form-group">
        <input type="text" name="user_addr" id="txt" placeholder="주소">
      </div>

      <div class="form-group">
        <input type="submit" value="회원 등록" id="submit">
      </div>
      
      <div class="additional-links">
          <a href="/main/login">로그인</a> | 
          <a href="/main/idSearch">아이디 찾기</a> | 
          <a href="/main/pwdSearch">비밀번호 찾기</a>
        </div>

    </form>
  </div>

</body>
</html>
