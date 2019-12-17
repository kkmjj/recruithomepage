package month;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import month.MonthDTO;
import util.util;


public class MonthDAO {


public ArrayList<String> show(int date) {
	
		ArrayList<String> company_list = new ArrayList<String>();
		
		String sql ="select company from month where date=?";
		Connection conn =null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		try {
			conn= util.getConnection();
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, date);
			rs= pstmt.executeQuery();
			
			//쿼리 실행
			while(rs.next())	// id가 존재하면
			{
				
				company_list.add(rs.getString(1));
				
			}
		
			
			
			
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
		return company_list;

		
	
	}
	
	
	
	
	
}
