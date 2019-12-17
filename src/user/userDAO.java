package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.util;


public class userDAO {

	
	public int login(String id, String userPassword) {
		
		String sql ="select userPassword from user where id=?";
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			conn= util.getConnection();
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			//쿼리 실행
			//System.out.print(rs.getString(0));
			if(rs.next())	// id가 존재하면
			{
				
				if(rs.getString(1).equals(userPassword))
				{
					return 1; // 비번 확인 
				}
				
				else
				{
					return 0;
				}
			}
			
			return -1; // 아이디가 존재 하지 않음 
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try { if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try { if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try { if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return -2;
		
	
	}
	
}
