<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 배열 사이즈 구하기위해서 사용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상세보기</title>
		
		<style>
		#content {
			text-align: center;
		}
		
		#content table {
			margin: 0 auto;
		    border: 2px solid gray;
		    border-collapse: collapse;
		    width: 1200px;
		}
		
		#content tr, #content td, #content th {
			border: 1px solid gray;
			border-collapse: collapse;
		}
		</style>
		
		<script>
			function parchase ( f ){
				var      memberType = '${ sessionScope.memberType }';			 // 로그인한 회원타입
				var    memberWallet = ${ sessionScope.memberWallet };			 // 현재로그인한 사업자회원이 보유한 money
				var   	    p_price = ${ vo.p_price };					 		 // 판매자 판매희망가
				var   doNotBuyAgain = Boolean(${ requestScope.doNotBuyAgain });  // product_view.do 에서 넘어온 매입중복체크 결과값 
				var buyer_hopeprice = f.buyer_hopeprice.value.trim();   		 // 구매자가 입력한 매입가격
				
				if ( memberType == '비회원' || memberType == '일반'){
					alert("사업자회원만 매입신청이 가능합니다. 비회원일경우 회원가입 후 이용해주세요.");
					return;
				}
				
				if ( confirm(p_price + " 원에 즉시매입 하시겠습니까?") ) {
					alert("매입에 성공하였습니다.");
					location.href = 
					return;
				}
				
				if ( buyer_hopeprice == ''){
					alert("금액을 입력해주세요");
					return;
				}	
				
				// 2번 매입신청 못하게 막음
				if ( doNotBuyAgain == true ) {
					alert("동일한 상품에 매입신청은 한번만 가능합니다.");
					return;
				}
				
				if ( buyer_hopeprice > p_price ) {
					alert("희망매입가보다 높은 금액은 입력할 수 없습니다.");
					return;
				}
				
				
				if ( memberWallet < p_price || memberWallet == null ) {
					alert("잔액이 부족합니다.")
					return;
				}
				
				
				if ( confirm(buyer_hopeprice + "원에 매입신청 하시겠습니까?") ){
					alert("등록되었습니다.");
				    f.submit();
				}
			}
		</script>
	</head>
	<body>
		<jsp:include page="main.jsp"/>
		<c:choose>
			<c:when test="${ vo.p_status eq '대기' }">
				<div id="content">
				<form method="get" action="apply_purchase.do">
					<table class="tb">
						<tr style="height: 50px;">
							<th>판매자</th>
							<th style="width:100px">제조회사</th>
							<th>모델명</th>
							<th style="width:150px">고객희망 매입가</th>
							<th colspan="2">등록일시</th>
						</tr>
												
						<tr style="height: 40px;">
							<td>
							
								${ vo.p_register }			
							</td>
							
							<td>
								${ vo.p_company }
							</td>
							
							<td>
								${ vo.p_name }
							</td>
							
							<td>
								<fmt:formatNumber value="${ vo.p_price }"/>원
							</td>
							
							<td colspan="2">
								${ vo.p_regidate }
							</td>
						</tr>
						
						<c:if test="${ !empty list[0].buyer_id }">
							<tr>
								<th rowspan="4">상세설명</th>
								
								<td colspan="2" rowspan="4">
									<textarea style="border:none; resize:none;"cols="60" rows="10" readonly>${ vo.p_text }</textarea>
								</td>
								
								<th rowspan="4">희망매입가<br> TOP3</th>
								
								<th style="height: 50px;">
									아이디
								</th>
								
								<th>
									희망매입가
								</th>
							
							</tr>
							
							<tr style="height: 35px;">
								<td>${ list[0].buyer_id }</td>
								<td><fmt:formatNumber value="${ list[0].buyer_hopeprice }"/></td>
							</tr>
							
							<tr style="height: 35px;">
								<td>${ list[1].buyer_id }</td>
								<td><fmt:formatNumber value="${ list[1].buyer_hopeprice }"/></td>
							</tr>
							
							<tr style="height: 35px;">
								<td>${ list[2].buyer_id }</td>
								<td><fmt:formatNumber value="${ list[2].buyer_hopeprice }"/></td>
							</tr>
						</c:if>
						
						<c:if test="${ empty list[0].buyer_id }">
							<tr>
							<th rowspan="4" style>상세설명</th>
							<td colspan="2" rowspan="4"><textarea style="font-family: Noto Sans KR; margin:5px auto; border:none; resize:none;"cols="50" rows="10" readonly>${ vo.p_text }</textarea></td>
							<th rowspan="4">희망매입가 TOP3</th>
							<th colspan="2" rowspan="4" style="height: 50px">아직 매입자가 없습니다</th>
							</tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
						</c:if>
					
						<tr style="height: 280px;">
							<th colspan="1">상세사진</th>
							<th colspan="5">
								<img src="productimages/${ vo.p_image_1 }" width="260">
								<img src="productimages/${ vo.p_image_2 }" width="260">
								<c:if test="${ vo.p_image_3 ne 'no_file' }">
									<img src="productimages/${ vo.p_image_3 }" width="260">
								</c:if>
								<c:if test="${ vo.p_image_4 ne 'no_file' }">
									<img src="productimages/${ vo.p_image_4 }" width="260">
								</c:if>
							</th>
						</tr>
					</table>
					<br>
					
					<input style="width: 150px; height: 25px;" type="text" name="buyer_hopeprice" placeholder="숫자만입력">
					<input style="border: 2px groove grey; background:none; width: 120px; height: 31px;" type="button" value="원에 매입신청" onclick="parchase(this.form)">
					<input style="border: 2px groove grey; background:none; width: 120px; height: 31px;" type="button" value="즉시매입" onclick="parchase(this.form)">
					<input style="border: 2px groove grey; background:none; width: 50px; height: 31px;" type="button" value="이전" onclick="javascript:history.go(-1)">
					
					<!-- 서블릿으로 념겨줄 hidden (상단에 input태그 사용하지 않아서 여기에 한번에 작성함)  -->
					
					<!-- 제품 고유번호 hidden -->
					<input type="hidden" name="p_idx" value="${ vo.p_idx }"/>
					
					<!-- 판매자 아이디 hidden -->
					<input type="hidden" name="seller_id" value="${ vo.p_register }"/>
					
					<!-- 판매자 판매희망가격 hidden -->
					<input type="hidden" name="seller_hopeprice" value="${ vo.p_price }"/>
						
					<!-- 구매자 아이디 hidden -->
					<input type="hidden" name="buyer_id" value="${ sessionScope.memberId }"/>
					
					<!-- 상품 미리보기이미지 hidden -->
					<input type="hidden" name="p_image_s" value="${ vo.p_image_s }"/>
					
					<!-- 상품명 hidden -->
					<input type="hidden" name="p_name" value="${ vo.p_name }"/>
				</form>
				</div>
			</c:when>
		
			<c:when test="${ vo.p_status eq '완료' }">
				<div id="content">
				<form method="get" action="apply_purchase.do">
					<table class="tb">
						<tr style="height: 50px;">
							<th>등록자</th>
							<th style="width:100px">제조회사</th>
							<th>제품명</th>
							<th style="width:150px">고객희망매입가</th>
							<th colspan="2">등록일</th>
						</tr>
												
						<tr style="height: 40px;">
							<td>
								${ vo.p_register }			
							</td>
							
							<td>
								${ vo.p_company }
							</td>
							
							<td>
								${ vo.p_name }
							</td>
							
							<td>
								<fmt:formatNumber value="${ vo.p_price }"/>원
							</td>
							
							<td colspan="2">
								${ vo.p_regidate }
							</td>
						</tr>	
						
						<tr>
							<th rowspan="4" >상세설명</th>
							
							<td colspan="2" rowspan="4">
								<textarea style="border:none; resize:none;"cols="60" rows="10" readonly>${ vo.p_text }</textarea>
							</td>
							
							<th style="color:red; border-right: 2px solid darkgrey;" colspan="2" rowspan="4">이미 판매된<br>상품입니다 </th>
						</tr>
						
						<tr></tr>
						<tr></tr>
						<tr></tr>
					
						<tr style="height: 280px;">
							<th colspan="1">상세사진</th>
							<th colspan="5">
								<img src="productimages/${ vo.p_image_1 }" width="260">
								<img src="productimages/${ vo.p_image_2 }" width="260">
								<c:if test="${ vo.p_image_3 ne 'no_file' }">
									<img src="productimages/${ vo.p_image_3 }" width="260">
								</c:if>
								<c:if test="${ vo.p_image_4 ne 'no_file' }">
									<img src="productimages/${ vo.p_image_4 }" width="260">
								</c:if>
							</th>
						</tr>
					</table>
				</form>
				</div>
			</c:when>
			
			<c:when test="${ vo.p_status eq '거래중' }">
				<div id="content">
				<form method="get" action="apply_purchase.do">
					<table class="tb">
						<tr style="height: 50px;">
							<th>등록자</th>
							<th style="width:100px">제조회사</th>
							<th>제품명</th>
							<th style="width:150px">고객희망매입가</th>
							<th colspan="2">등록일</th>
						</tr>
												
						<tr style="height: 40px;">
							<td>
								${ vo.p_register }			
							</td>
							
							<td>
								${ vo.p_company }
							</td>
							
							<td>
								${ vo.p_name }
							</td>
							
							<td>
								<fmt:formatNumber value="${ vo.p_price }"/>원
							</td>
							
							<td colspan="2">
								${ vo.p_regidate }
							</td>
						</tr>	
						
						<tr>
							<th rowspan="4" >상세설명</th>
							
							<td colspan="2" rowspan="4">
								<textarea style="border:none; resize:none;"cols="60" rows="10" readonly>${ vo.p_text }</textarea>
							</td>
							
							<th style="color:orange; border-right: 2px solid darkgrey;" colspan="2" rowspan="4">거래중인<br>상품입니다 </th>
						</tr>
						
						<tr></tr>
						<tr></tr>
						<tr></tr>
					
						<tr style="height: 280px;">
							<th colspan="1">상세사진</th>
							<th colspan="5">
								<img src="productimages/${ vo.p_image_1 }" width="260">
								<img src="productimages/${ vo.p_image_2 }" width="260">
								<c:if test="${ vo.p_image_3 ne 'no_file' }">
									<img src="productimages/${ vo.p_image_3 }" width="260">
								</c:if>
								<c:if test="${ vo.p_image_4 ne 'no_file' }">
									<img src="productimages/${ vo.p_image_4 }" width="260">
								</c:if>
							</th>
						</tr>
					</table>
				</form>
				</div>
			</c:when>
		</c:choose>
	</body>
</html>











