<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  body {
    font-family: 'goorm-sans-bold';
    background-color: #f2f4f9;
    margin: 0;
    padding: 0;
  }

  section {
    width: 80%;
    max-width: 550px;
    margin: 50px auto;
    padding: 60px;
    background-color: #ffffff;
    border-radius: 40px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }

  h3 {
    text-align: center;
    color: #B5B2FF;
   /* margin-bottom: 20px;*/
  }

  .form-group {
    margin-bottom: 10px;
  }

  .form-group input[type="text"],
  .form-group input[type="password"],
  .form-group input[type="submit"],
  .form-group select {
    font-family: 'goorm-sans-bold';
    width: calc(100% - 22px);
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ced4da;
    border-radius: 10px;
    box-sizing: border-box;
  }

  .form-group input[type="submit"] {
    background-color: #B5B2FF;
    color: white;
    border: none;
    cursor: pointer;
  }

  .form-group input[type="submit"]:hover {
    background-color: #7D78FF;
  }

  .form-group span {
    display: block;
    font-size: 12px;
    margin-top: 5px;
  }

  .form-group span.green {
    color: #28a745;
  }

  .form-group span.red {
    color: #dc3545;
  }
  
  .form-jumin input[type="text"] {
  	width: calc(50% - 20px);
    padding: 10px;
    padding-right: 10px;
    margin: 5px 0;
    margin-bottom: 15px;
    border: 1px solid #ced4da;
    border-radius: 10px;
    box-sizing: border-box;
    outline: none;
    font-family: 'goorm-sans-bold';
  }

  .email-group { 
    align-items: center;
  }

  .email-group input[type="text"] {
    width: calc(41% - 30px);
    margin-right: 5px;
  }

  .email-group select {
    width: auto;
    margin-left: 5px;
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
  	if(user_id.trim().length>=6)
  	{
  		var chk=new XMLHttpRequest();
  		chk.onload=function()
  		{			
  			if(chk.responseText=="0")
  			{
  				document.getElementById("uId").innerText="사용가능한 아이디 입니다";
  	    		document.getElementById("uId").style.fontSize="11px";
  	    		document.getElementById("uId").style.color="green";
  	    		uchk=1;
  			}
  			else
  			{
  				document.getElementById("uId").innerText="사용불가능한 아이디 입니다";
  	    		document.getElementById("uId").style.fontSize="11px";
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
  		document.getElementById("uId").style.fontSize="11px";
  		document.getElementById("uId").style.color="red";
  		uchk=0;
  	}
  }
  
  var pchk=0;
  function pwdCheck(n)
  {
	  var user_pwd=document.mform.user_pwd.value;
	  var pwd2=document.mform.pwd2.value;
	  if(n==1 || (n==0 && pwd2!=""))
	  {	     
		   if(user_pwd==pwd2)
		   {
			   document.getElementById("pId").innerText="비밀번호가 일치합니다";
			   document.getElementById("pId").style.fontSize="11px";
			   document.getElementById("pId").style.color="green";
			   pchk=1;
		   }
		   else
		   {
			   document.getElementById("pId").innerText="비밀번호가 일치하지 않습니다";
			   document.getElementById("pId").style.fontSize="11px";
			   document.getElementById("pId").style.color="red";
			   pchk=0;
		   }	   
	  }
  }
  
  function check()
  {
	  var user_email=document.mform.e1.value+"@"+document.mform.e2.value; 
	  if(uchk==0)
	  {
		  alert("아이디를 확인하세요");
		  return false;
	  }	  
	  else if(document.mform.user_name.value=="")
		   {
		       alert("이름을 입력하세요");
		       return false;
		   }
	       else if(pchk==0)
	       {
	           alert("비밀번호 체크하세요");
	           return false;
	       }
	       else if(document.mform.user_phone.value=="")
		   {
		       alert("전화번호를 입력하세요");
		       return false;
		   }
	       else if(document.mform.e1.value=="")
		   {
		       alert("이메일을 입력하세요");
		       return false;
		   }
	       else if(document.mform.e2.value=="")
		   {
		       alert("이메일 주소 입력하세요");
		       return false;
		   }
	       else if(document.mform.user_jumin.value=="")
		   {
		       alert("주민번호 앞자리를 입력하세요");
		       return false;
		   }
	       else if(document.mform.user_addr.value=="")
		   {
		       alert("주소를 입력하세요");
		       return false;
		   }
	       else
 	       {
	    	   document.mform.user_email.value=user_email;
		       return true;
 	       }	   
  }
</script>
</head>
<body>
<section style="margin:auto;">
<main>
  <form name="mform" method="post" action="userOk" onsubmit="return check()">
   <input type="hidden" name="user_email">
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
    <div class="form-group"> 
      <input type="text" name="user_phone" id="txt" placeholder="전화번호">
    </div>
    <div class="form-group email-group">
      <input type="text" name="e1" id="txt" placeholder="이메일 아이디">@
      <input type="text" name="e2" id="txt" placeholder="이메일 주소">
      <select onchange="adServer(this.value)">
       <option> 직접입력 </option>
       <option value="naver.com"> 네이버 </option>
       <option value="daum.net"> 다음 </option>
       <option value="yahoo.com"> 야후 </option>
       <option value="google.com"> 구글 </option>
      </select>
    </div>
    <div class="form-jumin">
      <input type="text" name="user_jumin" id="txt" placeholder="주민번호 앞자리"> - ******
    </div>
    <div class="form-group">
      <input type="text" name="user_addr" id="txt" placeholder="주소">
    </div>
    <div class="form-group">
      <input type="submit" value="회원 등록" id="submit">
    </div> 
  </form>
</main>
</section>
</body>
</html>