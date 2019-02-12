<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
		fieldset {
			text-align : left;
			position : absolute;
			top : 50%;
			left : 50%;
			width : 700px;
			height : 310px;
		    transform : translate(-50%, -50%);
		}
		</style>
	</head>
	<body>
		<jsp:include page="../shop/main.jsp"/>
		<form method="POST"> 
			<fieldset>
			<legend><h2>사구팔구 회원가입</h2></legend>
				<h3 style="margin:0px 40px 20px">사구팔구에 오신 것을 환영합니다.</h3>
				<p  style="margin:0px 40px 0px">회원 가입하신 후 사구팔구의 서비스를 만나보세요.</p>
			<div style="display:;">
				<dl>
					<dd>
						<strong>[ 일반회원 ]</strong> 만 14세 이상의 내국인 
						<input class="btn" type="button" value="가입하기" onclick="location.href='member_join_input.do?jointype=일반'"> 
					</dd>
					<br>
					<dd>
						<strong>[ 사업자회원 ]</strong> 사업자등록증을 보유한 회원 
						<input class="btn" type="button" value="가입하기" onclick="location.href='member_join_input.do?jointype=사업자'">
					</dd>
					<dd>
						<p>※ 회원가입은 최소한의 정보만으로 가입이 가능합니다.</p>
					</dd>
				</dl>
			</div>
			</fieldset>
		</form>
	</body>
</html>