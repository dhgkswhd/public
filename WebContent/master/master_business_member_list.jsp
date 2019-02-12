<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			fieldset {
				text-align : center;
				position : absolute;
				top : 65%;
				left : 50%;
				width : 400px;
				overflow : hidden;
		    	transform : translate(-50%, -50%);
			}
		</style>
		
		<script>
			function bm_delete(b_idx, master){
				if ( confirm("정말 탈퇴시키시겠습니까?") ) {
					location.href="member_delete.do?b_idx=" + b_idx + "&master=" + master;
					alert("탈퇴완료");
					f.submit();
				}
			}
		</script>
			
	</head>
	<body>
		<!-- 페이지 동적 포함 (액션태그) -->
		<jsp:include page="../shop/main.jsp"/>
		
		<fieldset>
			<table align="center" width="700" height="100" border="1" style="border-collapse:collapse;">
				<tr>
					<th width="10%">회원번호</th>
					<th width="10%">회원아이디</th>
					<th width="10%">비밀번호</th>
					<th width="10%">전화번호</th>
					<th width="10%">사업자번호</th>
					<th width="10%">사업자명</th>
					<th width="10%">잔고현황</th>
					<th width="10%">탈퇴시키기</th>
				</tr>
			
				<!-- 회원이없는경우 -->
				<c:if test="${ empty bm_list }">
					<tr>
						<td colspan="6" align="center">
							회원이없습니다ㅠㅠ
						</td>
					</tr>
				</c:if>
			
				<c:forEach var="bm" items="${ bm_list }">
				<c:if test="${ bm.master eq 2 }">
					<tr align="center">
						<td>${ bm.b_idx }</td>
						<td>${ bm.b_id }</td>
						<td>${ bm.b_pwd }</td>
						<td>${ bm.b_phone }</td>
						<td>${ bm.b_businessnumber }</td>
						<td>${ bm.b_mutualname }</td>
						<td>${ bm.b_wallet }</td>
						<input type="hidden" name="master" value='${ bm.master }' >
						<td>
							<input type="button" value="삭제하기" onclick="bm_delete('${ bm.b_idx }','${ bm.master }')">
						</td>						
					</tr>	
				</c:if>					
				</c:forEach>
				
						<tr>
			<td colspan = "9" align= "center">
				<!-- 첫 페이지로 이동하는 버튼. 그냥 파라미터로 1 넣으면 됨 -->
				<input type = "button" value = "처음" onclick = "loction.href='member_list_action.do?page=1'">
				
				<!-- 이전 페이지로 이동하는 버튼.  현재 페이지-1-->
				<c:if test="${ paging.currentPage > 1 }">
					<input type = "button" value = "이전" onclick = "loction.href='member_list_action.do?page=${paging.currengPage-1}'">
				</c:if>
				
				<!-- 현재 페이지가 1이면 '이전'은 비활성화 버튼으로 만든다 -->
				<c:if test="${ paging.currentPage <= 1 }">
					<input type = "button" value = "이전" disabled="disabled">
				</c:if>
				
				<!-- 1~10 각 페이지 버튼 만들기
						startPage, endPage 이런값들은 이미 Paging 객체 생성시 다 계산해놨다!! -->
				<c:forEach var="i" begin="${ paging.startPage }" end="${ paging.endPage }" step="1">
				
					<!-- 현재 페이지의 버튼이라면 클릭할 필요 없다. 비활성화  -->
					<c:if test="${ paging.currentPage == i }">
						<input type = "button" value = "${i}" disabled="disabled">
					</c:if>
					
					<c:if test="${ paging.currentPage != i }">
						<input type = "button" value = "${i}" onclick = "loction.href='member_list_action.do?page=${i}'">
					</c:if>
										
				</c:forEach>
				
				<!-- 다음버튼(현재페이지+1) -->
				
				<c:if test="${ paging.currentPage < paging.totalPage }">
					<input type = "button" value = "다음" onclick = "loction.href='member_list_action.do?page=${paging.currengPage+1}'">
				</c:if>
				
				<!-- 현재 페이지가 마지막페이지이면 '다음'은 비활성화 버튼으로 만든다 -->
				<c:if test="${ paging.currentPage >= paging.totalPage }">
					<input type = "button" value = "다음" disabled="disabled">
				</c:if>
				
				<!-- 마지막 페이지로 이동하는 버튼. -->
				<input type = "button" value = "끝" onclick = "loction.href='member_list_action.do?page=${paging.totalPage}'">
				
			</td>
		</tr>
				
				
			</table>		
		</fieldset>
	</body>
</html>

