<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="MemberLoginRegister.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta charset="UTF-8">

<title>로그인|회원가입</title>
<script>
$(function() {
	  tab = $('.tabs h3 a');
	  tab.on('click', function(event) {
	    event.preventDefault();
	    tab.removeClass('active');
	    $(this).addClass('active');
	    tab_content = $(this).attr('href');
	    $('div[id$="tab-content"]').removeClass('active');
	    $(tab_content).addClass('active');
	  });
	});

//SLIDESHOW
$(function() {
$('#slideshow > div:gt(0)').hide();
setInterval(function() {
  $('#slideshow > div:first')
  .fadeOut(1000)
  .next()
  .fadeIn(1000)
  .end()
  .appendTo('#slideshow');
}, 3850);
});

//CUSTOM JQUERY FUNCTION FOR SWAPPING CLASSES
(function($) {
'use strict';
$.fn.swapClass = function(remove, add) {
  this.removeClass(remove).addClass(add);
  return this;
};
}(jQuery));

//SHOW/HIDE PANEL ROUTINE (needs better methods)
$(function() {
$('.agree, .forgot, #toggle-terms, .log-in, .sign-up').on('click', function(event) {
  event.preventDefault();
  var user = $('.user'),terms = $('.terms'),form = $('.form-wrap'),recovery = $('.recovery'),close = $('#toggle-terms'),arrow = $('.tabs-content .fa');
  if ($(this).hasClass('agree') || $(this).hasClass('log-in') || ($(this).is('#toggle-terms')) && terms.hasClass('open')) {
    if (terms.hasClass('open')) {
      form.swapClass('open', 'closed');
      terms.swapClass('open', 'closed');
      close.swapClass('open', 'closed');
    } else {
      if ($(this).hasClass('log-in')) {
        return;
      }
      form.swapClass('closed', 'open');
      terms.swapClass('closed', 'open').scrollTop(0);
      close.swapClass('closed', 'open');
      user.addClass('overflow-hidden');
    }
  }
  else if ($(this).hasClass('forgot') || $(this).hasClass('sign-up') || $(this).is('#toggle-terms')) {
    if (recovery.hasClass('open')) {
      form.swapClass('open', 'closed');
      recovery.swapClass('open', 'closed');
      close.swapClass('open', 'closed');
    } else {
      if ($(this).hasClass('sign-up')) {
        return;
      }
      form.swapClass('closed', 'open');
      recovery.swapClass('closed', 'open');
      close.swapClass('closed', 'open');
      user.addClass('overflow-hidden');
    }
  }
});
});

//DISPLAY MSSG
$(function() {
$('.recovery .button').on('click', function(event) {
  event.preventDefault();
  $('.recovery .mssg').addClass('animate');
  setTimeout(function() {
    $('.form-wrap').swapClass('open', 'closed');
    $('.recovery').swapClass('open', 'closed');
    $('#toggle-terms').swapClass('open', 'closed');
    $('.tabs-content .fa').swapClass('active', 'inactive');
    $('.recovery .mssg').removeClass('animate');
  }, 2500);
});
});


