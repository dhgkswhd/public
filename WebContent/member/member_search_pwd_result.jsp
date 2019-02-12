<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기 결과</title>
		<style>
		fieldset {
			text-align : center;
			position : absolute;
			top : 45%;
			left : 50%;
			width : 440px;
			height : 250px;
			overflow : hidden;
		    transform : translate(-50%, -50%);
		}
		</style>
	</head>
	<body>
		<jsp:include page="../shop/main.jsp"/>
		<c:choose>
		<c:when test="${ resultPwd ne null }">
			<fieldset>
				<legend><h2>비밀번호찾기 결과</h2></legend>
				<p style="margin:0">회원님의 비밀번호는<h3>${ resultPwd }</h3>입니다.</p>
				<input class="btn" type="button" value="로그인" onclick="location.href='member_login_input.do'">
			</fieldset>
		</c:when>
		
		<c:otherwise>
			<fieldset>
				<legend><h2>비밀번호찾기 결과</h2></legend>
				<dl>
					<dd><p style="margin:10px 0px 10px">회원님의 비밀번호를 찾을 수 없습니다.</p></dd>
					<dd><p style="margin:10px 0px 10px">회원정보를 정확히 입력해주세요</p></dd>
					<dd><input class="btn" type="button" value="이전" onclick='javascript:history.go(-1)'></dd>
				</dl>
			</fieldset>
		</c:otherwise>
		</c:choose>	
	</body>
</html>