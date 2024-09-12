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
@font-face 
{
    font-family: 'goorm-sans-bold';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2408@1.0/goorm-sans-bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

body 
{
	font-family: 'goorm-sans-bold';
    background-color: #f2f4f9;
    margin: 0;
    padding: 0;
}

* {margin:0; padding:0; box-sizing: border-box;}

#ads
{
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

#event
{
	position:absolute;
    text-align:center;
    right:580px;
    top: 15px;
    color: black;
}

#xx 
{
    position:absolute;
    right:0;
    text-align:right;
    top: 15px;
    color: black;
    cursor:pointer;

}

#loginbar
{	
	margin:auto;
	margin-top: 15px;
	width:1300px;
	height:30px;
	text-align:right;
	align-items:center;
	text-decoration: none;
	color: black;

}

#loginbar > a 
{
	text-decoration: none;
	color: black;
}
	
nav
{
 	position :relative;
 	width:1300px;
 	height:100px;
 	margin:auto;
 	font-size:20px;
}

nav #mainmenu
{
	width:1300px;
}

nav #mainmenu #maincate
{
	padding-left:0px;
	
}

#mainmenu #maincate > li 
{
	display:inline-block;
	list-style-type:none;
	width:180px;
	color:#626262;
	text-align:center;
	height:100px;
	line-height:100px;
	margin: 0; /* 기본 마진 제거 */
	padding: 0; /* 기본 패딩 제거 */
	position:relative;
	cursor: pointer;

}

#mainmenu #maincate > li >a
{
	width: 100%;
	text-decoration: none;
	color:#626262;
	display: block;
}

#mainmenu #maincate > li:hover
{
	color:#5C1DB5;
}

#mainmenu #maincate > li > a:hover
{
	color:#5C1DB5;
}

#maincate .logo img 
{

	width:90px;
	transition: all 0.3s ease;
}

#maincate .logo img:hover 
{
	transform: scale(1.1);
	background-color: none;
}

#maincate .hov 
{
    transition: all 0.5s ease;
       
}

#maincate .hov:hover 
{
	transform: scale(1.1);
    // background-color: #B5B2FF;
}


#submenus 
{
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
	border-left:0.5px solid #DAD9FF;
	border-right:0.5px solid #DAD9FF;
	border-bottom:5px solid #C8C7ED;
	opacity: 0;  
	
}

#submenus .submenu:nth-child(n) 
{
    animation: slideDown 0.3s ease forwards;
    animation-delay: 0s;
}



#submenus .submenu:first-child
{
	border-top:5px solid #C8C7ED;
	
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
	font-size: 15px;
	cursor: pointer;
    transition: all 0.3s ease;

}

#submenus .submenu > li > a {
  
    text-decoration: none;
    width: 100%;
    text-align: center;
    display: block;
    color: black;

}



#submenus .submenu > li:hover 
{
	background-color: #B5B2FF;
	
}

#submenus .submenu > li:first-child
{
	border-top:5px solid #C8C7ED;
	
}

#submenus .submenu:last-child > li
{
	width:200px;
	
}

#submenus .submenu > li > a {

    text-decoration: none;
    width: 100%;
    text-align: center;
    display: block;
    color:black;

}

hr
{
 border:0.1px solid #ccc;
 
}

/* 계단형으로 서서히 내려오는 애니메이션 정의 */
@keyframes slideDown 
{
    from 
    {
        opacity: 0;
        transform: translateY(-15px); /* 메뉴가 위에서부터 내려오는 느낌 */
    }
    to 
    {
        opacity: 1;
        transform: translateY(0); /* 제자리로 이동 */
    }
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
			<div id="event"> 한번 입원하면 3박이 무료! </div>
		<div id="xx" onclick="adx()">닫기</div>
		</div>
	</div>
</div>


<header>
		<div id="loginbar"> 
		 <c:if test="${sessionScope.user_id == null }">
		  <a href="/main/login"> 로그인 </a>| 
		  <a href="/main/user"> 회원 가입 </a>
		 </c:if>
		 <c:if test="${sessionScope.user_id != null }">
		   ${user_id}님 | 
           <a href="/login/logout"> 로그아웃 </a> | 문의하기
         </c:if>
		</div>
</header>
<hr>

	<nav>
	<span id="total" onmouseout="hideSub()">
	<span id="mainsub">
	<div id="mainmenu" onmouseover="viewSub()">
		<ul id="maincate">
			<li class="logo">
			 <a href="/main/index">

			  <img src="/static/client/main/병원 로고.png" width="100" valign="middle">

			 </a>
			</li>
			<li class="hov">병원 소개</li>
			<li class="hov"><a href="/main/info/part?part=">의료진 안내</a></li>
			<li class="hov">상담/예약</li>
			<li class="hov">프로그램 예약</li>
			<li class="hov">커뮤니티</li>
			<li class="hov">건강 정보</li>
		</ul>
	</div>
	
	<div id="submenus"  onmouseover="viewSub()">
		<ul class="submenu">
			
		</ul>
		
		<ul class="submenu">
			<li>병원 인삿말</li>
			<li>미션과 비전</li>
			<li>조직도</li>
			<li>오시는 길</li>
		</ul>
		
		<ul class="submenu">
			<li><a href="/main/info/part?part=정신과">정신과</a></li>
			<li><a href="/main/info/part?part=내분비과">내분비과</a></li>
		    <li><a href="/main/info/part?part=치과">치과</a></li>
		    <li><a href="/main/info/part?part=이비인후과">이비인후과</a></li>
		</ul>
		
		<ul class="submenu">
			<li>1:1문의</li>
			<li><a href="/main/reserve">온라인 진료 예약</a></li>
			<li><a href="/main/reserveView">예약 조회</a></li>
		</ul>
		<ul class="submenu">
			<li>프로그램 예약</li>
		</ul>
		<ul class="submenu">
				<li><a href="/main/notice_list">공지사항</a></li>
				<li><a href="../../inquiry/list">진료과별 질문</a></li>
				<li><a href="../../boardlist">진료 후기</a></li>
				<li>고객의 소리</li>
		</ul>
		<ul class="submenu">
			<li>건강정보</li>
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