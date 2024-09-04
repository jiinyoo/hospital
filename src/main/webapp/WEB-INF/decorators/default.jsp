<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
@font-face {
    font-family: 'goorm-sans-bold';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408@1.0/goorm-sans-bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
body {
	font-family: 'goorm-sans-bold';
    background-color: #f2f4f9;
    margin: 0;
    padding: 0;
}
* {margin:0; padding:0; box-sizing: border-box;}

#ads{
	position:relative;
	width:100%;
	height:50px;
	background:#8C8C8C;
	margin:auto;
}

#ad{
	margin:auto;
	width:100%;

}
#container
{
	position:relative;
	width:1300px;
	margin:auto;

}

#xx {
    position:absolute;
    right:0;
    text-align:right;
    top: 15px;
    color: black;
    cursor:pointer;

}

#loginbar{
	
	margin:auto;
	margin-top: 15px;
	width:1300px;
	height:30px;
	text-align:right;
	align-items:center;

}

nav{
 position :relative;
 width:1300px;
 height:100px;
 margin:auto;
 font-size:20px;
}

nav #mainmenu{
	width:1300px;
}

nav #mainmenu #maincate
{
	padding-left:0px;
	
}

#mainmenu #maincate > li {
	display:inline-block;
	list-style-type:none;
	width:180px;
	text-align:center;
	height:100px;
	line-height:100px;
	margin: 0; /* 기본 마진 제거 */
	padding: 0; /* 기본 패딩 제거 */
	position:relative;
	cursor: pointer;

}

#maincate .logo img {

	width:90px;
	transition: all 0.3s ease;
}

#maincate .logo img:hover {
	transform: scale(1.1);
	background-color: none;
}

#maincate .hov {
    transition: all 0.7s ease;
}

#maincate .hov:hover {
    background-color: #B5B2FF;
}


#submenus {
	display:flex;
	flex-wrap:wrap;
	text-align:center;
}

#submenus .submenu
{
	display:none;
	padding-left:0px;
	width:183px;
	left:0px;
	top:90px;
	background:white;
	border:0.5px solid grey;
    
}


#submenus .submenu:last-child
{

	width:200px;

}

#submenus .submenu > li
{
	list-style-type:none;
	justify-content: center;
	display:flex;
	width:183px;
	height:30px;
	line-height: 30px; /* 중앙 정렬 */
    margin: 0; /* 기본 마진 제거 */
    padding: 0; /* 기본 패딩 제거 */
	font-size: 14px;
	cursor: pointer;
    transition: all 0.3s ease;
}

#submenus .submenu > li > a {
    padding:0px 63px;
}

#submenus .submenu > li:hover {
	background-color: #B5B2FF;
	
}
#submenus .submenu > li:first-child

{
	border-top:5px solid #DAD9FF;
	
}

#submenus .submenu > li:last-child

{
	border-bottom:5px solid #DAD9FF;

}

#submenus .submenu:last-child > li
{

	width:200px;
	
}



hr{
 border:0.1px solid #ccc;
}

</style>
<script>
	
	function viewSub()
	{
		var submenus=document.getElementsByClassName("submenu");
		for(submenu of submenus)
			{
				submenu.style.display="block";
			}
		
	}
	
	
	function hideSub()
	{
		//div영역을 생성하고 해야하나?
		var submenus=document.getElementsByClassName("submenu");
		for(submenu of submenus)
			{
				submenu.style.display="none";
			}
		
	}

	function adx(){
		
		var h=0;
		function move(){
			if(h<=50)
				document.getElementById("ad").style.marginTop=-h+"px";
			h++;
			setTimeout(move,15);
		}
		move();
	}
	
</script>

 <sitemesh:write property="head"/>

</head>
<body>
<div id="ads">
	<div id="ad">
		<div id="container">
		<div id="xx" onclick="adx()">닫기</div>
		</div>
	</div>
</div>
<header>
		<div id="loginbar"> 
		 <c:if test="${user_id == null }">
		  <a href="/main/login"> 로그인 </a>| 
		  <a href="/main/user"> 회원 가입 </a>
		 </c:if>
		 <c:if test="${user_id != null }">
		   ${user_id}님 | 
           <a href="/login/logout"> 로그아웃 </a> | 문의하기
         </c:if>
		</div>
</header>
<hr>

	<nav>
	<span id="total" onmouseout="hideSub()">
	<span id="mainsub">
	<div id="mainmenu"  onmouseover="viewSub()">
		<ul id="maincate">
			<li class="logo">
			 <a href="/main/index">
			  <img src="../static/client/main/병원 로꼬.png" width="100" valign="middle">
			 </a>
			</li>
			<li class="hov">병원 소개</li>
			<li class="hov">의료진 안내</li>
			<li class="hov">상담/예약</li>
			<li class="hov">프로그램 예약</li>
			<li class="hov">커뮤니티</li>
			<li class="hov">건강 정보</li>
		</ul>
	</div>
	
	<div id="submenus"  onmouseover="viewSub()">
		<ul class="submenu">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
		
		<ul class="submenu">
			<li>병원 인삿말</li>
			<li>미션과 비전</li>
			<li>조직도</li>
			<li>오시는 길</li>
		</ul>
		
		<ul class="submenu">
			<li>정신과</li>
			<li>내분비과</li>
		    <li>치과</li>
		    <li>이비인후과</li>
		</ul>
		
		<ul class="submenu">
			<li>1:1문의</li>
			<li>온라인 진료 예약</li>
			<li>예약 조회</li>
			<li></li>
		</ul>
		
		<ul class="submenu">
		
			<li>프로그램 예약</li>
			<li></li>
			<li></li>
			<li></li>
		
		</ul>
		
		
		<ul class="submenu">
				<li>공지사항</li>
				<li>진료과별 질문</li>
				<li><a href="../../boardlist">진료 후기</a></li>
				<li>고객의 소리</li>
		</ul>
		
		
		<ul class="submenu">
			<li>건강정보</li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
		
		
	
	</div>
	</span>
	</span>
	</nav>
	<hr>
	<div class="haha">
	  
	</div>


<sitemesh:write property="body"/>


<footer>

</footer>


</body>
</html>