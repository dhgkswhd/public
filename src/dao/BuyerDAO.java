package dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.BuyerVO;
import vo.SellerVO;

public class BuyerDAO {
	private static BuyerDAO single = null;
	SqlSessionFactory factory = null;
	
	public static BuyerDAO getInstance() {
		if ( single == null ) {
			single = new BuyerDAO();
		}
		return single;
	}
	
	public BuyerDAO() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	/** --- 회원가입 시 아이디 중복체크 (Buyer) ---*/
	public boolean checkId ( String paramId ) {
		boolean result = true;
		String id;
		
		SqlSession sqlSession = factory.openSession();
		id = sqlSession.selectOne("buyer.checkId", paramId.toLowerCase());
		
		if (id != null) {
			result = false;
		}
		
		sqlSession.close();
		
		return result;
	}
	
	/** --- 회원가입 (Buyer) --- */
	public void insertUserData ( BuyerVO vo ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert( "buyer.insertUserData", vo );
		sqlSession.commit();
		sqlSession.close();
	}
	
	
	/** --- 회원정보조회 (Buyer) --- */
	public String searchUserData ( Map<String, String> map ) {
		String resultId = "";
		
		SqlSession sqlSession = factory.openSession();
		resultId = sqlSession.selectOne( "buyer.searchUserData", map );
		sqlSession.close();
		
		return resultId;
	}
	
	
	/** --- 로그인 (Buyer) --- */
	public BuyerVO getUserData ( Map<String, String> inputData ) {
		SqlSession sqlSession = factory.openSession();
		BuyerVO vo = (BuyerVO)sqlSession.selectOne( "buyer.getUserData", inputData );
		
		sqlSession.close();
		
		// 회원정보가 없으면 null을 반환한다.
		return vo;
	}
	
	/** --- 회원정보수정 (Buyer) --- */
	public void updateUserData ( BuyerVO vo ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.update( "buyer.updateUserData", vo );
		sqlSession.commit();
		sqlSession.close();
	}
	
	/** --- 비밀번호수정 (사업자회원 / 완료) --- */
	public void updateUserPwd( BuyerVO vo ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.update( "buyer.updateUserPwd", vo );
		sqlSession.commit();
		sqlSession.close();
	}
	
	/** --- 새 비밀번호 획득 (Buyer) --- */
	public String getUserPwd( BuyerVO vo ) {
		SqlSession sqlSession = factory.openSession();
		String pwd = sqlSession.selectOne( "buyer.getUserPwd", vo );
		sqlSession.close();
		
		return pwd;
	}
	
	/** --- 비밀번호찾기 (Buyer) --- */
	public String searchUserPwd ( Map<String, String> map ) {
		String resultPwd = "";
		
		SqlSession sqlSession = factory.openSession();
		resultPwd = sqlSession.selectOne( "buyer.searchUserPwd", map );
		sqlSession.close();
		
		return resultPwd;
	}
	
	/** --- 거래가 완료되면 지갑에서 돈 빼감 (Buyer) --- */
	public void dropMoney ( Map<String, Object> buyerMap ) {
		SqlSession sqlSession = factory.openSession();
		int res = sqlSession.update( "buyer.dropMoney", buyerMap );
		System.out.println("돈 빠졌는지 결과값 : " + res);
		sqlSession.commit();
		sqlSession.close();
	}
	
	

	/**------------------------ 회원탈퇴 (사업자회원 / 완료) ------------------------*/
	public void deleteUserData ( String id ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.delete( "buyer.deleteUserData", id );
		sqlSession.commit();
		sqlSession.close();
	}
	
	/**------------------------ 탈퇴한 회원 연령대와 사유저장 (사업자회원 / 완료) ------------------------*/
	public void insertLeavingReason ( Map<String, String> map ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert( "buyer.insertLeavingReason", map );
		sqlSession.commit();
		sqlSession.close();
	}

}
