package action.member;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member_logout.do")
public class Member_Logout_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		Enumeration names = session.getAttributeNames();
		
		while(names.hasMoreElements()) {
			String name = names.nextElement().toString();
			String value = session.getAttribute(name).toString();
			System.out.println("제거할 세션 name 값 : " + name + ", 제거할 세션 value 값 : " + value);
		}
		
		session.invalidate(); // 세션 저장된 값 전부 제거
		
		if ( request.isRequestedSessionIdValid() == false ) {
			System.out.println("< 세션에 저장된 값이 모두 제거되었습니다 >");
		}
		
		response.sendRedirect("product_list_input.do");
	}

}