</script>
</head>
<body>
	<!-- LOGIN MODULE -->
	<div class="login">
		<div class="wrap">

			<!-- LOGIN FORM -->
			<div class="user">

				<!-- LOGO -->
				<div class="logo">
					<!-- logo 대체 필요 -->
					<a href="#"><img
						src="/images/부트모아로고eng.png"
						width=100%
						height=100%
						alt=""></a>
				</div>
				<!-- TOGGLE -->
				<div id="toggle-wrap">
					<div id="toggle-terms">
						<div id="cross">
							<span></span> <span></span>
						</div>
					</div>
				</div>

				<!-- RECOVERY -->
				<div class="recovery">
					<h2>비밀번호 찾기</h2>
					<p>비밀번호를 찾고자 하는 아이디를 입력하세요</p>
					<form class="recovery-form" action="/member" method="post">
						<input type="text" class="input" id="user_recover"
							placeholder="이메일을 입력하세요"> <input type="submit"
							class="button" value="Submit">
					</form>
					<p class="mssg">비밀번호 재설정을 위한 이메일이 발송되었습니다</p>
				</div>

				<!-- FORM -->
				<div class="form-wrap">
					<!-- TABS -->
					<div class="tabs">
						<h3 class="login-tab">
							<a class="log-in active" href="#login-tab-content"><span>로그인</span></a>
						</h3>	
						<h3 class="signup-tab">
							<a class="sign-up" href="#signup-tab-content"><span>회원가입</span></a>
						</h3>
					</div>
					<!-- TABS CONTENT -->
					<div class="tabs-content">
						<!-- TABS CONTENT LOGIN -->
						<div id="login-tab-content" class="active">
							<form class="login-form" action="/member" method="post">
								<input type="text" class="input" id="user_login"
									autocomplete="off" placeholder="아이디를 입력하세요" required><br>
								<input type="password" class="input" id="user_pass"
									autocomplete="off" placeholder="비밀번호를 입력하세요" required><br>
								<input type="submit" class="button" value="로그인"><br>
							</form>
							<div class="help-action">
								<p>
									<i class="fa fa-arrow-left" aria-hidden="true"></i><a
										class="forgot" href="#">비밀번호 찾기</a>
							
								</p>
							</div>
						</div>
						<!-- 이후에 jsp 옮기고 위치 옮길 예정 -->
									<script type="text/javascript">
									function checkvalue(){
										var form = document.userInfo;
										
										if (form.id.value ==""){
											alert("아이디를 입력하세요");
											return false;
										}
										
										if(form.pwd.value ==""){
											alert("비밀번호를 입력하세요");
												return false;
										}
										
										if(form.name.value ==""){
											alert("이름을 입력하세요");
											return false;											
										}
										
										if(form.email.value ==""){
											alert("이메일을 입력하세요");
											return false;
										}	
										
										if(form.phone.value ==""){
											alert("전화번호를 입력하세요");
											return false;
										}
										
										if(form.nick.value ==""){
											alert("닉네임을 입력하세요");
											return false;
										}
										
										if(form.question.value ==""){
											alert("보안 질문을 입력하세요");
											return false;
										}
										
										if(form.answer.value ==""){
											alert("답변을 입력하세요");
											return false;
										}
										
										if(form.idDuplication.value != "idCheck"){
											alert("아이디 중복체크를 해주세요");
											return false;
										}
										
										if(form.nickDuplication.value != "nickCheck"){
											alert("닉네임 중복체크를 해주세요");
											return false;
										}	
										
									}
									
									function openIdCheck(){
										window.name = "parentForm";
										window.open("IdCheckForm.jsp","idchkForm","width=500,height=300");
									}	
									
									function opennickCheck(){
										window.name = "parentForm";
										window.open("NickCheckForm.jsp","nickchkForm","width=500,height=300");
									}
									</script>
						<!-- TABS CONTENT SIGNUP -->
						<div id="signup-tab-content">r
							<form class="signup-form" action="/member" method="post" name="userInfo">
							<input type="hidden" name="input" value="memberRegister"> 
								<input type="text" class="input" id = "id" name="id" autocomplete="off" placeholder="아이디를 입력하세요" style="width: 75%;" required> 
								<input type="button" value="중복확인" style="width: 130px ;height:50px; margin:0 0 0 0;" onclick="openIdCheck()">
								<input type="hidden" name="idDuplication" value="idUncheck">
								<input type="password" class="input" name="pwd" autocomplete="off"placeholder="패스워드를 입력하세요" required><br> 
								<input type="text" class="input" name="name" autocomplete="off" placeholder="이름을 입력하세요" required><br> 
								<input type="text" class="input" name="email" autocomplete="off" placeholder="이메일을 입력하세요(예시_myemail@naver.com)" required><br> 
								<input type="text" class="input" name="phone" autocomplete="off" placeholder="전화번호를 입력하세요('-'없이 입력해주세요)" maxlength ="11" required><br> 
								<input type="text" class="input" id = "nick" name="nick" autocomplete="off" style="width: 75%;"placeholder="닉네임을 입력하세요" required>
								<input type="button" value="중복확인" style="width: 130px;height:50px;  margin:0 0 0 0;" onclick="opennickCheck()">
								<input type="hidden" name="nickDuplication" value="nickUncheck">
								<select name="question" class="input">
								<option value="none">== 보안질문 1개 선택 ==</option>
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
								
								<input placeholder="답변을 입력하세요." class="input" name="answer" required><br>
								<input type="submit" class="button" onclick="checkvalue()" value="회원가입 완료하기">
									
							</form>
							<%	
								if (request.getAttribute("msg") != null) { 
								%>
								<script>
									alert('${ msg }');
								</script> 
								<% 
								} 
								%>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
