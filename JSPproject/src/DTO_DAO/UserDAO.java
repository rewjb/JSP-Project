package DTO_DAO;

import java.sql.Connection;

public class UserDAO {

	Connection con;
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	
	
	private int DBconnectMethod() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			
			
			
			
			
			
			
			
			
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}// DBconnectMethod() : 메서드 종료

	

}
