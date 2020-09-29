package dao;

import java.util.ArrayList;

import commons.DBUtil;

import java.sql.*;
import vo.*;

public class CategoryDao {
	// image값 저장
	public void updateCategoryImage(Category category) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "UPDATE category SET category_pic=? WHERE category_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, category.getCategoryPic());
		stmt.setInt(2, category.getCategoryId());
		
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
	// Category를 추가하는 메소드
	public void insertCategory(Category category) throws Exception{
		String sql = "insert into category(category_name,category_Ck) values(?,?)";
		
		// 데이터베이스를 메소드로 호출(Connection을 출력값으로 받음)
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, category.getCategoryName());
		stmt.setString(2, category.getCategoryCk());
		
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
	// Category를 삭제하는 메소드
	public void deleteCategory(Category category) throws Exception{
		String sql = "DELETE FROM category WHERE category_id = ?";
		
		// 데이터베이스를 메소드로 호출(Connection을 출력값으로 받음)
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, category.getCategoryId());
		
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
	// Category를 수정하는 메소드
	public void updateCategory(Category category) throws Exception{
		String sql = "UPDATE category SET category_name = ?, category_ck = ? WHERE category_id=?";
		
		// 데이터베이스를 메소드로 호출(Connection을 출력값으로 받음)
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, category.getCategoryName());
		stmt.setString(2, category.getCategoryCk());
		stmt.setInt(3, category.getCategoryId());
		
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
	// 수정할때 그  value 추출
	public Category selectCategoryOne(Category category) throws Exception {
		Category returnCategory = null;
		
		String sql = "SELECT category_id, category_name, category_ck, category_pic FROM category WHERE category_id=?";
		
		// 데이터베이스 선언
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, category.getCategoryId());
		
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			returnCategory = new Category();
			
			returnCategory.setCategoryId(rs.getInt("category_id"));
			returnCategory.setCategoryName(rs.getString("category_Name"));
			returnCategory.setCategoryCk(rs.getString("category_ck"));
			returnCategory.setCategoryPic(rs.getString("category_pic"));
		}
			
		conn.close();
		
		return returnCategory;
	}
	
	// Category 목록
	public ArrayList<Category> selectCategoryList() throws Exception{
		//	데이터베이스의 값을 ResultSet 값이 아닌 배열의 값으로 저장하기 위한 변수
		ArrayList<Category> list = new ArrayList<Category>();
		
		String sql = "SELECT category_id, category_name, category_ck FROM category";
		
		// 데이터베이스 선언
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		PreparedStatement stmt = conn.prepareStatement(sql);
	
		ResultSet rs = stmt.executeQuery();
		
		
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			category.setCategoryCk(rs.getString("category_ck"));
				
			list.add(category);
		}
			
		conn.close();
		
		return list;
	}
}














