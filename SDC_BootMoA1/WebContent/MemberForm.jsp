<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
*{
	margin:0;
	padding:0;
}
body{
	font-size:12px;
}


.info_box{
	display:flex;
	flex-direction:columns;
	justify-content: center;
	width: 400px;
	min-height: 600px;
	align-items: center;

	
}
::placeholder {
  text-align: center;
  font-style: italic;
}
</style>
</head>
<body>
<div class='info_box'>
	<form method=post action=/member>
	<input type=text name=id placeholder="아이디"><br>
	<input type=text name=pwd placeholder="비밀번호"><br>
	<input type=text name=name placeholder="이름"><br>
	<input type=text name=nname placeholder="닉네임"><br>
	<input type=email name=email  placeholder="이메일 주소" ><br>
	<input type=tel name=pnum  placeholder="휴대폰 번호(000-000-0000)" ><br><br>
	
	<input type=submit value="회원가입 완료하기">
	</form>	
</div>
</body>
</html>
