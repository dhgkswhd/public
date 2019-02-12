<%@page import="vo.QnABoardVO"%>
<%@page import="dao.QnABoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");
	
	int fb_idx = 0;
	
	// 클릭한 게시물 번호
	if( request.getParameter("fb_idx") != null ) {
		fb_idx = Integer.parseInt(request.getParameter("fb_idx"));
	}
	
	// 게시물 번호로 조회
	QnABoardDAO dao = QnABoardDAO.getInstance();
	QnABoardVO board = dao.select_One( fb_idx );  // 게시물 내용 불러오고
		 dao.update_View( fb_idx ); // 조회수 증가시킴
	
	// 게시글 데이터 현재페이지에 담아서 아래 html영역에 바로 출력해줌
	pageContext.setAttribute("board", board);
	
		 
	/** 다끝나면 콜백함 */
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>클릭하면 댓글 수정화면 보여줄 ajax 파일</title>
		<script src="js/httpRequest.js"></script>
	</head>
	
	<body>
		
		<fieldset>
			<legend><h2>상세보기</h2></legend>
			<form method="post">
			<table class="tb2" style="border : 2px solid darkgrey; border-collapse : collapse; width : 600px">
				<tr>
					<td class="td1">게시물번호</td>
					<td class="td2">${ board.fb_idx }</td>
					<input type="hidden" name="fb_idx" value="${ board.fb_idx }">
				</tr>
		
				<tr>
					<td class="td1">작성자</td>
					<td class="td2">${ board.fb_writer }</td>
				</tr>
		
				<tr>
					<td class="td1">작성일</td>
					<td class="td2">${ board.fb_uploadDate }</td>
				</tr>
		
				<tr>
					<td class="td1">제목</td>
					<td class="td2">${ board.fb_title }</td>
				</tr>
				
				<tr>
					<td style="width:30px; height:350px; text-align:center">내용</td>
					<td>${ board.fb_content }</td>
				</tr>
				
				<tr>
					<td class="td1">비밀번호</td>
					<td><input type="password" name="inputpwd" placeholder="수정, 삭제시 필수입력"> (회원일경우 회원님의 비밀번호입니다)</td>
				</tr>
					
				<!-- 이 글의 비밀번호 hidden에 저장해둠 -->
				<input type="hidden" name="contentpwd" value="${ board.fb_pwd }">
			</table>
			<div style="text-align: center">
				<!-- updatecontent함수는 free_board_main에 있음 -->
				<input type="button" value="수정" onclick="updatecontent(this.form)" />
				<input type="button" value="삭제" onclick="del(this.form)"/>
			</div>
			</form>
            <div>
                <span><strong>Comments : ${Total}</strong></span><br>
                <span><strong>작성자 : ${sessionScope.memberID}</strong></span>
            </div>
            <form action="free_board_comment.do" method="post">
                <table>
                    <tr>
                        <td>
                        	<input type="hidden" name="fb_idx" value="${ board.fb_idx }">
                            <input type="hidden" name="com_writer" value="${ sessionScope.memberID }">
                            <textarea style="width: 600px" rows="3" cols="30"  name="com_comment" placeholder="댓글을 입력하세요"></textarea>
                        </td>
                    </tr>
                </table>
                      <div style="text-align: right">
                         <input type="button" value="등록" onclick="regi(this.form);">
                      </div>
            </form>
            	<c:forEach var="com" items="${ comment }">
            		<form method="post">
				        <div>
		        			<h4>${com.com_writer }
		        			(${com.com_uploadDate })</h4>
				        </div>		
		        			<textarea value="${com.com_comment }"></textarea>
        				<div>
		        			<input type="button" value="수정" onclick="updatecomment(this.form);">
		        			
	        			</div>
						<input type="hidden" name="com_writer" value="${ sessionScope.memberID }">
	        		  	<input type="hidden" name="com_member" value="${com.com_writer }">
			        	<input type="hidden" name="com_idx" value="${com.com_idx }">
			        	<input type="hidden" name="com_comment" value="${com.com_comment }">
			   		</form>  
				</c:forEach>
			      
				  
			<br>
			</fieldset>
		</body>
</html>