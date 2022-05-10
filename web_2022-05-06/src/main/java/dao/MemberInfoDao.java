package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

import etc.Database;
import vo.MemberInfo;

public class MemberInfoDao {

	public boolean insertMemberInfo(MemberInfo newMemberInfo) {
		Database db = new Database();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			// 3. 쿼리 작성
			String sql = "INSERT INTO memberInfo(`id`, `pw`, `name`, `tel`, `addr`, `email`,`joinDate`) VALUES(?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newMemberInfo.getId());
			pstmt.setString(2, newMemberInfo.getPw());
			pstmt.setString(3, newMemberInfo.getName());
			pstmt.setString(4, newMemberInfo.getTel());
			pstmt.setString(5, newMemberInfo.getAddr());
			pstmt.setString(6, newMemberInfo.getEmail());
			pstmt.setString(7, newMemberInfo.getJoinDate().toString());
			
			// 4. stmt 를 통해서 쿼리 실행 및 결과 전달
			int count = pstmt.executeUpdate();
			
			return count == 1;
		} catch (SQLException e) {
			e.printStackTrace();
			
			return false;
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
	}
	
	public MemberInfo selectMemberById(String id) {
		Database db = new Database();		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		MemberInfo memberInfo = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM memberInfo WHERE id=?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int idx = rs.getInt("idx");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String tel = rs.getString("tel");
				String addr = rs.getString("addr");
				String email = rs.getString("email");
				String t_joinDate = rs.getString("joinDate");
				System.out.println("joinDate => " + t_joinDate);
				// t_joinDate에서 밀리초를 떼기
				t_joinDate = t_joinDate.substring(0, 19);
				System.out.println("joinDate => " + t_joinDate);
				
				t_joinDate = t_joinDate.replace(' ', 'T');
				System.out.println("joinDate => " + t_joinDate);
				LocalDateTime joinDate = LocalDateTime.parse(t_joinDate);
				
				memberInfo = new MemberInfo(idx, id, pw, name, tel, addr, email, joinDate);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		return memberInfo;
	}
	
	public MemberInfo selectMemberByTel(String tel) {
		Database db = new Database();		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		MemberInfo memberInfo = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM memberInfo WHERE tel=?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tel);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int idx = rs.getInt("idx");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String id = rs.getString("id");
				String addr = rs.getString("addr");
				String email = rs.getString("email");
				String t_joinDate = rs.getString("joinDate");
				LocalDateTime joinDate = LocalDateTime.parse(t_joinDate);
				
				memberInfo = new MemberInfo(idx, id, pw, name, tel, addr, email, joinDate);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		return memberInfo;
	}
	
	public MemberInfo selectMemberByEmail(String email) {
		Database db = new Database();		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		MemberInfo memberInfo = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM memberInfo WHERE email=?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int idx = rs.getInt("idx");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String tel = rs.getString("tel");
				String addr = rs.getString("addr");
				String id = rs.getString("id");
				String t_joinDate = rs.getString("joinDate");
				LocalDateTime joinDate = LocalDateTime.parse(t_joinDate);
				
				memberInfo = new MemberInfo(idx, id, pw, name, tel, addr, email, joinDate);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		return memberInfo;
	}
	
	public void updateById(MemberInfo memberInfo) {
		Database db = new Database();		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			// 3. 쿼리 작성
			String sql = "UPDATE memberInfo SET pw=?, name=?, tel=?, addr=?, email=? WHERE id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(6, memberInfo.getId());
			pstmt.setString(1, memberInfo.getPw());
			pstmt.setString(2, memberInfo.getName());
			pstmt.setString(3, memberInfo.getTel());
			pstmt.setString(4, memberInfo.getAddr());
			pstmt.setString(5, memberInfo.getEmail());
			
			// 4. stmt 를 통해서 쿼리 실행 및 결과 전달
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}		
	}
	
	public void deleteMemberInfoById(String id) {
		Database db = new Database();		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			// 3. 쿼리 작성
			String sql = "DELETE FROM memberInfo WHERE id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
	}
	
}
