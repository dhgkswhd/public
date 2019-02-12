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

@WebServlet("/member_update_output.do")
public class Member_Update_Output_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("utf-8");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		/* 일반회원, 사업자회원 공통 파라미터 */
		String 		 memberType = String.valueOf( session.getAttribute("memberType") ); // 세션에 저장되어있는 회원타입
		String 		 	     id = String.valueOf( request.getParameter("id") ); 		// 회원아이디
		String 		phoneNumber = request.getParameter("phonenumber");
		
		if ( memberType.equals("일반") ) {
			SellerVO vo = new SellerVO();
			vo.setSeller_id( id );
			vo.setSeller_phonenumber( phoneNumber );
			
			// 업데이트 쿼리문으로 go
			SellerDAO.getInstance().updateUserData( vo );
		}
		else if ( memberType.equals("사업자") ){
			BuyerVO vo = new BuyerVO();
			vo.setBuyer_id( id );
			vo.setBuyer_phonenumber( phoneNumber );
			vo.setBuyer_businessnumber( request.getParameter("businessnumber") );
			vo.setBuyer_mutualname( request.getParameter("mutualname") );
			
			// 업데이트 쿼리문으로 go 
			BuyerDAO.getInstance().updateUserData( vo );
		}
		
		response.sendRedirect("member_mypage_menu.do");
	}

}
