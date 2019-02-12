package dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.BuyerVO;
import vo.SellerVO;

public class SellerDAO {
	private static SellerDAO single = null;
	SqlSessionFactory factory = null;
	
	public static SellerDAO getInstance() {
		if ( single == null ) {
			single = new SellerDAO();
		}
		return single;
	}
	
	public SellerDAO() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	/**--- 회원가입 시 아이디 중복체크 (Seller) ---*/
	public boolean checkId ( String paramId ) {
		boolean result = true;
		String id;
		
		SqlSession sqlSession = factory.openSession();
		id = sqlSession.selectOne("seller.checkId", paramId.toLowerCase());
		
		if (id != null) {
			result = false;
		}
		
		sqlSession.close();
		
		return result;
	}
	
	/**--- 회원가입 (Seller) ---*/
	public void insertUserData ( SellerVO vo ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert( "seller.insertUserData", vo );
		sqlSession.commit();
		sqlSession.close();
	}
	
	
	/** --- 회원정보조회 (Seller) ---*/
	public String searchUserData ( Map<String, String> map ) {
		String resultId = "";
		
		SqlSession sqlSession = factory.openSession();
		resultId = sqlSession.selectOne( "seller.searchUserData", map );
		sqlSession.close();
		
		return resultId;
	}
	
	
	/** --- 로그인 (Seller) --- */
	public SellerVO getUserData ( Map<String, String> inputData ) {
		SqlSession sqlSession = factory.openSession();
		SellerVO vo = (SellerVO)sqlSession.selectOne( "seller.getUserData", inputData );
		sqlSession.close();
		
		// 회원정보가 없으면 null을 반환
		return vo;
	}
	
	/** --- 회원정보수정 (Seller) ---*/
	public void updateUserData ( SellerVO vo ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.update( "seller.updateUserData", vo );
		sqlSession.commit();
		sqlSession.close();
	}
	

	/** --- 비밀번호수정 (Seller) --- */
	public void updateUserPwd( SellerVO vo ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.update( "seller.updateUserPwd", vo );
		sqlSession.commit();
		sqlSession.close();
	}
	
	/**--- 새 비밀번호 획득 (Seller) --- */
	public String getUserPwd( SellerVO vo ) {
		SqlSession sqlSession = factory.openSession();
		String pwd = sqlSession.selectOne( "seller.getUserPwd", vo );
		sqlSession.close();
		
		return pwd;
	}
	
	/** --- 비밀번호찾기 (Seller) ---*/
	public String searchUserPwd ( Map<String, String> map ) {
		String resultPwd = "";
		
		SqlSession sqlSession = factory.openSession();
		resultPwd = sqlSession.selectOne( "seller.searchUserPwd", map );
		sqlSession.close();
		
		return resultPwd;
	}
	
	/** --- 현재 보유머니 가져옴 / 수정중 (Seller) --- */
	public int getSellerWallet( String seller_id ) {
		SqlSession sqlSession = factory.openSession();
		int memberWallet = (int)sqlSession.selectOne( "seller.getSellerWallet", seller_id );
		sqlSession.close();
		
		return memberWallet;
	}
	
	/** --- 거래가 완료되면 지갑에 돈 들어옴 (Seller) ---*/
	public void getMoney ( Map<String, Object> map ) {
		SqlSession sqlSession = factory.openSession();
		int res = sqlSession.update( "seller.getMoney", map );
		System.out.println("돈 넣어졌는지 결과값 : " + res);
		sqlSession.commit();
		sqlSession.close();
	}
	
	
	
	/**------------------------ 회원탈퇴 (일반회원 / 완료) ------------------------*/
	public void deleteUserData ( String id ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.delete( "seller.deleteUserData", id );
		sqlSession.commit();
		sqlSession.close();
	}
	
	/**------------------------ 탈퇴한 회원 연령대와 사유저장 (일반회원 / 완료) ------------------------*/
	public void insertLeavingReason ( Map<String, String> map ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert( "seller.insertLeavingReason", map );
		sqlSession.commit();
		sqlSession.close();
	}
	
}
