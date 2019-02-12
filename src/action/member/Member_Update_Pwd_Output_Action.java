package action.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BuyerDAO;
import dao.SellerDAO;
import vo.BuyerVO;
import vo.SellerVO;

@WebServlet("/member_update_pwd_output.do")
public class Member_Update_Pwd_Output_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("utf-8");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		String memberType = String.valueOf( session.getAttribute("memberType") ); // 회원유형
		String         id = request.getParameter("id"); 		  				  // 회원아이디
		String 	changePwd = request.getParameter( "changePwd" ); 				  // 변경할 비밀번호
		String 	   newPwd = ""; 												  // 변경된 비밀번호를 저장할 변수
		
		// 기존비밀번호 세션에서 제거
		session.removeAttribute("memberPwd");
		
		if ( memberType.equals("일반") ) {
			SellerVO vo = new SellerVO();
			vo.setSeller_id( id ); 		   // 아이디와
			vo.setSeller_pwd( changePwd ); // 변경할 비밀번호 담아서 쿼리 go
			
			// 비밀번호 변경
			SellerDAO.getInstance().updateUserPwd( vo );
			
			// 새 비밀번호를 가져와서 newPwd 변수에 저장
			newPwd = SellerDAO.getInstance().getUserPwd( vo );
			
			
		} else if ( memberType.equals("사업자") ) {
			BuyerVO vo = new BuyerVO();
			vo.setBuyer_id( id ); 		  // 아이디와
			vo.setBuyer_pwd( changePwd ); // 변경할 비밀번호 담아서 쿼리 go
			
			// 비밀번호 변경
			BuyerDAO.getInstance().updateUserPwd( vo );
			
			// 새 비밀번호를 가져와서 newPwd 변수에 저장
			newPwd = BuyerDAO.getInstance().getUserPwd( vo );
		}
		
		// 새 비밀번호를 session에 저장
		session.setAttribute("memberPwd", newPwd);
		
		response.sendRedirect("member_mypage_menu.do");
	}

}
