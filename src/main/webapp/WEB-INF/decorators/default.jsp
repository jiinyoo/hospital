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
}
* {margin:0; padding:0; box-sizing: border-box;}

#ads{
	position:relative;
	width:100%;
	height:150px;
	background:#DAD9FF;
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
    width: 1300px;
    text-align:right;
    top: 130px;
    color: white;
    cursor:pointer;
}


#loginbar{
	
	margin:auto;
	width:1300px;
	height:50px;
	text-align:right;
	align-items:center;

}

nav{
 position :relative;
 width:1300px;
 height:80px;
 background:pink;
 margin:auto;
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
	height:80px;
	line-height:80px;
	margin: 0; /* 기본 마진 제거 */
	padding: 0; /* 기본 패딩 제거 */
	position:relative;
}


#submenus {
	display:flex;
	flex-wrap:wrap;
	visibility:hidden;
	text-align:center;

}



#submenus .submenu
{
	display:flex;
	flex-direction:column;
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
}

#submenus .submenu > li:first-child

{
	border-top:5px solid #00cccc;

}

#submenus .submenu > li:last-child

{
	border-bottom:5px solid #00cccc;

}





#submenus .submenu:last-child > li
{

	width:200px;
	
}

.haha {
  margin-bottom:40px;
 }

</style>
<script>
	

	function viewSub()
	{
		var submenus=document.getElementsByClassName("submenu");
		for(submenu of submenus)
			{
				submenu.style.visibility="visible";
			}
		
	}
	
	
	function hideSub()
	{
		//div영역을 생성하고 해야하나?
		var submenus=document.getElementsByClassName("submenu");
		for(submenu of submenus)
			{
				submenu.style.visibility="hidden";
			}
		
	}

	function adx(){
		
		var h=0;
		function move(){
			if(h<=150)
				document.getElementById("ad").style.marginTop=-h+"px";
			h++;
			setTimeout(move,5);
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
		   ${user_name}님 | 
           <a href="/login/logout"> 로그아웃 </a> | 
         </c:if>
		</div>
</header>
<hr>

	<nav>
	<span id="total" onmouseout="hideSub()">
	<span id="mainsub">
	<div id="mainmenu"  onmouseover="viewSub()">
		<ul id="maincate">
			<li>
			 <a href="/main/index">
			  <img src="../static/client/main/병원 로고.jpg" width="50">
			 </a>
			</li>
			<li>병원 소개</li>
			<li>의료진 안내</li>
			<li>상담/예약</li>
			<li>프로그램 예약</li>
			<li>커뮤니티</li>
			<li>건강 용품 샵</li>
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
				<li><a href="../../boardwrite">진료 후기</a></li>
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