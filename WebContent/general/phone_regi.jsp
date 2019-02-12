<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
		function check ( f ) {
			// 유효성 검사 해야함
			f.submit();
		}
		</script>
	</head>
	
	<body>
		<jsp:include page="../shop/main.jsp"/>
		
		<form name="f" method="post" action="../regist.do" enctype="multipart/form-data">
			<table align="center" width="800" height="200" border="1" style="border-collapse: collapse;">
				<tr>
					<td>제조회사</td>
					<td>
						<select name="p_company">
							<option>제조회사</option>
							<option value="apple">APPLE</option>
							<option value="samsung">SAMSUNG</option>
							<option value="lg">LG</option>
							<option value="other">기타</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>모델명</td>
					<td><input name="p_name"></td>
				</tr>
				
				<tr>
					<td>희망매입가</td>
					<td><input name="p_price"></td>
				</tr>
				
				<tr>
					<td>하자내용</td>
					<td><textarea cols="50" rows="20" name="p_text"></textarea></td>
				</tr>
				
				<tr>
					<td>제품사진 (미리보기)</td>
					<td><input type="file" name="main_image"></td>
				</tr>
				
				<tr>
					<td>사진1</td>
					<td><input type="file" name="image1"></td>
				</tr>
				
				<tr>
					<td>사진2</td>
					<td><input type="file" name="image2"></td>
				</tr>
				
				<tr>
					<td>사진3</td>
					<td><input type="file" name="image3"></td>
				</tr>
				
				<tr>
					<td>사진4</td>
					<td><input type="file" name="image4"></td>
				</tr>
				
				<tr>
					<!-- 회원 고유번호 -->
					<td><input type="hidden" name="g_idx" value=${ sessionScope.g_idx }></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="매도신청" onclick="check(this.form)">
						<input type="reset" value="초기화">
						<input type="button" value="이전으로" onclick="javascript:history.go(-1)">
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>