<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 </title>
<style type="text/css">
#login_main{
	display: inline-block;
	text-align: center;
}

</style>
<body>
<div id="login_main">
	<h2>로그인</h2><hr>
	<form method="post" action="login">
		<input type="hidden" name="action" value="login">  
		<input type="text" placeholder="아이디를 입력하세요" name="id" required><br> <!-- required 넣으면 필수입력 -->
		<input type="password" placeholder="패스워드를 입력하세요" name="pwd" required><br>
		<aside>
			<h4 style= color:red>${ msg }</h4>
		</aside> 
		<input type="submit" value="로그인">
		<a href="/camp/MemberFind.jsp">비밀번호 찾기</a>
	</form>
</div>
</body>
</html>
