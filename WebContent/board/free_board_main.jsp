<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!------------------------- 게시판 메인 페이지 ------------------------->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>리셀폰 자유게시판</title>
		<style>
			
			.tb tr, .tb td {
				border : 2px solid darkgrey;
				text-align : center;
			}
			
			.tb2 tr, .tb2 td {
				border : 2px solid darkgrey;
			}
			
			.tb2 .td1 {
				text-align : center;	
				width : 40px;
				height : 30px;		
			}
			
			.tb2 .td2 {
				text-align : left;
				width : 120px;
				padding-left : 15px;
			}
			
			
			.pbtn {
				border: 2px groove grey;
			    font-family: Noto Sans KR;
			    background: none;
			    font-size: 12px;
			}
			
		</style>
			
		<script src="js/httpRequest.js"></script>
		
		<!-- ajax 관련 스크립트파일 -->
		<script>
			// 게시물작성 ajax
			function writecontent () {
				var url = "board/free_board_writecontent.jsp";
				var param = ""; // 단순히 글쓰기 페이지라 파라미터 없음
				
				sendRequest( url, param, result_check, "POST" );
			}
			
			// 게시물보기 ajax
			function viewcontent ( fb_idx ) {
				var url = "board/free_board_viewcontentAjaxfile.jsp";
				var param = "fb_idx=" + fb_idx;
				
				sendRequest( url, param, result_check, "POST" );
			}
			
			// 게시물 수정 ajax
			function updatecontent ( f ) {
				var fb_idx = f.fb_idx.value;		  		   // 게시물번호
				var contentpwd = f.contentpwd.value;		   // 게시글 비밀번호
				var inputpwd   = f.inputpwd.value; 			   // 입력한 비밀번호
				
				if ( inputpwd == "" ) { 
					alert("글 수정/삭제시 비밀번호는 필수입력항목입니다.");
					return;
				}
				
				if ( inputpwd != contentpwd ) {
					alert("비밀번호가 틀렸습니다.");
					return;
				}
				
				var url = "board/free_board_updatecontentAjaxfile.jsp";
				var param = "fb_idx=" + fb_idx +
							"&inputpwd=" + inputpwd +
							"&contentpwd=" + contentpwd;
				
				sendRequest( url, param, result_check, "POST" );
			}
			
			// 게시물 검색 ajax
			function searchcontent ( f ) {
				var col = f.col.value;	 // 검색조건
				var word = f.word.value; // 검색란에 입력한 값
				
				if ( col == 'none' ) { 
					alert("검색조건을 선택해주세요");
					return;
				}
				
				if ( word == "" ) {
					alert("검색어를 입력해주세요");
					return;
				}
				
				var url = "board/free_board_searchcontentAjaxfile.jsp";
				var param = "col=" + col + "&word=" + word;
				
				sendRequest( url, param, result_check, "POST" );
			}
			
			// 댓글 불러오기 ajax
			function commentlist ( fb_idx ) {
				var url = "free_board_commentlist.do";
				var param = "fb_idx=" + fb_idx;
				
				sendRequest( url, param, result_check, "POST" );
			}
			
			// 댓글 작성
			function regi( f, fb_idx ) {
	
				var fb_idx = f.fb_idx.value.trim();
				var com_writer = f.com_writer.value.trim();
				var com_comment = f.com_comment.value.trim();
				
				if ( com_comment == "" ) {
					alert("댓글을 입력하세요!");
					f.com_comment.focus();
					return;
				}ㅌ
				
				if ( com_writer == "비회원" ) {
					alert("로그인을 해주세요!");
					f.com_writer.focus();
					return;
				}
				
				var url = "free_board_comment.do";
				var param = "fb_idx=" + fb_idx + "&com_writer=" + com_writer + "&com_comment=" + com_comment;
				
				sendRequest( url, param, result_insert, "POST" );
				
				// / 댓글 불러오기 ajax
				function result_insert () {
					if ( xhr.readyState == 4 && xhr.status == 200 ) {
						var data = xhr.responseText;
						var json = eval( data );
						commentlist( json[0].fb_idx );
					}
				}	
			}
	
			// 댓글 삭제
			function deletecomment( f, fb_idx ) {
				
				var com_idx = f.com_idx.value.trim();				// 댓글 번호
				var com_writer = f.com_writer.value.trim(); 		// 댓글 작성자
				var com_member = f.com_member.value.trim();			// 세션에 저장되어있는 아이디 (비회원일경우 '비회원')
	
				if( com_member != com_writer){
					alert("권한이 없습니다.")
					f.com_writer.focus();
					return;
				}
				
			  	// 댓글 번호
				var url = "free_board_comment_delete.do";
				var param = "com_idx=" + com_idx + "&fb_idx="+fb_idx;
				sendRequest( url, param, result_delete, "POST" );
				
				// 댓글 삭제 콜백메서드
				function result_delete () {
					if ( xhr.readyState == 4 && xhr.status == 200 ) {
						var data = xhr.responseText;
						var json = eval( data );
						commentlist( json[0].fb_idx );
					}
				}
			}
		
			// 톻합 콜백메서드
			function result_check () {
				if ( xhr.readyState == 4 && xhr.status == 200 ) {
					var data = xhr.responseText;
					document.getElementById("right").innerHTML = data;
				}
			}
		</script>
		
		<!-- 각종 유효성검사 스크립트파일 -->
		<script>
			// 게시물수정
			function updatecomplete ( f ) {
				var fb_title = f.fb_title.value.trim();
				var fb_content = f.fb_content.value.trim();
	
				if( fb_title == '') {
					alert("제목을 입력하세요!");
					f.fb_title.focus();
					return;
				}
				
				if( fb_content == '' ) {
					alert("내용을 입력하세요!");
					f.fb_content.focus();
					return;
				}
				
				alert("게시물이 수정되었습니다");
				f.submit();
			}
			
			// 게시물삭제
			function del( f ) {
				var contentpwd = f.contentpwd.value;		   // 게시글 비밀번호
				var inputpwd   = f.inputpwd.value; 			   // 입력한 비밀번호
				var fb_idx = f.fb_idx.value;				   // 게시물 번호
				
				if ( inputpwd == "" ) { 
					alert("글 수정/삭제시 비밀번호는 필수입력항목입니다.");
					return;
				}
				
				if (contentpwd != inputpwd ) {
					alert("비밀번호가 틀렸습니다");
					return;
				}
				
				if ( confirm("정말 삭제하시겠습니까?") ) {
					alert("게시물이 삭제되었습니다.");
					location.href="free_board_delete.do?fb_idx=" + fb_idx;
				}
			}
			
			// 게시물 작성
			function reg ( f ) {
				var  sessionId = String("${ sessionScope.memberID }"); // 세션에 저장되어있는 아이디 (비회원일경우 '비회원')
				var  fb_writer = f.fb_writer.value.trim();
				var   fb_title = f.fb_title.value.trim();
				var    fb_pwd  = f.fb_pwd.value.trim();
				
				if ( sessionId == "비회원" ) {
					
					if ( fb_writer == "" ) {
						alert("작성자를 입력하세요!");
						f.fb_writer.focus();
						return;
					}
					
					if( fb_title == "") {
						alert("제목을 입력하세요!");
						f.fb_title.focus();
						return;
					}
					
					if ( fb_pwd == "" ) {
						alert("비밀번호를 입력하세요!");
						f.fb_pwd.focus();
						return;
					}
				}
				
				else {
					if( fb_title == "" ) {
						alert("제목을 입력하세요!");
						f.fb_title.focus();
						return;
					}
				}
				
				alert("게시물이 등록되었습니다.");
				f.submit();
			}
		</script>
	</head>
	
	<body>
		<jsp:include page="../shop/main.jsp"/>
		
		<div id="left">
			<span style="float:left; width:50%;">
			<fieldset>
				<legend><h2>자유게시판</h2></legend>
				<table class="tb" style="border : 2px solid darkgrey; border-collapse : collapse">
					<tr height="35">
						<td width="10">번호</td>
						<td width="300">제목</td>
						<td width="80">작성자</td>
						<td width="80">작성일</td>
						<td width="60">조회수</td>
					</tr>
					
					<c:if test="${ empty list }">
			    		<tr height="40">
			      			<td colspan="5">게시물이 존재하지 않습니다!</td>
			    		</tr>
					</c:if>
					
					<c:forEach var="board" items="${ list }">
					<tr height="40">
						<td width="60">${ board.fb_idx }</td>
						<td width="120"><a href="javascript:viewcontent(${ board.fb_idx }); commentlist(${ board.fb_idx });">${ board.fb_title }</a></td>
						<td width="120">${ board.fb_writer }</td>
						<td width="100">${ board.fb_uploadDate }</td>
						<td width="40">${ board.fb_viewNum }</td>
					</tr>
					</c:forEach>
				</table>
				
				<br>
				
				<div style="text-align:center;">
					<span>
						<!-- 첫 페이지로 이동하는 버튼. 그냥 파라미터로 1넣으면 됨 -->
						<input class="pbtn" type="button" value="처음" onclick="location.href='free_board_main.do?page=1'">
						
						<!-- 이전 페이지로 이동하는 버튼. 현재페이지-1 -->
						<c:if test="${paging.currentPage > 1}">
							<input class="pbtn" type="button" value="이전" onclick="location.href='free_board_main.do?page=${paging.currentPage-1}'">
						</c:if>
						
						<!-- 현재 페이지가 1이면 '이전'은 비활성화 버튼으로 만든다. -->
						<c:if test="${paging.currentPage <= 1}">
							<input class="pbtn" type="button" value="이전" disabled="disabled">
						</c:if>
						
						<!-- 1~10 각 페이지 버튼 만들기
								startPage, endPage 이런 값들은 이미 Paging 객체 생성 시 다 계산해놨다!! -->
						<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1">
							
							<!-- 현재 페이지의 버튼이라면 클릭할 필요 없다. 비활성화 -->
							<c:if test="${paging.currentPage == i}">
								<input class="pbtn" type="button" value="${i}" disabled="disabled">
							</c:if>
							
							<c:if test="${paging.currentPage != i}">
								<input class="pbtn" type="button" value="${i}" onclick="location.href='free_board_main.do?page=${i}'">
							</c:if>
							
						</c:forEach>
						
						<!-- 다음 버튼 (현재페이지+1) -->
						<c:if test="${paging.currentPage < paging.totalPage}">
							<input class="pbtn" type="button" value="다음" onclick="location.href='free_board_main.do?page=${paging.currentPage+1}'">
						</c:if>
						
						<!-- 현재 페이지가 마지막페이지이면 '다음'은 비활성화 버튼으로 만든다. -->
						<c:if test="${paging.currentPage >= paging.totalPage}">
							<input class="pbtn" type="button" value="다음" disabled="disabled">
						</c:if>
						
						<!-- 마지막 페이지로 이동하는 버튼. -->
						<input class="pbtn" type="button" value="끝" onclick="location.href='free_board_main.do?page=${paging.totalPage}'">				
						</span>
						<span>  
						    <strong>총 게시물 수 : ${ total }</strong>
						</span>
					</div>
					
					<div id="search" style="text-align:left">
		  				<form method="GET" style="text-align:center; margin-top:20px;">
		    				<input class="pbtn" type="button" value="글쓰기" onclick="writecontent()"> 
							    <select name="col"> 
							    	<option value="none">검색조건</option>
							        <option value="writer">작성자</option>
							        <option value="title">제목</option>
							        <option value="content">내용</option>
							    </select>
					        <input style="border:none; background-color: #e2e2e2;" type="text" name="word" placeholder="특수문자 사용불가" >
					        <input class="pbtn" type="button" value="검색" onclick="searchcontent(this.form)">
					    </form>   
					 </div>
				</fieldset>
			</span>
			<span id="right" style="float:left; width:50%;"></span>
		</div>
	</body>
</html>