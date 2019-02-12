<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!------------------------- 게시글 작성 페이지 ------------------------->
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글작성</title>
		<style>
		fieldset {
			text-align : left;
			position : absolute;
			top : 60%;
			left : 50%;
			width : 730px;
			height : 600px;
			overflow : hidden;
		    transform : translate(-50%, -50%);
		}
		
		#ipt {
			text-align : center;
		}
		</style>
		<script>
		function reg ( f ) {
			var  sessionId = String("${ sessionScope.memberID }"); // 세션에 저장되어있는 아이디 (비회원일경우 '비회원')
			var  fb_writer = f.fb_writer.value.trim();
			var   fb_title = f.fb_title.value.trim();
			var    fb_pwd  = f.fb_pwd.value.trim();
			
			if ( sessionId == "비회원" ) {
				
				if ( fb_writer == "" ) {
					alert("작성자를 입력하세요!");
					f.fb_writer.focus();
					return;
				}
				
				if( fb_title == "") {
					alert("제목을 입력하세요!");
					f.fb_title.focus();
					return;
				}
				
				if ( fb_pwd == "" ) {
					alert("비밀번호를 입력하세요!");
					f.fb_pwd.focus();
					return;
				}
			}
			
			else {
				if( fb_title == "" ) {
					alert("제목을 입력하세요!");
					f.fb_title.focus();
					return;
				}
			}
			
			alert("게시물이 등록되었습니다.");
			f.submit();
		}
		</script>
	</head>
	
	<body>
		<jsp:include page="../shop/main.jsp"/>
		
		<fieldset>
			<legend><h2>게시글작성</h2></legend>
			<c:choose>
			
				<c:when test="${ sessionScope.memberID == '비회원' }">
					<form action="free_board_write_result.do" method="post">
						<dl>
							<dd>제 목  <input style="border:none; background-color: #e2e2e2;" type="text" name="fb_title" placeholder="제목을 입력해주세요"/></dd><br>
							<dd>작성자 <input style="border:none; background-color: #e2e2e2;" type="text" name="fb_writer" placeholder="작성자 필수입력"></dd><br>
							<dd><textarea style="border:none; background-color: #e2e2e2;" rows="20" cols="90" name="fb_content" placeholder="내용"></textarea></dd><br>
							<dd>비밀번호 <input style="border:none; background-color: #e2e2e2;" type="password" name="fb_pwd" placeholder="비밀번호 필수입력"></dd><br>
						</dl>
						<br>
						<div id="ipt">
							<input type="button" value="등록" onclick="reg(this.form)"/>
							<input type="reset" value="리셋"/>
						</div>
					</form>
				</c:when>
				
				<c:otherwise>
					<form action="free_board_write_result.do" method="post">
						<table>
							<tr>
								<th>제 목<th>
								<td><input type="text" name="fb_title" placeholder="제목을 입력해주세요" style="width:400px"/></td>
								
								<th>작성자</th>
								<td><input type="hidden" name="fb_writer" value="${ sessionScope.memberID }">${ sessionScope.memberID }</td>
								
								<th>내 용</th>
								<td><textarea rows="20" cols="90" name="fb_content" placeholder="내용 입력"></textarea></td>
								
								<th>비밀번호 (회원님의 비밀번호로 자동저장됩니다)</th>
								<td><input type="password" name="fb_pwd" value="${ sessionScope.memberpwd }" readonly></td>
							</tr>
						</table>
						<br>
						<div id="ipt">
							<input type="button" value="등록" onclick="reg(this.form)"/>
							<input type="reset" value="리셋"/>
						</div>
					</form>
				</c:otherwise>
			
			</c:choose>
			
			
		</fieldset>
	</body>
</html>