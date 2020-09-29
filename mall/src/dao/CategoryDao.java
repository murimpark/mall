package dao;
import java.util.ArrayList;
import java.sql.*;
import vo.*;
import commons.*;
public class CategoryDao {
	//Category 목록 메서드
	public ArrayList<Category> selectCategoryList() throws Exception {
		ArrayList<Category> list = new  ArrayList<Category>();
		DBUtil dbUtil = new DBUtil();
		Connection conn =dbUtil.getConnection();
		
		String sql = "SELECT category_id, category_name FROM category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			list.add(category);
		}
		conn.close();
		return list;
	}
	public ArrayList<Category> selectCategoryCkList() throws Exception {
		ArrayList<Category> list = new  ArrayList<Category>();
		DBUtil dbUtil = new DBUtil();
		Connection conn =dbUtil.getConnection();
		
		String sql = "SELECT category_id, category_pic FROM category WHERE category_ck='Y' LIMIT 0,4";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryPic(rs.getString("category_pic"));
			list.add(category);
		}
		conn.close();
		return list;
	}
}
