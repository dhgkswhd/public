<%@page import="vo.QnABoardVO"%>
<%@page import="dao.QnABoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int fb_idx = 0;
	
	// 수정할 게시물 번호
	if (request.getParameter("fb_idx") != null ) {
		fb_idx = Integer.parseInt(request.getParameter("fb_idx"));
	}
	System.out.println("게시글번호 : " + fb_idx);
	System.out.println("입력한비번 : " + request.getParameter("inputpwd"));
	System.out.println("게시글 비번 : " + request.getParameter("contentpwd"));
	
	// 게시물 번호로 내용 가져옴
	QnABoardDAO dao = QnABoardDAO.getInstance();
	QnABoardVO board = dao.select_One(fb_idx);
	
	// 게시물 데이터 현재페이지에 담아서 아래 html영역에 바로 출력해줌
	pageContext.setAttribute("board", board);
	
	/** 다끝나면 콜백함 */
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시물 수정 ajax 파일</title>
		<style>
		.tb2 .td1-1 {
			text-align : center;
			width : 100px;
			height : 30px;	
		}
		
		.tb2 .td1-2 {
			text-align : left;
			width : 120px;
		}
		</style>
	</head>
	<body>
	
		<fieldset>
			<legend><h2>수정</h2></legend>
			<form action="free_board_modify_result.do?fb_idx=${ board.fb_idx }" method="POST">
				<table class="tb2" style="border : 2px solid darkgrey; border-collapse : collapse; width : 600px">
					<tr>
						<td class="td1-1">게시물번호</td>
						<td class="td1-2">${ board.fb_idx }</td>
					</tr>
			
					<tr>
						<td class="td1-1">작성자</td>
						<td class="td2-1">${ sessionScope.memberID }</td>
					</tr>
			
					<tr>
						<td class="td1-1">작성일</td>
						<td class="td2-1">${ board.fb_uploadDate }</td>
					</tr>
			
					<tr>
						<td class="td1-1">제목</td>
						<td class="td2-1"><input name="fb_title" type="text" value="${ board.fb_title }" style="outline:none; border:none; width:400px"></td>
					</tr>
					
					<tr>
						<td style="width:30px; height:350px; text-align:center">내용</td>
						<td><textarea name="fb_content" cols="60" rows="22" style="border:0; overflow:visible; outline:none; resize:none;">${ board.fb_content }</textarea></td>
					</tr>
				</table>
				<br>
				<div style="text-align: center">
					<input class="btn" type="button" value="수정완료" onclick="updatecomplete(this.form)"/>
				</div>
			</form>
		</fieldset>	
	</body>
</html>