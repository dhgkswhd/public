	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>내 단말기 판매하기</title>
		<style>
		#regi {
			text-align: center;
		}
		
		#regi table {
			margin: 0 auto;
		    border: 2px solid gray;
		    width: 50%;
		    border-collapse:collapse;
		}
		
		#regi .td1 {
			text-align: center;
			border: 1px solid gray;
			height: 40px;
			font-weight: 500;
		}
		
		#regi .td2 {
			text-align: left;
			padding-left: 10px;
			border: 1px solid gray;
		}
		
		</style>
		<script>
		function regi ( f ) {
			var p_company = f.p_company.value;	  // 제조회사 
			var    p_name = f.p_name.value.trim();		  // 모델명
			var   p_price = f.p_price.value.trim();	  // 희망매도가격
			var    p_text = f.p_text.value.trim();		  // 내용
			var p_image_s = f.p_image_s.value.trim(); // 미리보기사진
			var p_image_1 = f.p_image_1.value.trim(); // 사진1
			var p_image_2 = f.p_image_2.value.trim(); // 사진2
			var p_image_3 = f.p_image_3.value.trim(); // 사진3
			var p_image_4 = f.p_image_4.value.trim(); // 사진4
		
			if ( p_company == "" || p_name == "" || p_price == "" || p_text == "" ) {
				alert("모든 항목을 필수입력 해야합니다.");
				return;
			}
			
			if( p_image_s =='' ){
				alert("미리보기 사진은 필수첨부 해야입니다.");
				return;
			}
			
			if( p_image_1 == '' || p_image_2  == "" ){
				alert("최소2장의 사진을  첨부해주세요!");
				return;
			}
			
			if (confirm("등록하시겠습니까?")) {
				f.submit();	
			}
		}
		</script>
	</head>
	
	<body>
		<jsp:include page="../shop/main.jsp"/>
		
		<div id="regi">
		<form method="post" action="product_regist_output.do" enctype="multipart/form-data">
			<table>
				<tr>
					<td class="td1">판매자</td>
					<td class="td2" style="color:orange">${ sessionScope.memberId }</td>
				</tr>
				
				<tr>
					<td class="td1">제조회사</td>
					<td class="td2">
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
					<td class="td1">모델명</td>
					<td class="td2"><input style="border:none; background-color: #e2e2e2;" name="p_name"></td>
				</tr>
				
				<tr>
					<td class="td1">희망매입가</td>
					<td class="td2"><input style="border:none; background-color: #e2e2e2;" name="p_price"></td>
				</tr>
				
				<tr>
					<td class="td1">내용</td>
					<td class="td2"><textarea style="border:none; background-color: #e2e2e2; resize:none;"cols="40" rows="10" name="p_text"></textarea></td>
				</tr>
				
				<tr>
					<td class="td1">제품사진 (미리보기)</td>
					<td class="td2"><input type="file" name="p_image_s"></td>
				</tr>
				
				<tr>
					<td class="td1">사진1</td>
					<td class="td2"><input type="file" name="p_image_1"></td>
				</tr>
				
				<tr>
					<td class="td1">사진2</td>
					<td class="td2"><input type="file" name="p_image_2"></td>
				</tr>
				
				<tr>
					<td class="td1">사진3</td>
					<td class="td2"><input type="file" name="p_image_3"></td>
				</tr>
				
				<tr>
					<td class="td1">사진4</td>
					<td class="td2"><input type="file" name="p_image_4"></td>
				</tr>
			</table>
			<br>
			<input class="btn" type="button" value="등록" onclick="regi(this.form)">
			<input class="btn" type="reset" value="초기화">
			<input class="btn" type="button" value="이전" onclick="javascript:history.go(-1)">
		</form>
		</div>
	</body>
</html>