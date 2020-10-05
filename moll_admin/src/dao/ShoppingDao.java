package dao;

import java.sql.*;
import java.util.ArrayList;

import vo.*;
import commons.*;

public class ShoppingDao {
	// shopping 테이블 출력
	public ArrayList<Shopping> selectShoppingList() throws Exception{ 
		ArrayList<Shopping> list = new ArrayList<Shopping>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		/*
		 * SELECT
		 * shopping_id, member_email, product_id
		 * FROM
		 * shopping
		 */
		
		String sql = "SELECT shopping_id, member_email, product_id FROM shopping";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Shopping paramShopping = new Shopping();
			
			paramShopping.setShoppingId(rs.getInt("shopping_id"));
			paramShopping.setMemberEmail(rs.getString("member_email"));
			paramShopping.setProductId(rs.getInt("product_id"));
			
			list.add(paramShopping);
		}
		
		conn.close();
		
		return list;
	}
}
