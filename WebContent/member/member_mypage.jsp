<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사구팔구 - 마이페이지</title>
		<link rel="stylesheet" type="text/css" href="css/css_main.css?var=<%=System.currentTimeMillis()%>">
		<style>
		fieldset {
			text-align : center;
			position : absolute;
			top : 50%;
			left : 50%;
			width : 500px;
			height : 200px;
		    transform : translate(-50%, -50%);
		}
		
		fieldset li {
			text-align : left;
		}
		</style>
		
		<script>
		function check ( f ) {
			var   inputPwd = f.pwd.value; 					// 입력한 비밀번호
			var sessionPwd = '${ sessionScope.memberPwd }'; // 세션에 저장되어있는 회원 비밀번호
			
			if ( inputPwd != sessionPwd ) {
				alert("비밀번호가 일치하지 않습니다");
				return;
			} else {
				location.href = "member_mypage_menu.do";
			}
			
		}
		</script>
	</head>
	<body>
	<jsp:include page="../shop/main.jsp"/>
		
		<form method="POST"> 
			<fieldset>
			<legend><h3>회원정보 입력</h3></legend>
			회원님의 정보를 보호하기 위해 비밀번호를 다시 한번 확인 합니다.<br>
			<div style="display:;">
				<ul>
					<li>
						<label for="id">아 이 디  </label>
						<strong><input class="f" name="id" id="id" type="hidden"> ${ sessionScope.memberId }</strong>
					</li>
					<li>
						<label for="pwd">비밀번호 </label>
						<input style="border:none; background-color: #e2e2e2;" name="p_name" class="f" name="pwd" id="pwd" type="password" placeholder="8자 이상 ~ 20자 이하">
					</li>
				</ul>
				<div>
					<input style="font-family: Noto Sans KR;" class="btn" type="button" value="회원정보확인" onclick="check(this.form)">
				</div>
			</div>
			</fieldset>
		</form>
	</body>
</html>