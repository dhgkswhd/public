<%@page import="java.util.Arrays"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!------------------------- 회원정보 수정페이지 ------------------------->
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>사구팔구 > 마이페이지 > 회원정보 수정</title>
		<style>
		dl {
			text-align : left;
    		padding-left : 30%;	
		}
		
		dd {
			margin : 8px;
		}
		
		label {
			font-weight : 600;
		}
		
		fieldset {
			text-align : center;
			position : absolute;
			top : 40%;
			left : 50%;
			width : 800px;
			height : 350px;
			overflow : hidden;
		    transform : translate(-50%, -50%);
		}
		</style>
		
		<script>
		function update( f ) {
			var  		pwd = f.pwd.value;					 // 입력한 비밀번호 값
			var 	   pwd2 = f.pwd2.value; 				 // 입력한 비밀번호확인 값
			var  sessionPwd = '${ sessionScope.memberPwd }'; // 세션에 저장되어있는 내 비밀번호
			var phoneNumber = f.phonenumber.value;			 // 변경할 휴대폰번호
			
			if ( sessionPwd != pwd || sessionPwd != pwd2 ) {
				alert("비밀번호를 확인해주세요");
				return;
			}
			
			// 변경할 휴대폰번호 유효성검사
			if ( !(/^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/.test( phoneNumber )) ) {
				alert("휴대폰번호를 정확히 입력해주세요.");
				return;
			}
			
			if ('${ sessionScope.memberType }' == '사업자') {
				if ( f.businessnumber.value == "" || f.mutualname.value == "" ) {
					alert("필수정보를 모두 입력해야합니다.");
					return;
				}
			}
			
			if ( confirm("정말로 수정하시겠습니까?") ) {
				alert("회원정보 수정이 완료되었습니다.");
				f.submit();
			}
		}
		</script>
	</head>
	
	
	<body>
		<jsp:include page="../shop/main.jsp"/>
		<jsp:include page="../member/member_mypage_index.jsp"/>
		
		<form action="member_update_output.do" method="POST"> 
			<fieldset>
			<legend><h3>개인정보수정</h3></legend>
			<div style="display:;">
				<dl>
					<dd>
						<label for="id">아이디 </label>
						<input style="border:none; background-color: #e2e2e2;" name="id" id="id" type="hidden" value="${ sessionScope.memberId }">
						<strong style="color:gray">${ sessionScope.memberId }</strong>
					</dd>
					<dd>
						<label for="pwd">비밀번호 </label>
						<input style="border:none; background-color: #e2e2e2;" name="pwd" id="pwd" type="password" placeholder="8자 이상 ~ 20자 이하">
					</dd>
					<dd>
						<label for="pwd2">비밀번호확인 </label>
						<input style="border:none; background-color: #e2e2e2;" class="f" name="pwd2" id="pwd2" type="password" placeholder="8자 이상 ~ 20자 이하">
					</dd>
					
					<c:choose>
					
						<c:when test="${ sessionScope.memberType eq '일반' }">
							<dd>
								<label for="phonenumber">연락처 </label>
								<input style="border:none; background-color: #e2e2e2;" id="phonenumber" name="phonenumber" type="text" value="${ sessionScope.memberVO.seller_phonenumber }" placeholder=${ sessionScope.memberVO.seller_phonenumber }">
								<br> <h6>*연락처를 변경하시려면 현재 비밀번호를 입력하여야 합니다.</h6>
							</dd>
						</c:when>
					
						<c:when test="${ sessionScope.memberType eq '사업자' }">
							<dd>
								<label for="phonenumber">연락처 </label>
								<input style="border:none; background-color: #e2e2e2;" id="phonenumber" name="phonenumber" type="text" value="${ memberVO.buyer_phonenumber }" placeholder="${ memberVO.buyer_phonenumber }">
							</dd>
							<dd>
								<label for="businessnumber">사업자등록번호 </label>
								<input style="border:none; background-color: #e2e2e2;" id="businessnumber" name="businessnumber" type="text" value="${ memberVO.buyer_businessnumber }" placeholder="${ memberVO.buyer_businessnumber }">
							</dd>
							<dd>
								<label for="mutualname">상호명</label>
								<input style="border:none; background-color: #e2e2e2;" id="mutualname" name="mutualname" type="text" value="${ memberVO.buyer_mutualname }" placeholder="${ memberVO.buyer_mutualname }">
								<br> <h6>*개인정보를 변경하시려면 현재 비밀번호를 입력하여야 합니다.</h6>
							</dd>
						</c:when> 
						
					</c:choose>
				</dl>
				<div>
					<input class="btn" type="button" value="수정" onclick="update(this.form)">
					<input class="btn" type="button" value="이전" onclick="javascript:history.go(-1)">
				</div>
			</div>
			</fieldset>
		</form>
	</body>
</html>