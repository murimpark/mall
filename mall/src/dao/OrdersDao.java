package dao;
import vo.*;
import commons.*;
import java.util.*;
import java.sql.*;
/*
 * Orders의 데이터 액세스 오브젝트 (DAO)
 */
public class OrdersDao {
	public ArrayList<OrdersAndProduct> selectOrdersListByEmail(String memberEmail) throws Exception {
		ArrayList<OrdersAndProduct> list = new  ArrayList<OrdersAndProduct>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name FROM orders AS o INNER JOIN product AS p ON o.product_id = p.product_id where member_email = ?";		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setNString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.orders = new Orders();
			oap.product = new Product();
			oap.orders.setOrdersId(rs.getInt("o.orders_id"));
			oap.orders.setProductId(rs.getInt("o.product_id"));
			oap.orders.setOrdersAmount(rs.getInt("o.orders_amount"));
			oap.orders.setOrdersPrice(rs.getInt("o.orders_price"));
			oap.orders.setMemberEmail(rs.getString("o.member_email"));
			oap.orders.setOrdersAddr(rs.getString("o.orders_addr"));
			oap.orders.setOrdersState(rs.getString("o.orders_state"));
			oap.orders.setOrdersDate(rs.getString("o.orders_date"));
			
			oap.product.setProductName(rs.getString("p.product_name"));
			
			list.add(oap);
		}
		conn.close();
		return list;
	}
	
	public void insertOrders(Orders orders) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "INSERT INTO orders(product_id, orders_amount, orders_price, member_email, orders_addr, orders_date) values(?,?,?,?,?,now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orders.getProductId());
		stmt.setInt(2, orders.getOrdersAmount());
		stmt.setInt(3, orders.getOrdersPrice());
		stmt.setString(4, orders.getMemberEmail());
		stmt.setString(5, orders.getOrdersAddr());
		stmt.executeUpdate();
		conn.close();
	}
	
}