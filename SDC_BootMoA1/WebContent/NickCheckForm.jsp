<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복확인</title>
<script type="text/javascript">

function pValue(){
	document.getElementById("nickname").value = opener.document.getElementById("nick").value;
	var nn = document.getElementById("nickname").value;
	if(!nn){
		alert("닉네임을 입력하지 않았습니다.");
	}
}


// 사용하기 클릭 시 부모창으로 값 전달 
function sendCheckValue(){
    // 중복체크 결과인 nickCheck 값을 전달한다.
    opener.document.userInfo.nickDuplication.value ="nickCheck";
    // 회원가입 화면의 닉네임 입력란에 값을 전달
    if(opener.document.userInfo.nick.value != null){
    	opener.document.userInfo.nick.value = document.getElementById("nickname").value;
    }else if(opener.document.userInfo.mnname.value != null){
    	opener.document.userInfo.mnname.value = document.getElementById("nickname").value;
    }
    
    if (opener != null) {
        opener.nickchkForm = null;
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
	<b><font size="5" color = "gray">✓ 닉네임 중복체크 ✓</font></b>
	<hr size="1" width="460">
	<br>
	<div id = "chk">
	<form action="member" method="get">
		<input type="hidden" name="input" value="nickform"> 
		<input type="text" name = 'nickval' id="nickname" size ="40">
		<input type="submit" value="중복확인" >
	<%
	if (request.getAttribute("confirmnick") != null) {
%>
	<script>
		alert('${ confirmnick }');
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