package dao;

import java.sql.*;
import vo.*;
import commons.*;
import java.util.ArrayList;

public class AdminDao {
		// 관리자 아이디 맞는지 확인하는 메서드
		public Admin selectAdminLogin(Admin admin) throws Exception{
			Admin returnLogin = null;
			
			// 데이터베이스를 메소드로 호출(Connection을 출력값으로 받음)
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			String sql = "SELECT admin_email FROM admin WHERE admin_email = ? AND admin_pw = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, admin.getAdminEmail());
			stmt.setString(2, admin.getAdminPw());
			
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) {			
				returnLogin = new Admin();
				returnLogin.setAdminEmail(rs.getString("admin_email"));
			}
			
			conn.close();
			
			return returnLogin;
		}
}
