package dao;

import vo.*;
import commons.*;
import java.sql.*;
import java.util.ArrayList;

public class MemberDao {
	// 멤버 화원가입 폼
	public void insertMember(Member member) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "INSERT INTO member(member_email, member_pw, member_name, member_date) VALUES (?,?,?,NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
	// Member 회원인지 아닌지 검사
	public Member selectMemberLogin(Member member) throws Exception{
		Member returnMember = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select member_email from member where member_email=? AND member_pw=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			returnMember = new Member();
			
			returnMember.setMemberEmail(rs.getString("member_email"));
		}
		
		conn.close();
		
		return returnMember;
	}
	
	// 아이디 중복 (union으로 묶어야함 아직 안함)
	public Member selectMemberCk(Member member) throws Exception{
		Member returnMember = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select member_email from member where member_email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, member.getMemberEmail());
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			returnMember = new Member();
			
			returnMember.setMemberEmail(rs.getString("member_email"));
		}
		return returnMember;
	}
	
	// 공지 전체 목록 출력
	public ArrayList<Member> selectMemberList() throws Exception{
		ArrayList<Member> list = new ArrayList<Member>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT member_email, member_name, member_date FROM member";
		PreparedStatement stmt = conn.prepareStatement(sql);
			
		ResultSet rs = stmt.executeQuery();
			
		while(rs.next()) {
			Member member = new Member();

			member.setMemberEmail(rs.getString("member_email"));
			member.setMemberName(rs.getString("member_name"));
			member.setMemberDate(rs.getString("member_date"));
				
			list.add(member);
		}
			
			conn.close();
			
			return list;
		}
}






















