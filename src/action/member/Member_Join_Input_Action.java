package action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member_join_input.do")
public class Member_Join_Input_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입페이지로 이동하기전에 할일 여기서 함
		
		// 회원가입 유형 파라미터에 담아서 보냄
		String jointype = request.getParameter("jointype");
		request.setAttribute("jointype", jointype);
		RequestDispatcher disp = request.getRequestDispatcher("member/member_join.jsp");
		disp.forward(request, response);
	}

}
