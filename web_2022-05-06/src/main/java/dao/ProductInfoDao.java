package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import etc.Database;
import vo.ProductInfo;

public class ProductInfoDao {
	public boolean insertProductInfo(ProductInfo newProductInfo) {
		Database db = new Database();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			// 3. 쿼리 작성
			String sql = "INSERT INTO productInfo(`productName`, `category`, `stock`, `price`, `productImg`) VALUES(?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newProductInfo.getProductName());
			pstmt.setString(2, newProductInfo.getCategory());
			pstmt.setInt(3, newProductInfo.getStock());
			pstmt.setInt(4, newProductInfo.getPrice());
			pstmt.setString(5, newProductInfo.getProductImg());
			
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
