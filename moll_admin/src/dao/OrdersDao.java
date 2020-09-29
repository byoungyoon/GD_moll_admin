package dao;

import java.util.ArrayList;

import commons.DBUtil;
import vo.*;
import java.sql.*;

public class OrdersDao {
	// 전체를 출력하는 메서드
	public ArrayList<OrdersAndProduct> selectOrdersList() throws Exception{
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		
		// 데이터베이스를 메소드로 호출(Connection을 출력값으로 받음)
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		/*
		 * SELECT 
		 * o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email,
		 * o.orders_addr, o.orders_state, o.orders_date, p.product_name
		 * FROM
		 * orders o inner join product p 
		 * ON 
		 * o.product_id = p.product_id
		 * */
		
		String sql = "SELECT o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name FROM orders o inner join product p ON o.product_id = p.product_id ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.orders = new Orders();
			oap.product = new Product();
			
			oap.orders.setOrdersId(rs.getInt("o.orders_id"));
			oap.product.setProductName(rs.getString("p.product_name"));
			oap.orders.setOrdersAmount(rs.getInt("o.orders_amount"));
			oap.orders.setOrdersPrice(rs.getInt("o.orders_price"));
			oap.orders.setMemberEmail(rs.getString("o.member_email"));
			oap.orders.setOrdersAddr(rs.getString("o.orders_addr"));
			oap.orders.setOrdersState(rs.getString("o.orders_state"));
			oap.orders.setOrdersDate(rs.getString("o.orders_date"));

			
			list.add(oap);
		}
		
		conn.close();
		
		return list;
	}
	
	// 선택값을 선택하였을때 출력하는 메서드
	public ArrayList<OrdersAndProduct> selectOrdersListByState(String ordersState) throws Exception{
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		
		// 데이터베이스를 메소드로 호출(Connection을 출력값으로 받음)
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		/*
		 * SELECT 
		 * o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email,
		 * o.orders_addr, o.orders_state, o.orders_date, p.product_name
		 * FROM
		 * orders o inner join product p 
		 * ON 
		 * o.product_id = p.product_id
		 * WHERE
		 * o.orders_state LIKE ?
		 * */
		
		String sql = "SELECT o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name FROM orders o inner join product p ON o.product_id = p.product_id WHERE o.orders_state LIKE ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, "%" + ordersState + "%");
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.orders = new Orders();
			oap.product = new Product();
			
			oap.orders.setOrdersId(rs.getInt("orders_id"));
			oap.product.setProductName(rs.getString("p.product_name"));
			oap.orders.setOrdersAmount(rs.getInt("o.orders_amount"));
			oap.orders.setOrdersPrice(rs.getInt("o.orders_price"));
			oap.orders.setMemberEmail(rs.getString("o.member_email"));
			oap.orders.setOrdersAddr(rs.getString("o.orders_addr"));
			oap.orders.setOrdersState(rs.getString("o.orders_state"));
			oap.orders.setOrdersDate(rs.getString("o.orders_date"));
			
			list.add(oap);
		}
		
		conn.close();
		
		return list;
	}
	
	// 삭제의 체크를 눌렀을때 삭제가 되는 메서드
	public void deleteOrdersList(Orders orders) throws Exception{
		// 데이터베이스를 메소드로 호출(Connection을 출력값으로 받음)
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "DELETE FROM orders WHERE orders_id= ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		
		stmt.setInt(1, orders.getOrdersId());
		
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
	// 한개의 정보를 출력하는 메서드
	public OrdersAndProduct selectordersListOne(int ordersId) throws Exception{
		OrdersAndProduct oap = new OrdersAndProduct();
		
		oap.orders = new Orders();
		oap.product = new Product();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		/*
		 * SELECT 
		 * o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email,
		 * o.orders_addr, o.orders_state, o.orders_date, p.product_name
		 * FROM
		 * orders o inner join product p 
		 * ON 
		 * o.product_id = p.product_id
		 * WHERE
		 * o.orders_id = ?
		 * */
		
		String sql = "SELECT o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name FROM orders o inner join product p ON o.product_id = p.product_id WHERE o.orders_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1,ordersId);
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {			
			oap.orders.setOrdersId(rs.getInt("o.orders_id"));
			oap.product.setProductName(rs.getString("p.product_name"));
			oap.orders.setOrdersAmount(rs.getInt("o.orders_amount"));
			oap.orders.setOrdersPrice(rs.getInt("o.orders_price"));
			oap.orders.setMemberEmail(rs.getString("o.member_email"));
			oap.orders.setOrdersAddr(rs.getString("o.orders_addr"));
			oap.orders.setOrdersState(rs.getString("o.orders_state"));
			oap.orders.setOrdersDate(rs.getString("o.orders_date"));
		}
		
		//System.out.println(oap.orders.getOrdersId());
		
		conn.close();
		
		return oap;
	}
	
	// 업데이트 하는 메서드
	public void updateOrdersList(Orders orders) throws Exception{
		// 데이터베이스를 메소드로 호출(Connection을 출력값으로 받음)
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		/*
		 * UPDATE
		 * orders
		 * SET
		 * orders_amount=?, orders_price=?, member_email=?, orders_addr=?
		 * WHERE
		 * orders_id=?
		 */
		String sql = "UPDATE orders SET orders_amount=?, orders_price=?, member_email=?, orders_addr=? WHERE orders_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, orders.getOrdersAmount());
		stmt.setInt(2, orders.getOrdersPrice());
		stmt.setString(3, orders.getMemberEmail());
		stmt.setString(4, orders.getOrdersAddr());
		stmt.setInt(5, orders.getOrdersId());
		
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
}