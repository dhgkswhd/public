<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>거래진행상황</title>
		
		<style>
			fieldset {
				margin: 0 auto;
				text-align : center;
				width : 97%;
				margin-top:30px;
			}
			
			fieldset .tb {
				border : 2px solid darkgrey;
				border-collapse : collapse;
				width : 99%;
	    		height: 99%;
			}
			
			fieldset .tb tr, fieldset .tb th, fieldset .tb td {
				border : 1px solid darkgrey;
			}
		</style>
		
		<script>
		function deposit ( b_id , g_id, hopeprice, p_idx ) {
			// 구매자아이디, 판매자아이디, 체결될 가격, 상품고유번호 넘김
			if ( confirm(hopeprice + "원에 구매하시겠습니까?") ) {
				alert("상품을 구매에 성공했습니다.");
				location.href = "dealcomplete.do?b_id=" + b_id + 
								"&g_id=" + g_id + 
								"&hopeprice=" + hopeprice +
								"&p_idx=" + p_idx;
			}
		}
		</script>
				
	</head>
	<body>
		<jsp:include page="../shop/main.jsp"/>
		
		<fieldset>
			<table class="tb">
				<tr style="height: 40px;">
					<th width="10%">판매자</th>
					<th width="10%">제품사진</th>
					<th width="10%">모델명</th>
					<th width="10%">나의 희망매입가</th>
					<th width="10%">매입신청일</th>
					<th width="10%">상태</th>
				</tr>
			
				<c:if test="${ empty list }">
					<tr>
						<td colspan="6" align="center">
							거래내역이 없습니다.
						</td>
					</tr>
				</c:if>
			
				<c:forEach var="list" items="${ list }">
					<tr align="center">
						<td>
							${ list.g_id }
						</td>
						
						<td>
							<img src="phoneimages/${ list.p_image_s }" width="100" height="90">
						</td>
					
						<td>
							${ list.p_name }
						</td>
						
						<td>
							<fmt:formatNumber value="${ list.hopeprice }"/>원<br>
						</td>
										
						<td>
							${ list.regidate }
						</td>
						
						<td>
							<c:if test="${ list.status eq '완료' }">
								<span style="color:red">구매완료</span>
							</c:if>
							
							<c:if test="${ list.status eq '미체결' }">
								<span style="color:orange">미체결</span>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</fieldset>
	</body>
</html>

