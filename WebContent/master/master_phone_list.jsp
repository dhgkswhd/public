<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>리셀폰</title>
		<style>
		fieldset {
			border : none;
			text-align : center;
			position : absolute;
			top : 66%;
			left : 50%;
			width : 600px;
			height : 250px;
		    transform : translate(-50%, -50%);
		}
		
		fieldset .tb {
			border : 2px solid darkgrey;
			border-collapse : collapse;
			width : 99%;
    		height: 99%;
		}
		
		fieldset .tb tr {
			height: 15px;
		}
		
		fieldset .tb tr, fieldset .tb th, fieldset .tb td {
			border : 1px solid darkgrey;
		}
		</style>
		<script>
		function details ( p_idx ) {
			location.href = "phone_view.do?p_idx=" + p_idx;
		}
		function p_delete(p_idx){
			if ( confirm("정말 탈퇴시키시겠습니까?") ) {
				location.href="phone_delete.do?p_idx=" + p_idx;
				alert("탈퇴완료");
				f.submit();
			}
		}
		</script>
	</head>
	<body>
		<jsp:include page="../shop/main.jsp"/>
		
		<fieldset>
			<table class="tb">
				<tr style="height: 40px;">
					<th>등록자</th>
					<th>제품사진</th>
					<th>제조회사</th>
					<th>모델명</th>
					<th>고객희망매입가</th>
					<th>등록일</th>
					<th>상태</th>
					<th>매입</th>
					<th>삭제하기</th>
				</tr>
				
				<!-- 제품이 없을경우 -->
				<c:if test="${ empty pa_list }">
					<tr>
						<td colspan="8" align="center">
							상품이 없습니다.
						</td>
					</tr>
				</c:if>
				
				<c:forEach var="pa" items="${ pa_list }">
					<tr align="center">
						<td>
							${ pa.g_id }
						</td>
						
						<td>
							<a href="phone_view.do?p_idx=${ pa.p_idx }">
							<img src="phoneimages/${ pa.p_image_s }" width="100" height="90">
							</a>
						</td>
					
						<td>
							${ pa.p_company }
						</td>
					
						<td>
							<a href="phone_view.do?p_idx=${ pa.p_idx }">
							${ pa.p_name }
							</a>
						</td>
					
						<td>
							<fmt:formatNumber value="${ pa.p_price }"/>원<br>
						</td>
					
						<td>
							${ pa.regidate }
						</td>
						
						<td>
							<c:if test="${ pa.status == '완료'}">
							<span style="color:red">거래완료</span>
							</c:if>
							<c:if test="${ pa.status == '대기'}">
							<span style="color:blue">매입가능</span>
							</c:if>
						</td>
						
						<td>
							<input type="button" value="상세보기" onclick="details(${ pa.p_idx })">
						</td>
						
						<td>
							<input type="button" value="삭제하기" onclick="p_delete('${ pa.p_idx }')">
						</td>
					</tr>
  				
					
				</c:forEach>
				
		<tr>
			<td colspan = "9" align= "center">
				<!-- 첫 페이지로 이동하는 버튼. 그냥 파라미터로 1 넣으면 됨 -->
				<input type = "button" value = "처음" onclick = "loction.href='phone_list_action.do?page=1'">
				
				<!-- 이전 페이지로 이동하는 버튼.  현재 페이지-1-->
				<c:if test="${ paging.currentPage > 1 }">
					<input type = "button" value = "이전" onclick = "loction.href='phone_list_action.do?page=${paging.currengPage-1}'">
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
						<input type = "button" value = "${i}" onclick = "loction.href='phone_list_action.do?page=${i}'">
					</c:if>
										
				</c:forEach>
				
				<!-- 다음버튼(현재페이지+1) -->
				
				<c:if test="${ paging.currentPage < paging.totalPage }">
					<input type = "button" value = "다음" onclick = "loction.href='phone_list_action.do?page=${paging.currengPage+1}'">
				</c:if>
				
				<!-- 현재 페이지가 마지막페이지이면 '다음'은 비활성화 버튼으로 만든다 -->
				<c:if test="${ paging.currentPage >= paging.totalPage }">
					<input type = "button" value = "다음" disabled="disabled">
				</c:if>
				
				<!-- 마지막 페이지로 이동하는 버튼. -->
				<input type = "button" value = "끝" onclick = "loction.href='phone_list_action.do?page=${paging.totalPage}'">
				
			</td>
		</tr>	
				
			</table>
		</fieldset>
	</body>
</html>




