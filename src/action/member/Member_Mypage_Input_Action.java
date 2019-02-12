package action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member_mypage_input.do")
public class Member_Mypage_Input_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 마이페이지 비밀번호확인으로 이동하기전에 할일 여기서 함
		
		RequestDispatcher disp = request.getRequestDispatcher("member/member_mypage.jsp");
		disp.forward(request, response);
	}

	
}
