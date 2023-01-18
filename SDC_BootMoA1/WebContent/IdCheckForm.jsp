<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<script type="text/javascript">

function pValue(){
	document.getElementById("userId").value = opener.document.getElementById("id").value;
	var id = document.getElementById("userId").value;
	if(!id){
		alert("아이디를 입력하지 않았습니다.");
	}
}


// 사용하기 클릭 시 부모창으로 값 전달 
function sendCheckValue(){
    // 중복체크 결과인 idCheck 값을 전달한다.
    opener.document.userInfo.idDuplication.value ="idCheck";

    // 회원가입 화면의 ID입력란에 값을 전달
    if(opener.document.userInfo.id.value != null){
    	opener.document.userInfo.id.value = document.getElementById("userId").value;
    }else if(opener.document.userInfo.mid.value != null){
    	opener.document.userInfo.mid.value = document.getElementById("userId").value;
    }
    
    if (opener != null) {
        opener.idchkForm = null;
        self.close();
    }
} 


</script>

<style>
 #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        

button + button {
	margin-left: 10px;
}

input[type=text]{
	font-size: 16px;
}

input[type=button]{
	font-size: 16px;
	width:quto;
	background-color: #666;
	color: #fff;
}

</style>

</head>
<body onload="pValue()">
<div id = "wrap">
	<br>
	<b><font size="5" color = "gray">✓ 아이디 중복체크 ✓</font></b>
	<hr size="1" width="460">
	<br>
	<div id = "chk">
	<form action="member" method="get">
		<input type="hidden" name="input" value="idform"> 
		<input type="text" name = "idval" id="userId" size ="40">
		<input type="submit" value="중복확인" >
	<%
	if (request.getAttribute("confirmid") != null) {
%>
	<script>
		alert('${ confirmid }');
		<% } %>
	</script>
	<div id ="msg"></div>
	<br>
	<input id="cancelBtn" type="button" value="취소" onclick="window.close()">
	<input id = "useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
	
	</form>
	
	</div>
	
</div>

</body>
</html>