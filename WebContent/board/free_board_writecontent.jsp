<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>글쓰기 페이지 ajax 파일</title>
	</head>
	<body>
		<fieldset>
			<legend><h2>글쓰기</h2></legend>
			<c:choose>
				<c:when test="${ sessionScope.memberID == '비회원' }">
					<form action="free_board_write_result.do" method="post">
						<dl>
							<dd>제 목  <input style="border:none; background-color: #e2e2e2;" type="text" name="fb_title" placeholder="제목을 입력해주세요"/></dd><br>
							<dd>작성자 <input style="border:none; background-color: #e2e2e2;" type="text" name="fb_writer" placeholder="작성자 필수입력"></dd><br>
							<dd><textarea style="border:none; background-color: #e2e2e2;" rows="20" cols="70" name="fb_content" placeholder="내용"></textarea></dd><br>
							<dd>비밀번호 <input style="border:none; background-color: #e2e2e2;" type="password" name="fb_pwd" placeholder="비밀번호 필수입력"></dd><br>
						</dl>
						
						<div id="ipt">
							<input class="pbtn" type="button" value="등록" onclick="reg(this.form)"/>
							<input class="pbtn" type="reset" value="리셋"/>
						</div>
					</form>
				</c:when>
				
				<c:otherwise>
					<form action="free_board_write.do" method="post">
						<dl>
							<dd>제 목  <input style="border:none; background-color: #e2e2e2;"  type="text" name="fb_title" placeholder="제목을 입력해주세요" style="width:400px"/></dd><br>
							<dd>작성자 <input style="border:none; background-color: #e2e2e2;" type="hidden" name="fb_writer" value="${ sessionScope.memberID }">${ sessionScope.memberID }</dd><br>
							<dd><textarea style="border:none; background-color: #e2e2e2;" rows="20" cols="70" name="fb_content" placeholder="내용"></textarea></dd>
							<dd>비밀번호 (회원님의 비밀번호로 자동저장됩니다)<input type="password" name="fb_pwd" value="${ sessionScope.memberpwd }" readonly></dd><br>
						</dl>
						
						<div id="ipt">
							<input class="pbtn" type="button" value="등록" onclick="reg(this.form)"/>
							<input class="pbtn" type="reset" value="리셋"/>
						</div>
					</form>
				</c:otherwise>
			</c:choose>
		</fieldset>
	</body>
</html>