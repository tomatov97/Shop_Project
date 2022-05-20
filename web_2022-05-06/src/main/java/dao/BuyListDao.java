package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import etc.Database;
import vo.BuyInfo;

public class BuyListDao {
	public boolean insertBuyInfo(BuyInfo buyInfo) {
		Database db = new Database();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			// 3. 쿼리 작성
			String sql = "INSERT INTO buyList(`paymentMethod`, `member_idx`, `product_idx`, `buyDate`) VALUES(?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buyInfo.getPaymentMethod());
			pstmt.setInt(2, buyInfo.getMemberIdx());
			pstmt.setInt(3, buyInfo.getProductId());
			pstmt.setString(4, buyInfo.getBuyDate().toString());
			
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
}
