<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이디 / 비밀번호찾기</title>
		<style>
		fieldset {
			text-align : left;
			position : absolute;
			top : 45%;
			left : 50%;
			width : 500px;
			height : 260px;
			overflow : hidden;
		    transform : translate(-50%, -50%);
		}
		</style>
		<script>
		function find ( f ) {
			var id = f.id.value;					// 입력한 아이디
			var phoneNumber = f.phone.value;		// 입력한 휴대폰번호
			var membertype = f.membertype.value;	// 회원타입 (hidden)
			
			if ( id == "" || phoneNumber == "" ) {
				alert("필수정보를 모두 입력해야합니다.");
				return;
			}
			
			location.href = "member_search_pwd_output.do?id=" + id
					+ "&phoneNumber=" + phoneNumber
					+ "&membertype=" + membertype;
		}
		</script>
	</head>
	
	<body>
		<jsp:include page="../shop/main.jsp"/>
		
		<form action="member_join_result.do" method="POST">
		<input type="hidden" name="membertype" value="일반">
		<fieldset>
			<legend><h2>회원정보찾기</h2></legend>
				<p style="margin:0px 40px 0px"><strong>* 회원가입시 입력했던 아이디와 연락처를 입력해주세요</strong></p>
			<form method="POST">
				<div style="display:;">
					<dl>
						<dd>
							<input type="radio" value="일반" name="membertype" checked> 일반회원
							<input type="radio" value="사업자" name="membertype"> 사업자회원
						</dd>
						<dd>
							아이디 <input type="text" name="id">
						</dd>
						
						<dd>
							연락처 <input type="text" name="phone">
						</dd>
						<br>
						<dd>
							<input class="btn" type="button" value="찾기" onclick="find(this.form)">
						</dd>
					</dl>
				</div>
			</form>
		</fieldset>
		</form>
	</body>
</html>