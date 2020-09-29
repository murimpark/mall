package dao;
import vo.*;
import commons.DBUtil;
import java.sql.*;

public class MemberDao {
	public String login(Member member) throws Exception { // 로그인
		String memberEmail = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select member_email from member where member_email=? and member_pw=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) { // 로그인 성공
			memberEmail = rs.getString("member_email");
		}
		conn.close();
		return memberEmail;
	}
	
	public void insertMember(Member member) throws Exception { // 회원가입
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into member(member_email, member_pw, member_name, member_date) values(?,?,?,now())";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		stmt.executeLargeUpdate();
			
		conn.close();
	}
	
	public Member selectMemberEmailCk(String memberEmail) throws Exception {
		Member member = null; 
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select id from (select member_email id from member union select admin_id id from admin) t where id = ?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			member = new Member();
			member.setMemberEmail(rs.getString("id"));
		}
		conn.close();
		return member;
	}
}
