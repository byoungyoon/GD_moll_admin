package dao;

import java.util.ArrayList;

import commons.DBUtil;

import java.sql.*;
import vo.*;

public class ProductDao {
	public void updateImage(Product product) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "UPDATE product SET product_pic=? WHERE product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, product.getProductPic());
		stmt.setInt(2, product.getProductId());
		
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
	public void deleteProductList(Product product) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "DELETE FROM product WHERE product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, product.getProductId());
		
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
	public void updateProductList(Product product) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "UPDATE product SET product_name=?, product_content=?, product_price=? WHERE product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, product.getProductName());
		stmt.setString(2, product.getProductContent());
		stmt.setInt(3, product.getProductPrice());
		stmt.setInt(4, product.getProductId());
		
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
	public void updateProductSoldout(int productId, String productSoldout) throws Exception{
		// 데이터베이스를 메소드로 호출(Connection을 출력값으로 받음)
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "UPDATE product SET product_soldout = ? WHERE product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		if(productSoldout.equals("Y")) stmt.setString(1, "N");
		else stmt.setString(1, "Y");
		stmt.setInt(2, productId);
		
		int row = stmt.executeUpdate();
		// System.out.println(row + "행 변경");
		
		stmt.executeLargeUpdate();
		
		conn.close();
		}
	
	public CategoryAndProduct selectProductOne(CategoryAndProduct cap) throws Exception{
		CategoryAndProduct returnCap = null;
		
		// 데이터베이스를 메소드로 호출(Connection을 출력값으로 받음)
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		/*
		 * SELECT
		 * p.product_id, c.category_name, p.product_name, p.product_price, p.product_content,
		 * p.product_soldout, p.product_pic
		 * FROM
		 * product p inner join category c
		 * ON
		 * c.category_id = p.category_id
		 * WHERE
		 * p.product_id = ?
		 */
		
		String sql = "SELECT p.product_id, c.category_id, c.category_name, p.product_name, p.product_price, p.product_content, p.product_soldout, p.product_pic FROM product p inner join category c ON c.category_id = p.category_id WHERE p.product_id = ?"; 
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		System.out.println(cap.product.getProductId());
		
		stmt.setInt(1, cap.product.getProductId());
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			returnCap = new CategoryAndProduct();
			returnCap.category = new Category();
			returnCap.product = new Product();
			
			returnCap.product.setProductId(rs.getInt("product_id"));
			returnCap.category.setCategoryId(rs.getInt("category_id"));
			returnCap.category.setCategoryName(rs.getString("category_name"));
			returnCap.product.setProductName(rs.getString("product_name"));
			returnCap.product.setProductContent(rs.getString("product_content"));
			returnCap.product.setProductPrice(rs.getInt("product_price"));
			returnCap.product.setProductSoldout(rs.getString("product_soldout"));
			returnCap.product.setProductPic(rs.getString("product_pic"));
		}
		
		conn.close();
		
		return returnCap;
	}
	
	public void insertProduct(Product product) throws Exception{
		// 데이터베이스를 메소드로 호출(Connection을 출력값으로 받음)
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		/*
		 * INSERT INTO
		 * product(category_id, product_name, product_content, product_price, product_soldout)
		 * VALUES
		 * (?,?,?,?,?)
		 */
		
		String sql = "INSERT INTO product(category_id, product_name, product_content, product_price, product_soldout) VALUES(?,?,?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, product.getCategoryId());
		stmt.setString(2, product.getProductName());
		stmt.setString(3, product.getProductContent());
		stmt.setInt(4, product.getProductPrice());
		stmt.setString(5, product.getProductSoldout());
		
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
	// prouduct 데이터베이스를 다 출력
	public ArrayList<Product> selectProductList() throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		
		// 데이터베이스를 메소드로 호출(Connection을 출력값으로 받음)
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		/*
		 * SELECT
		 * product_id, category_id, product_name, product_price, product_content, product_soldout
		 * FROM
		 * product
		 * */
		
		String sql = "SELECT product_id, category_id, product_name, product_price, product_soldout FROM product";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductSoldout(rs.getString("product_soldout"));
			product.setCategoryId(rs.getInt("category_id"));
			
			list.add(product);
		}
		
		conn.close();
		
		return list;
	}
	
	// product 데이터베이스에서 선택한 것만 출력
	public ArrayList<Product> selectProductName(int categoryId) throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		
		// 데이터베이스를 메소드로 호출(Connection을 출력값으로 받음)
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		/*
		 * SELECT
		 * product_id, category_id, product_name, product_price, product_content, product_soldout
		 * FROM
		 * product
		 * WHERE 
		 * category_id=?
		 */
		
		String sql = "SELECT product_id, category_id, product_name, product_price, product_soldout FROM product WHERE category_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, categoryId);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Product product = new Product();
			product.setProductId(rs.getInt("product_id"));
			product.setProductName(rs.getString("product_name"));
			product.setProductPrice(rs.getInt("product_price"));
			product.setProductSoldout(rs.getString("product_soldout"));
			product.setCategoryId(rs.getInt("category_id"));
			
			list.add(product);
		}
		
		conn.close();
		
		return list;
	}
}
