
package action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member_join_typecheck.do")
public class Member_Join_TypeCheck_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입 페이지 이동하기전에 할일있으면 여기서함
		
		RequestDispatcher disp = request.getRequestDispatcher("member/member_join_typecheck.jsp");
		disp.forward(request, response);
	}

}
