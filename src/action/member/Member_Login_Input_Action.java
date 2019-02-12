package action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member_login_input.do")
public class Member_Login_Input_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 페이지 이동하기 전에 할일 있으면 여기서
		
		RequestDispatcher disp = request.getRequestDispatcher("member/member_login.jsp");
		disp.forward(request, response);
	}

}
