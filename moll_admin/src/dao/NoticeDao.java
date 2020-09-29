package dao;

import java.sql.*;
import java.util.ArrayList;

import commons.*;
import vo.*;

public class NoticeDao {
	public void deleteNoticeList(Notice notice) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "DELETE FROM notice WHERE notice_id =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, notice.getNoticeId());
		
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
	public void updateNoticeList(Notice notice) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "UPDATE notice SET notice_title=?, notice_content = ? WHERE notice_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.setInt(3, notice.getNoticeId());
		
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
	public Notice selectNoticeOne(Notice notice) throws Exception{
		Notice returnNotice = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT notice_id, notice_title, notice_content, notice_date FROM notice WHERE notice_id =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, notice.getNoticeId());
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			returnNotice = new Notice();
			
			returnNotice.setNoticeId(rs.getInt("notice_id"));
			returnNotice.setNoticeTitle(rs.getString("notice_title"));
			returnNotice.setNoticeContent(rs.getString("notice_content"));
			returnNotice.setNoticeDate(rs.getString("notice_date"));
		}
		
		conn.close();
		
		return returnNotice;
	}
	
	public void insertNoticeList(Notice notice) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "INSERT INTO notice(notice_title,notice_content,notice_date) VALUES (?,?,NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	// 공지 전체 목록 출력
	public ArrayList<Notice> selectNoticeList() throws Exception{
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();

		String sql = "SELECT notice_id, notice_title, notice_date FROM notice";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Notice notice = new Notice();

			notice.setNoticeId(rs.getInt("notice_id"));
			notice.setNoticeTitle(rs.getString("notice_title"));
			notice.setNoticeDate(rs.getString("notice_date"));
			
			list.add(notice);
		}
		
		conn.close();
		
		return list;
	}
}
