<%@page import="java.util.HashMap"%>
<%@page import="vo.QnABoardVO"%>
<%@page import="dao.QnABoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
    	request.setCharacterEncoding("utf-8");
        	
       	String col 		= request.getParameter("col");  // 검색조건 파라미터
       	String word	 	= request.getParameter("word"); // 검색란에 입력한 파라미터
       	
       	// 검색조건과 내용을 Map에 담는다.
       	Map<String, String> map = new HashMap<String, String>();
       	map.put("col", col);
       	map.put("word", word);
       	
       	List<QnABoardVO> search_list = QnABoardDAO.getInstance().select_Search_Board( map );
       	
       	request.setAttribute("search_list", search_list);	// 검색된 게시물
       	request.setAttribute("total", search_list.size());	// 전체 게시물 수
       	
       	/* 다끝나면 콜백함 */
   %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시물 검색 ajax 파일</title>
	</head>
	
	<body>
		<div id="left">
			<fieldset>
			<legend><h2>검색결과</h2></legend>
			<table class="tb" style="border : 2px solid darkgrey; border-collapse : collapse">
				<tr height="35">
					<td width="10">번호</td>
					<td width="300">제목</td>
					<td width="80">작성자</td>
					<td width="80">작성일</td>
					<td width="60">조회수</td>
				</tr>
				
				<c:if test="${ empty search_list }">
		    		<tr height="40">
		      			<td colspan="5">게시물이 존재하지 않습니다!</td>
		    		</tr>
				</c:if>
				
				<c:forEach var="list" items="${ search_list }">
				<tr height="40">
					<td width="60">${ list.fb_idx }</td>
					<td width="120"><a href="javascript:viewcontent(${ list.fb_idx })">${ list.fb_title }</a></td>
					<td width="120">${ list.fb_writer }</td>
					<td width="100">${ list.fb_uploadDate }</td>
					<td width="40">${ list.fb_viewNum }</td>
				</tr>
				</c:forEach>
			</table>
			<br>
				<div style="text-align:right;">
		  	    	<strong>검색된 게시물 수 : ${ total }</strong>
		  		</div>
			</fieldset>
		</div>
		<div id="right"></div>
	</body>
</html>