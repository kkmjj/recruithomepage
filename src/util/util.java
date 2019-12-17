package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class util {

	public static Connection getConnection() {
		try {
			String dbURL ="jdbc:mysql://localhost:3306/recruit";
			String dbID ="root";
			String dbPassword ="root";
			System.out.print("성공");
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(dbURL,dbID,dbPassword);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		System.out.print("연결 실패 ");
		return null;
	}
	
	
	
}
