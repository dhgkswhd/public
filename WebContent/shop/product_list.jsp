<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>사구팔구</title>
		
		<style>
		.list {
			border : none;
			margin: 0 auto;
			margin-top : 30px;
		}
		
		.list table {
			border : 2px solid darkgrey;
			width : 99%;
			margin : 0 auto;
		}
		
		</style>
	</head>
	<body>
		<jsp:include page="../shop/main.jsp"/>
		
		<div class="list">
			<table>
				<tr style="height: 40px; border-bottom : 2px solid lightgrey;">
					<th>판매자</th>
					<th>제품사진</th>
					<th>제조회사</th>
					<th>모델명</th>
					<th>고객희망매입가</th>
					<th>등록일</th>
					<th>상태</th>
					<th>매입</th>
				</tr>
				
				<!-- 제품이 없을경우 -->
				<c:if test="${ empty list }">
					<tr>
						<td colspan="8" align="center">
							상품이 없습니다.
						</td>
					</tr>
				</c:if>
				
				<c:forEach var="vo" items="${ list }" varStatus="status">
					<tr align="center">
						<td>
							${ vo.p_register }
						</td>
						
						<td>
							<a href="product_view.do?p_idx=${ vo.p_idx }">
							<img src="productimages/${ vo.p_image_s }" width="100" height="90">
							</a>
						</td>
					
						<td>
							${ vo.p_company }
						</td>
					
						<td>
							<a href="product_view.do?p_idx=${ vo.p_idx }">
							${ vo.p_name }
							</a>
						</td>
					
						<td>
							<fmt:formatNumber value="${ vo.p_price }" type="currency"/><br>
						</td>
					
						<td>
							${ vo.p_regidate }
						</td>
						
						<td>
							<c:if test="${ vo.p_status == '완료'}">
								<span style="color:red">거래완료</span>
							</c:if>
							<c:if test="${ vo.p_status == '대기'}">
								<span style="color:blue">매입가능</span>
							</c:if>
							<c:if test="${ vo.p_status == '거래중'}">
								<span style="color:orange">거래중</span>
							</c:if>
						</td>
						 		
						<td>
							<input class="btn" type="button" value="상세보기" onclick="location.href='product_view.do?p_idx=${ vo.p_idx }'">
						</td>
					</tr>
				</c:forEach>
			</table>
			<div style="text-align:center;">
				<span>
					<!-- 첫 페이지로 이동하는 버튼. 그냥 파라미터로 1넣으면 됨 -->
					<input class="pbtn" type="button" value="처음" onclick="location.href='product_list.do?page=1'">
					
					<!-- 이전 페이지로 이동하는 버튼. 현재페이지-1 -->
					<c:if test="${ paging.currentPage > 1 }">
						<input class="pbtn" type="button" value="이전" onclick="location.href='product_list.do?page=${ paging.currentPage - 1 }'">
					</c:if>
					
					<!-- 현재 페이지가 1이면 '이전'은 비활성화 버튼으로 만든다. -->
					<c:if test="${ paging.currentPage <= 1 }">
						<input class="pbtn" type="button" value="이전" disabled>
					</c:if>
					
					<!-- 1~10 각 페이지 버튼 만들기
							startPage, endPage 이런 값들은 이미 Paging 객체 생성 시 다 계산해놨다!! -->
					<c:forEach var="i" begin="${ paging.startPage }" end="${ paging.endPage }" step="1">
						
						<!-- 현재 페이지의 버튼이라면 클릭할 필요 없다. 비활성화 -->
						<c:if test="${ paging.currentPage == i }">
							<input class="pbtn" type="button" value="${ i }" disabled="disabled">
						</c:if>
						
						<c:if test="${paging.currentPage != i}">
							<input class="pbtn" type="button" value="${ i }" onclick="location.href='product_list.do?page=${ i }'">
						</c:if>
						
					</c:forEach>
					
					<!-- 다음 버튼 (현재페이지+1) -->
					<c:if test="${ paging.currentPage < paging.totalPage }">
						<input class="pbtn" type="button" value="다음" onclick="location.href='product_list.do?page=${ paging.currentPage + 1 }'">
					</c:if>
					
					<!-- 현재 페이지가 마지막페이지이면 '다음'은 비활성화 버튼으로 만든다. -->
					<c:if test="${ paging.currentPage >= paging.totalPage }">
						<input class="pbtn" type="button" value="다음" disabled>
					</c:if>
					
					<!-- 마지막 페이지로 이동하는 버튼. -->
					<input class="pbtn" type="button" value="끝" onclick="location.href='product_list.do?page=${ paging.totalPage }'">				
				</span>
				<span>
					등록 제품 : ${ countAll } 개
				</span>
			</div>
		</div>
	</body>
</html>










