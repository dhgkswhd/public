<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>LOGIN</title>
		
		<style>
		fieldset {
			text-align : center;
			position : absolute;
			top : 50%;
			left : 50%;
			width : 400px;
			height : 200px;
		    transform : translate(-50%, -50%);
		}
		</style>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
		function login ( f ) {
			var membertype = null; // 회원유형 체크된 값 저장할 변수
			var type = document.getElementsByName("membertype"); // 회원유형 체크된 값 가져올때 사용
			var  id = f.id.value;
			var pwd = f.pwd.value;
			
			if (id == '' && pwd == '') {
				alert("아이디와 패스워드를 입력해주세요");
				return;
			}
			
			for (var i = 0; i < type.length; i++) {
				if ( type[i].checked ) {
					membertype = type[i].value;
				}	
			}
			
			var url = "member_login_output.do"; 
			var id = f.id.value;
			var pwd = f.pwd.value;
			var param = "id=" + id + "&pwd=" + pwd + "&membertype=" + membertype;
			
			sendRequest( url, param, data_check, "POST" );
		}
		
		function data_check() {
			console.log( xhr.readyState + " / " + xhr.status );
			
			if ( xhr.readyState == 4 && xhr.status == 200 ) {
				var data = xhr.responseText;
				var json = eval( data );
				
				if ( json[0].msg == 'yes' ) {
					location.href = "product_list_input.do";
					alert("[" + json[1].type + "회원] " + 
							json[2].id + "님 안녕하세요");
				}
				else if ( json[0].msg == 'master' ) {
					location.href = "product_list_input.do"
					alert("[" + json[1].type + "] 로그인");
					
				}
				else {
					alert("회원정보가 일치하지 않습니다");
				}
			}
		}
		</script>
	</head>
	
	<body>
		<jsp:include page="../shop/main.jsp"/>
		
		<form method="POST"> 
			<fieldset>
			<legend><h3>로그인 정보 입력</h3></legend>
			<div style="display:;">
				<label for="membertype"><input title="일반회원" name="membertype" type="radio" value="일반" checked>일반회원</label>
				<label for="membertype"><input title="사업자회원" name="membertype" type="radio" value="사업자" >사업자회원</label>
				<dl>
					<dd><label for="id">아이디 </label><input style="border:none; background-color: #e2e2e2;" name="id" id="id" type="text" maxlength="60" title="아이디 입력" placeholder="사구팔구 아이디"></dd>
					<dd><label for="pwd">비밀번호 </label><input style="border:none; background-color: #e2e2e2;" name="pwd" id="pwd" type="password" title="비밀번호는 8자 이상 ~ 20자 이하" placeholder="비밀번호는 8자 이상 ~ 20자 이하"></dd>
				</dl>
				<div>
					<input class="btn" type="button" value="로그인" onclick="login(this.form)">
					<input class="btn" type="button" value="아이디찾기" onclick="checkuser(this.form)">
					<input class="btn" type="button" value="비밀번호찾기" onclick="location.href='member_search_pwd_input.do'">
				</div>
			</div>
			</fieldset>
		</form>
	</body>
</html>


