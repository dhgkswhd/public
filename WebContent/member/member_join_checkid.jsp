<%@page import="dao.BuyerDAO"%>
<%@page import="dao.SellerDAO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 회원가입 아이디체크 (일반회원, 사업자회원 둘다 중복되면 안됨) -->    
<%
    	request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
       	String paramId = request.getParameter("id"); // 넘어온 ID
       	String msg = "";
       	boolean buyer = false;
       	boolean seller = false;
       	
       	System.out.println("파라미터 ID : " + paramId);
       	
       	if ( paramId != "" && !(paramId.indexOf(" ") >= 0) &&
       			!(paramId.length() < 4 || paramId.length() > 12) ) {

       		// 아이디 중복체크는 두 테이블에서 모두 검사함
       		buyer = BuyerDAO.getInstance().checkId( paramId );
       		seller = SellerDAO.getInstance().checkId( paramId );
       	}
       	
       	if (buyer && seller) {
       		msg =  "사용가능한 아이디 입니다.";
       	} else {
       		msg =  "사용할 수 없는 아이디 입니다.";
       	}
       	
       	pageContext.setAttribute("buyer", buyer);
       	pageContext.setAttribute("seller", seller);
       	pageContext.setAttribute("msg", msg);
%>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<c:choose>
			<c:when test="${ seller and buyer }">
				<span style="color:blue">${ msg }</span>
			</c:when>
			<c:otherwise>
				<span style="color:red">${ msg }</span>
			</c:otherwise>
		</c:choose>
	</body>
</html>