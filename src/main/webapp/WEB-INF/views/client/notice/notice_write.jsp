<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    
    section 
  	{
 	    width: 80%;
 	    max-width: 800px;
    	margin: 50px auto;
    	padding: 60px;
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
    }
    
    h4 {
    	text-align: left;
        color: #004fa8;
        font-size:30px;
        margin-top: 10px;
        margin-bottom: 20px;
        margin-left:10px;
    }
    
    div 
  	{
    	margin: auto;
 	}

    /* 입력 필드 스타일 */
    input[type="text"]
    {
    	font-family: 'goorm-sans-bold', sans-serif;
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
    	font-family: 'goorm-sans-bold', sans-serif;
        
    }
    
    textarea
    {
    	font-family: 'goorm-sans-bold', sans-serif;
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
    	font-family: 'goorm-sans-bold', sans-serif;
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
    
    input[type="submit"]
    {
    	font-family: 'goorm-sans-bold', sans-serif;
    	width: 100px;
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
    input[type="submit"]:hover {
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
		  var input=event.target;
		  var reader=new FileReader();

		  reader.onload = function() 
		  {
			  var imgElement=input.nextElementSibling;
			  imgElement.innerHTML="<img src='"+reader.result+" 'alt='이미지 미리보기'>";
		  }

		  if(input.files && input.files[0]) 
		  {
			  reader.readAsDataURL(input.files[0]);
		  }
		  
	}
	
	function validateForm() {
        var title = document.getElementsByName("title")[0].value;
        var content = document.getElementsByName("content")[0].value;
        
        if (title.trim() === "") {
            alert("제목을 입력해주세요.");
            return false;
        }
        
        if (content.trim() === "") {
            alert("내용을 입력해주세요.");
            return false;
        }

        return true;
    }
	
</script>
</head>
<body>
 <section>
   <form method="post" action="notice_writeOk" enctype="multipart/form-data"onsubmit="return validateForm();">
     <caption> <h3> 공지 글쓰기 </h3> </caption>
     <div> 
     	<input type="text" name="title" placeholder="제 목"> 
     </div>
     <div> 
     	<textarea name="content" placeholder="내 용"></textarea>
     </div>
     <div id="outer"> 
       <h4> 사진 등록 
       		<span>
       			<input type="button" value="+" onclick="add()"> 
     			<input type="button" value="-" onclick="del()">
     		</span>
		</h4>
     	<div id="one" class="one">
           <label for="fileUp0" class="label"> </label>
           <input type="file" id="fileUp0" name="fname0" class="file" onchange="previewImage(event)"> 
           <span class="img"></span>
       </div>
     </div>
     <div style="text-align: center;"> <input type="submit" value="공지 등록"> </div>
   </form>
 </section>

</body>
</html>