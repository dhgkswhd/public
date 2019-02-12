<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 비회원일경우 세션값들 -->
<c:if test="${ empty sessionScope.memberId }">
	<% session.setAttribute("memberId", "비회원"); %>
</c:if>
<c:if test="${ empty sessionScope.memberType }">
	<% session.setAttribute("memberType", "비회원"); %>
</c:if>
<c:if test="${ empty sessionScope.memberWallet }">
	<% session.setAttribute("memberWallet", 0); %>
</c:if>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>사구팔구</title>
		
		<!-- 스타일시트와 웹폰트 링크 -->
		<link rel="stylesheet" type="text/css" href="css/css_main.css?var=<%=System.currentTimeMillis()%>">
		<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet" type="text/css">
	</head>
	
	<body>
		<c:choose>
		
			<c:when test="${ sessionScope.memberType eq '비회원' }">
				<div style="text-align:right; margin: 10px 30px 0px 0px; font-size:13px;">
					<span>[${ sessionScope.memberType }]</span>
					<a href="member_join_typecheck.do">회원가입</a> | 
					<a href="member_login_input.do">로그인</a>
				</div>
				<div class="main">
					<span><a style="margin: 0px 0px 10px 30px; font-size:80px; color:orange; float:left; width:400px;" href="product_list_input.do">사구팔구</a></span>
					<span class="menu">
						<ul>
							<li><a onclick="alert('사이트 소개')">서비스소개</a></li>
							<li><a onclick="alert('회원가입 후 이용해주세요.')">내 폰 팔기</a></li>
							<li><a onclick="alert('회원가입 후 이용해주세요.')">기기매입</a></li>
							<li><a href="free_board_main.do">문의하기</a></li>
						</ul>
					</span>
				</div>
			</c:when>
			
			
			<c:when test="${ sessionScope.memberType eq '일반' or sessionScope.memberType eq '사업자'}">
				<div style="text-align:right; margin: 10px 30px 0px 0px; font-size:13px;">
					[${ sessionScope.memberType }회원]
					<strong>${ sessionScope.memberId }</strong> 님 안녕하세요 | 
					<a href="member_mypage_input.do">마이페이지</a> | 
					<a onclick="if( confirm('${ sessionScope.memberId }님 로그아웃 하시겠습니까?') ) { location.href='member_logout.do' }">로그아웃</a><br>
					내 사구머니 : <span style="color:blue; font-weight:400;"><fmt:formatNumber value="${ sessionScope.memberWallet }" /></span> |
					로그인시간 : ${ sessionScope.loginTime }
				</div>
				<div class="main">
					<span><a style="margin: 0px 0px 10px 30px; font-size:80px; color:orange; float:left; width:400px;" href="product_list_input.do">사구팔구</a></span>
					<span class="menu">
						<ul>
							<li><a onclick="alert('사이트 소개')">서비스소개</a></li>
							<li><a href="product_regist_input.do">내 폰 팔기</a></li>
							<li><a href="product_transaction_progress_input.do">거래진행상황</a></li>
							<li><a href="free_board_main.do">Q&A</a></li>
						</ul>
					</span>
				</div>
			</c:when>
			
			<c:otherwise>
				<div style="text-align:right; margin: 10px 30px 0px 0px; font-size:13px;">
					<strong>[ 관리자로 로그인 중입니다 ]</strong> | 
					<a onclick="if( confirm('로그아웃 하시겠습니까?') ) { location.href='member_logout.do' }">로그아웃</a><br>
					<div class="main">
						<span><a style="margin: 0px 0px 10px 30px; font-size:80px; color:orange; float:left; width:400px;" href="product_list_input.do">사구팔구</a></span>
						<span class="menu">
							<ul>
								<li><a class="category" href="member_list_action.do?master=1">일반회원목록</a></li>
								<li><a class="category" href="member_list_action.do?master=2">사업자회원목록</a></li>
								<li><a class="category" href="leaving_list_action.do">탈퇴회원목록</a></li>
								<li><a class="category" href="phone_list_action.do">모든거래목록</a></li>	
								<li><a class="category" href="board_list_action.do">게시글목록</a></li>
							</ul>	
						</span>
					</div>
				</div>
			</c:otherwise>
			
		</c:choose>
	</body>
</html>