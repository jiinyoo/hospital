<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:800px;
		margin: 30px auto;
		min-height: 600px;
	}
	
	section table {
		width: 100%;
	}
	
	section h2 {
		margin-bottom: 20px;
	}
	
	#aa {
		margin-top:30px;
	}
	
	th {
		text-align: left;
		background: #ccc;
		
	}
	
	th,td {padding: 7px 16px;}
	
	#chkUser {
		width: 350px;
		background: white;
		position: fixed;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
		display: none; /* 처음에는 보이지 않게 설정 */
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 약간의 그림자 추가 */
		padding: 20px;
		border-radius: 10px; /* 모서리 둥글게 */
	}
	
	#chkUser input {
		height: 30px;
		width:20%;
	}
	
	#pastSearch {
		display:flex;
		justify-content: space-between;
		margin:20px 0 5px 0;
		align-items: center;
	}
	
	#pastSearch a {
		text-decoration: none;
		color: black;
	}
	
	#pastSearch a:hover {
		color: #0073e6;
	}
	
	#pastSearch input[type="date"] {
		height: 30px;
		width: 150px;
		font-family: 'goorm-sans-bold';
	}
	
	#pastSearch input[type="submit"] {
		border: none;
		background: #0073e6;
		color:white;
		font-family: 'goorm-sans-bold';
		font-size: 15px;
		padding:3px 20px;
		line-height: 20px;
		margin-left: 5px;
	}
	
	#pastSearch input[type="submit"]:hover {
		background:#8BBCFF;
	}
</style>
<script>
	function chkUser(resid,userid) {
		document.getElementById("res_id").value = resid;
		document.getElementById("user_id").value=userid;
		document.getElementById("chkUser").style.display = "block";
	}
	
	function onlyNum(my,next,maxlength) {
		my.value=my.value.replace(/[^0-9]/g,"");
		
		if(my.value.length==maxlength) {
			document.getElementById(next).focus();
		}
	}
	
	window.onload=function() {
	    var start="${param.start}";
	    var end="${param.end}";
	    var month="${param.month}";

	    var today=new Date();
	    var y=today.getFullYear();
	    var m=today.getMonth()+1;
	    var d=String(today.getDate()).padStart(2,"0");

	    if(month) {
	        month=parseInt(month);
	        m=m-month;
	        if(m<=0) {
	            m=12+m;
	            y=y-1;
	        }
	    }

	    m=String(m).padStart(2,"0");

	    var startDate=y+"-"+m+"-"+d;
	    var endDate=today.getFullYear()+"-"+String(today.getMonth()+1).padStart(2,"0")+"-"+d;

	    if(!start) {
	        document.getElementById("start").value=startDate;
	    } else {
	        document.getElementById("start").value=start;
	    }

	    if(!end) {
	        document.getElementById("end").value=endDate;
	    } else {
	        document.getElementById("end").value=end;
	    }
	}

	function confirmChk(resid) {
		if(confirm("정말로 예약을 취소하시겠습니까?")) {
			location="/main/cancelRes?res_id="+resid;
		}
	}
	
	function chkDate(date) {
	    var start = document.getElementById("start").value;
	    var end = document.getElementById("end").value;

	    // 날짜 유효성 확인
	    if (start === "" || end === "") {
	        alert("날짜를 선택해주세요.");
	        return;
	    }

	    // 날짜 객체로 변환
	    var startDate = new Date(start);
	    var endDate = new Date(end);

	    // 날짜 객체 유효성 확인
	    if (isNaN(startDate) || isNaN(endDate)) {
	        alert("유효한 날짜를 입력해주세요.");
	        return;
	    }

	    // 날짜 비교 후 기간 확인
	    if ((endDate - startDate) < 0) {
	        alert("종료일이 시작일보다 빠릅니다. 기간을 확인해주세요.");
	        date.value = "";
	    }
	}

	
	function chk() {
		var phone1=document.getElementById("phone1").value;
		var phone2=document.getElementById("phone2").value;
		var phone3=document.getElementById("phone3").value;
		
		if (phone1.length!==3 || phone2.length!==4 || phone3.length!==4) {
	        alert("유효한 연락처를 입력해주세요.");
	        return false;
	    }			
		
		if(true) {
	    	document.getElementsByName("user_phone")[0].value=phone1+"-"+phone2+"-"+phone3;
	    	document.getElementsByName("user_jumin")[0].value=jumin1+"-"+jumin2;
	    	
	    	return true;
	    }
	}
