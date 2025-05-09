<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
   
    
    section 
  	{
 	    width: 100%;
 	    max-width: 800px;
    	margin: 50px auto;
        padding: 30px 50px;
    	background-color: #ffffff;
    	border-radius: 5px;
    	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
  	}

    /* 제목 스타일 */
    h3 {
        text-align: left;
        color: #004fa8;
        margin-bottom: 20px;
        margin-left:10px;
        font-size:30px;
        font-weight: normal;
    }
    
    h4 {
    	text-align: left;
        color: #004fa8;
        font-size:30px;
        margin-top: 10px;
        margin-bottom: 20px;
        margin-left:10px;
        font-weight: normal;
    }
    
    /* 입력 필드 스타일 */
    input[type="text"]
    {
    	font-family: 'GongGothicMedium';
        width: 99%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        outline: none;
    }
    
    input[type="file"]
    {
    	font-family: 'GongGothicMedium';
        
    }
    
    textarea
    {
    	font-family: 'GongGothicMedium';
    	width: 99%;
    	height:200px;
    	margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        outline: none;
    }

    /* 버튼 스타일 */
    input[type="button"] 
    {
    	font-family: 'GongGothicMedium';
        width: 20px;
        height: 20px;
        margin-top: 10px;
        margin-bottom: 15px;
        margin-left: 7px;
        background-color: #004fa8;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    input[type="submit"],
    #btn
    {
    	font-family: 'GongGothicMedium';
    	width: 100px;
    	height:40px;
        padding: 10px;
        margin-top: 30px;
        margin-bottom: 10px;
        background-color: #004fa8;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    input[type="button"]:hover,
    input[type="submit"]:hover,
    #btn:hover {
        background-color: #033D7F;
    }

    /* 이미지 미리보기 스타일 */
    .img img {
        margin-top: 10px;
        max-width: 130px;
        max-height: 130px;
        border-radius: 5px;
        border: 1px solid #ddd;
    }

    /* 사진 등록 부분 스타일 */
    .one {
        align-items: center;
        margin-bottom: 10px;
    }

    .one label {
        margin-right: 10px;
    }
    
    textarea {
    	resize:none;
    	padding:9px;
    }

</style>
<script>
	function add()
	{
	  var len=document.getElementsByClassName("file").length;
	  
	  if(len<10)
	  {
		  var one=document.getElementById("one");
		  var inner=one.cloneNode(true);
		  var outer=document.getElementById("outer"); 
		  outer.appendChild(inner);
		  document.getElementsByClassName("file")[len].name="fname"+len;
		  document.getElementsByClassName("file")[len].value="";
		  document.getElementsByClassName("img")[len].innerHTML="";
		  document.getElementsByClassName("label")[len].setAttribute("for","fileUp"+len);
		  document.getElementsByClassName("file")[len].id="fileUp"+len; 
	  }	  
	  
	}
	
	function del()
	{
	  var len=document.getElementsByClassName("file").length;
	  if(len>1)
	  {	  
	      document.getElementsByClassName("one")[len-1].remove();
	  }
	}
	
	function previewImage(event) 
	{
		  var input=event.target; // 파일 입력 요소
		  var reader=new FileReader();

		  reader.onload = function() 
		  {
			  var imgElement=input.nextElementSibling; // .img 요소 (span)
			  imgElement.innerHTML="<img src='"+reader.result+" 'alt='이미지 미리보기' width='100px' height='100px'>";
		  }

		  if(input.files && input.files[0]) 
		  {
			  reader.readAsDataURL(input.files[0]); // 파일을 읽어서 Data URL로 변환
		  }
		  
	}
	
	function check()
	  {
		  var delimg="";  // 삭제할 이미지
		  var safeimg=""; // 삭제하지 않는 이미지
		  var imgList=document.getElementsByClassName("imgList");
		  
		  for(i=0;i<imgList.length;i++)
		  {
			  if(imgList[i].checked)
			  {
				  delimg=delimg+imgList[i].value+"/";
			  }	  
			  else
			  {
				  safeimg=safeimg+imgList[i].value+"/";
			  }	  
		  }
	  
		  // alert(delimg+"\n"+safeimg);
		  
		  // delimg, safeimg를 서버에 전송
		  document.uform.delimg.value=delimg;
		  document.uform.safeimg.value=safeimg;
		 
		  
		  return true;
	  }
</script>
</head>
<body>
 <section>
   <form name="uform" method="post" action="admin_notice_updateOk" enctype="multipart/form-data" onsubmit="return check()">
   <input type="hidden" name="notice_id" value="${ndto.notice_id}">
   <input type="hidden" name="delimg" >  
   <input type="hidden" name="safeimg" >
     <caption> <h3> 공지사항 글 수정 </h3></caption>
     
     <div> 
     	<input type="text" name="title" value="${ndto.title}" placeholder="제 목">
     </div>
     	
     <div> 
     	<textarea name="content" placeholder="내 용">${ndto.content}</textarea>
     </div>
     
     <div> 
       <h4> 사진 등록 
       		<span>
       			<input type="button" value="+" onclick="add()"> 
     			<input type="button" value="-" onclick="del()">
     		</span>
		</h4>
       <hr>
       <br>
       <div>
      	 <c:forEach items="${imgs}" var="img">
      	 <c:if test="${img!=''}">
         	<img src="/static/client/notice/${img}" style="max-width: 20%; height: auto;">
         	<input type="checkbox" value="${img}" class="imgList">
         </c:if>
    	 </c:forEach>
       </div>
       <br>
       <hr>
       <br>
    	<div  id="outer">
     	<div id="one" class="one">
           <label for="fileUp0" class="label"> </label>
           <input type="file" id="fileUp0" name="fname0" class="file" onchange="previewImage(event)"> 
        
           <span class="img"> 
           </span>
       </div>
       </div>
     </div>
     <div style="text-align: center;"> 
     	<input type="submit" value="공지사항 수정">
     	<input id="btn" type="button" onclick="location='admin_notice_content'" value="수정 취소"> 
     </div>
   </form>
 </section>

</body>
</html>