<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사구팔구 회원가입</title>
	<style>
	fieldset {
			text-align : left;
			position : absolute;
			top : 60%;
			left : 50%;
			width : 400px;
			height : 530px;
		    transform : translate(-50%, -50%);
	}
	</style>
	
	<!-- 아이디 유효성검사할 js파일 -->
	<script src="js/joinCheck.js?var=<%=System.currentTimeMillis()%>"></script>
	<script src="js/httpRequest.js"></script>
	
	<script>
		// 아이디 중복체크
		function checkId ( id ) {
			var url = "member/member_join_checkid.jsp";
			var param = "id=" + id;
			
			sendRequest( url, param, result_check, "POST" );
		}
		
		// 콜백함수
		function result_check() {
			console.log( xhr.readyState + " / " + xhr.status );
			
			if ( xhr.readyState == 4 && xhr.status == 200 ) {
				var data = xhr.responseText;
				document.getElementById("checkid").innerHTML = data;
			}
		}
		</script>
</head>

<body>
	<jsp:include page="../shop/main.jsp"/>
	
	<!-- 회원가입 유형에 따라 폼이 다름-->	
	<c:choose>
	<c:when test="${ jointype == '일반' }">
	<form action="member_join_output.do" method="POST">
		<!-- 회원가입 유형 저장 -->
		<input type="hidden" name="membertype" value="일반">
		
		<fieldset>
			<legend><h2>회원가입 > 일반회원 (셀러)</h2></legend>
				<p style="margin:0px 40px 0px"><strong>* 모든 정보를 빠짐없이 입력해주세요</strong></p>
				
			<div style="display:;">
				<dl>
					<dd>아이디 (영 대,소문자,숫자 4 ~ 12자)</dd>
					<dd>
						<input style="border:none; background-color: #e2e2e2;" type="text" name="id" onblur="checkId(this.value)">
						<!-- 아이디 중복체크 결과 뿌려줄 영역 -->
						<div id="checkid"></div>
					</dd>
					
					<dd>비밀번호 (영문, 숫자 혼합 8 ~ 20자)</dd>
					<dd>
						<input style="border:none; background-color: #e2e2e2;" type="password" name="pwd">
					</dd>
					
					<dd>비밀번호 확인</dd>
					<dd>
						<input style="border:none; background-color: #e2e2e2;" type="password" name="pwd_check">
					</dd>
					
					<dd>연락처 ('-' 빼고 입력)</dd>
					<dd>	
						<input style="border:none; background-color: #e2e2e2;" type="text" name="phone_number">
					</dd>
					
					<br>
					<dd>
						<input class="btn" type="button" value="회원가입" onclick="join(this.form)">
						<input class="btn" type="reset" value="초기화">
						<input class="btn" type="button" value="이전으로" onclick='javascript:history.go(-1)'>
					</dd>
				</dl>
			</div>
		</fieldset>
	</form>
	</c:when>
	
	<c:when test="${ jointype == '사업자' }">
		<form action="member_join_output.do" method="POST">
		<input type="hidden" name="membertype" value="사업자">
		<fieldset>
			<legend><h2>회원가입 > 사업자회원 (바이어)</h2></legend>
				<p style="margin:0px 40px 0px"><strong>* 모든 정보를 빠짐없이 입력해주세요</strong></p>
				
			<div style="display:;">
				<dl>
					<dd>아이디 (영 대,소문자,숫자 4 ~ 12자)</dd>
					<dd>
						<input style="border:none; background-color: #e2e2e2;" type="text" name="id" onblur="checkId(this.value)">
						<!-- 아이디 중복체크 결과 뿌려줄 영역 -->
						<div id="checkid"></div>
					</dd>
					
					<dd>비밀번호 (영문, 숫자 혼합 8 ~ 20자)</dd>
					<dd>
						<input style="border:none; background-color: #e2e2e2;" type="password" name="pwd">
					</dd>
					
					<dd>비밀번호 확인</dd>
					<dd>
						<input style="border:none; background-color: #e2e2e2;" type="password" name="pwd_check">
					</dd>
					
					<dd>연락처 ('-' 빼고 입력)</dd>
					<dd>	
						<input style="border:none; background-color: #e2e2e2;" type="text" name="phone_number">
					</dd>
					
					<dd>사업자등록번호</dd>
					<dd>	
						<input style="border:none; background-color: #e2e2e2;" name="b_number" type="text">
					</dd>
					
					<dd>상호명</dd>
					<dd>	
						<input style="border:none; background-color: #e2e2e2;" name="b_mutualname" type="text">
					</dd>
					
					<br>	
					<dd>
						<input class="btn" type="button" value="회원가입" onclick="join(this.form)">
						<input class="btn" type="reset" value="초기화">
						<input class="btn" type="button" value="이전으로" onclick='javascript:history.go(-1)'>
					</dd>
				</dl>
			</div>
		</fieldset>
		</form>
	</c:when>
	</c:choose>
</body>
</html>