<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사구팔구 > 마이페이지</title>
		<style>
		#mypagemenu {
		    position: absolute;
		    top: 178px;
		    padding: 20px 50px 100% 50px;
		    border-right: 1px solid gray;
		    padding-bottom: 100%;
		}
		
		#mypagemenu ul {
			padding: 0;
		}
		
		#mypagemenu li {
			list-style: none;
		}
		</style>
	</head>
	<body>
		<div id="mypagemenu">
			<ul>
				<li><a href="member_update_input.do">회원정보수정</a></li>
				<li><a href="member_update_pwd_input.do">비밀번호변경</a></li>
				<li><a href="">내 게시글</a></li>
				<li><a href="member_history_input.do">내 거래내역</a></li>
				<li><a href="member_leaving.do">회원탈퇴</a></li>
			</ul>
		</div>
	</body>
</html>