</script>
</head>
<body>
	<section>
		<h2>진료 예정</h2>
		<table>
			<tr>
				<th>예약번호</th>
				<th>진찰과</th>
				<th>의사명</th>
				<th>예약일</th>
				<th>비고</th>
			</tr>
			<c:if test="${empty rdto }">
			<tr>
				<td colspan="5" align="center"> 예약정보가 없습니다. </td>
			</tr>
			</c:if>
			<c:forEach var="res" items="${rdto }" varStatus="sts">
			<tr>
				<td>${res.res_code}</td>
				<td>${res.doc_part }</td>
				<td>${doc[sts.index]}</td>
				<td>${res.res_date } ${res.res_time } </td>
				<td>
					진료 예정
					<c:if test="${!empty sessionScope.user_id}">
					<input type="button" value="예약 취소" onclick="confirmChk('${res.res_id}')">
					</c:if>
					<c:if test="${empty sessionScope.user_id}">
					
					<input type="button" value="예약 취소" onclick="chkUser('${res.res_id}','${res.user_id}')">
					</c:if>
				</td>
			</tr>
			</c:forEach>		
		</table>
		
		<c:if test="${!empty sessionScope.user_id}">
		<h2 id="aa">지난 예약</h2>
		<form method="get" action="reserveView" id="pastSearch">
		<div>
			<a href="?month=1" ${param.month==1?'style="color:red;"':''}>1달이내</a>
			<a href="?month=3" ${param.month==3?'style="color:red;"':''}>3달이내</a>
			<a href="?month=6" ${param.month==6?'style="color:red;"':''}>6달이내</a>
			<a href="?month=0" ${param.month==0?'style="color:red;"':''}>전체보기</a>
		</div>
		<div>
			<input type="date" name="start" id="start" onchange="chkDate(this)">~
			<input type="date" name="end" id="end" onchange="chkDate(this)">
			<input type="submit" value="조회하기">
		</div>
		</form>
		<table>
			<tr>
				<th>예약번호</th>
				<th>진찰과</th>
				<th>의사명</th>
				<th>예약일</th>
				<th>비고</th>
			</tr>
			<c:if test="${empty past }">
			<tr>
				<td colspan="5" align="center"> 예약정보가 없습니다. </td>
			</tr>
			</c:if>
			<c:forEach var="past" items="${past }" varStatus="sts">
			<tr>
				<td>${past.res_code}</td>
				<td>${past.doc_part }</td>
				<td>${pastDoc[sts.index]}</td>
				<td>${past.res_date } ${past.res_time } </td>
				<td> 
				<c:if test="${past.state==1}">
				진료 완료
				</c:if>
				<c:if test="${past.state!=1}">
				예약 취소
				</c:if>
				</td>
			</tr>
			</c:forEach>		
		</table>
		</c:if>
	</section>
	<div id="chkUser">
		<form method="post" action="cancelRes" onsubmit="return chk()">
		<div>예약 취소에 필요한 </div>
		<div>휴대폰 번호를 입력해주세요</div>
		<input type="hidden" name="res_id" id="res_id">
		<input type="hidden" name="user_phone">
		<input type="hidden" name="user_id" id="user_id">
		<div id="phone-container">
			<input type="text" id="phone1" placeholder="연락처" maxlength="3" oninput="onlyNum(this,'phone2',3)">
			<span>-</span>
			<input type="text" id="phone2" maxlength="4" oninput="onlyNum(this,'phone3',4)">
			<span>-</span>
			<input type="text" id="phone3" maxlength="4" oninput="onlyNum(this,null,null)">
			<input type="submit" value="예약 취소">
		</div>
		</form>
	</div>
</body>
</html>