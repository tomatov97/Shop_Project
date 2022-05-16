package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import etc.Database;
import vo.MemberInfo;
import vo.ProductInfo;
import vo.ProductInfo;

public class ProductInfoDao {
	public boolean insertProductInfo(ProductInfo newProductInfo) {
		Database db = new Database();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			// 3. 쿼리 작성
			String sql = "INSERT INTO productInfo(`productName`, `category`, `stock`, `price`, `productImg`, `insertDate`) VALUES(?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newProductInfo.getProductName());
			pstmt.setString(2, newProductInfo.getCategory());
			pstmt.setInt(3, newProductInfo.getStock());
			pstmt.setInt(4, newProductInfo.getPrice());
			pstmt.setString(5, newProductInfo.getProductImg());
			pstmt.setString(6, newProductInfo.getInsertDate().toString());
			
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
	
	public ProductInfo selectProductById(int id) {
		Database db = new Database();		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ProductInfo productInfo = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM productInfo WHERE productId=?";			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				int productId = id;
				String productName = rs.getString("productName");
				String category = rs.getString("category");
				int stock = rs.getInt("stock");
				int price = rs.getInt("price");
				String productImg = rs.getString("productImg");
				String t_insertDate = rs.getString("insertDate");
				
				t_insertDate = t_insertDate.substring(0, t_insertDate.indexOf('.'));
				t_insertDate = t_insertDate.replace(' ', 'T');
				LocalDateTime insertDate = LocalDateTime.parse(t_insertDate);

				productInfo = new ProductInfo(productId, productName, category, stock, price, productImg, insertDate);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		return productInfo;
	}
	
	public void deleteProductById(int id) {
		Database db = new Database();		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			// 3. 쿼리 작성
			String sql = "DELETE FROM productInfo WHERE productId=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
	}
	
	public int updateById(ProductInfo productInfo) {
		Database db = new Database();		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			// 3. 쿼리 작성
			String sql = "UPDATE productInfo SET productName=?, category=?, stock=?, price=?, productImg=? WHERE productId=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(6, productInfo.getProductId());
			pstmt.setString(1, productInfo.getProductName());
			pstmt.setString(2, productInfo.getCategory());
			pstmt.setInt(3, productInfo.getStock());
			pstmt.setInt(4, productInfo.getPrice());
			pstmt.setString(5, productInfo.getProductImg());
			
			// 4. stmt 를 통해서 쿼리 실행 및 결과 전달
			int count = pstmt.executeUpdate();
			if (count == 1) return 200;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}	
		return 400;
	} 
	
	public List<ProductInfo> selectProductListInfo(int pageNumber) {
		Database db = new Database();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<ProductInfo> ProductInfoList = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM productInfo ORDER BY productId DESC LIMIT ?, ? ";
			int amountPerPage = 8;
			int startIndex = (pageNumber-1)*amountPerPage;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndex);
			pstmt.setInt(2, amountPerPage);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int productId = rs.getInt("productId");
				String productName = rs.getString("productName");
				String category = rs.getString("category");
				int stock = rs.getInt("stock");
				int price = rs.getInt("price");
				String productImg = rs.getString("productImg");
				String t_insertDate = rs.getString("insertDate");
				
				t_insertDate = t_insertDate.substring(0, t_insertDate.indexOf('.'));
				t_insertDate = t_insertDate.replace(' ', 'T');
				LocalDateTime insertDate = LocalDateTime.parse(t_insertDate);
				
				ProductInfo nthProductInfo = new ProductInfo(productId, productName, category, stock, price, productImg, insertDate);
				
				ProductInfoList.add(nthProductInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closeResultSet(rs);
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		
		return ProductInfoList;
	}
	
	public int getAmountOfProduct() {
		Database db = new Database();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		
		int amount = 0;
		
		try {
			String sql = "SELECT COUNT(*) AS amount FROM productInfo";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			amount = rs.getInt("amount");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.closeResultSet(rs);
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}
		
		return amount;		
	}
	
	public int decreaseStock(int id) {
		Database db = new Database();		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			// 3. 쿼리 작성
			String sql = "UPDATE productInfo SET stock=stock-1 WHERE productId=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
					
			// 4. stmt 를 통해서 쿼리 실행 및 결과 전달
			int count = pstmt.executeUpdate();
			if (count == 1) return 200;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.closePstmt(pstmt);
			db.closeConnection(conn);
		}	
		return 400;
	}
}
