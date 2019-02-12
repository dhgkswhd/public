package service;

import java.sql.Connection;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBService {
	// single-ton pattern 싱글톤패턴
	// 이 클래스의 객체는 단 하나만 생성해서 운영하자
	DataSource ds; // 멤버변수
	
	// 내 객체 대입용 변수
	private static DBService single = null;
	
	public static DBService getInstance() {
		// 객체가 생성되지 않으면
		if ( single == null ) {
			single = new DBService();
		}
		return single;
	}
	
	
	
	// 유일한 하나의 생성자를 private로 만든다 = 외부에서 객체 생성 불가
	// 단, 이 클래스의 메서드인 getInstance() 에서는 호출 가능
	private DBService() {
		// 생성자에서 커넥션풀을 구한다.
		try {
			// context.xml
			InitialContext ic = new InitialContext();
			ds = (DataSource)ic.lookup("java:comp/env/jdbc/oracle_test");
		} catch (Exception e) {
			
		}
	}
	
	public Connection getConnection() {
		// ds(구해놓은 커넥션 풀)에서 커넥션을 획득하여 반환해주기
		Connection conn = null;
		try {
			conn = ds.getConnection();
		} catch (Exception e) { 
		
		}
		return conn;
	}
}







