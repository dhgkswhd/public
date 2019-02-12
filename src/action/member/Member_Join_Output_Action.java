package action.member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BuyerDAO;
import dao.SellerDAO;
import vo.BuyerVO;
import vo.SellerVO;

@WebServlet("/member_join_output.do")
public class Member_Join_Output_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String membertype = request.getParameter("membertype"); // 회원가입유형 받아옴
		
		// 회원가입 일자구하기 (veiw에서 가입일자 가져와야할일 있을까봐 쿼리문에서 sysdate 안씀)
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		
		if ( membertype.equals("일반") ) {
			SellerVO vo = new SellerVO();
			vo.setSeller_id( request.getParameter("id") );
			vo.setSeller_pwd( request.getParameter("pwd") );
			vo.setSeller_phonenumber( request.getParameter("phone_number") );
			vo.setSeller_wallet( 0 ); // 회원가입시 지갑에 0원
			vo.setSeller_joindate( date.format(today) ); // 가입일자
			
			SellerDAO.getInstance().insertUserData( vo );
			
		} else if ( membertype.equals("사업자") ) {
			BuyerVO vo = new BuyerVO();
			vo.setBuyer_id( request.getParameter("id") );
			vo.setBuyer_pwd( request.getParameter("pwd") );
			vo.setBuyer_phonenumber( request.getParameter("phone_number") );
			vo.setBuyer_businessnumber( request.getParameter("b_number") );
			vo.setBuyer_mutualname( request.getParameter("b_mutualname") );
			vo.setBuyer_wallet( 300000 ); // 회원가입시 지갑에 30만원 넣어줌
			vo.setBuyer_joindate( date.format(today) ); // 가입일자
			
			BuyerDAO.getInstance().insertUserData( vo );
		} 
		
		response.sendRedirect("product_list_input.do");
	}

}
