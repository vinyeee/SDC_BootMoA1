<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 </title>
<style type="text/css">
#find_pwd{
	display: inline-block;
	text-align: center;
	background-color: green;
}

</style>
<body>
<div id="find_pwd">
	<h2>비밀번호 찾기</h2><hr>
	<form method="post" action="login">
		<input type="hidden" name="action" value="findpwd">
		<input placeholder="아이디를 입력하세요." name="id" required><br>
		<select name="question">
			<option value="none">==질문 선택==</option>
			<option value="1">어머니의 성함은?</option>
			<option value="2">아버지의 성함은?</option>
			<option value="3">나의 보물1호는?</option>
			<option value="4">기억에 남는 추억의 장소는?</option>
			<option value="5">기억에 남는 추억의 선물은?</option>
			<option value="6">인상 깊게 읽은 책 이름은?</option>
			<option value="7">다시 태어나면 되고 싶은 것은?</option>
			<option value="8">내가 좋아하는 책 이름은?</option>
		</select>
		<br>
		<input placeholder="답변을 입력하세요." name="answer" required><br>
		<input type="submit" class="button" value="전송">
	</form>
</div>

</body>
</html>
