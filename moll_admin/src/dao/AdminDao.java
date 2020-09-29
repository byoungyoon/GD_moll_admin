package dao;

import java.sql.*;
import vo.*;
import commons.*;
import java.util.ArrayList;

public class AdminDao {
		// ������ ���̵� �´��� Ȯ���ϴ� �޼���
		public Admin selectAdminLogin(Admin admin) throws Exception{
			Admin returnLogin = null;
			
			// �����ͺ��̽��� �޼ҵ�� ȣ��(Connection�� ��°����� ����)
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
