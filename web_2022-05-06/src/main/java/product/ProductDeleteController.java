package product;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductInfoDao;
import vo.ProductInfo;


@WebServlet("/product/delete")
public class ProductDeleteController extends HttpServlet{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("productId")==null) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		// 첨부파일이 있는 공지사항을 삭제하는 과정
		// 이미지를 가지고 있는 상품정보는 먼저 이미지를 삭제하고
		// DB에서 상품 정보를 삭제해야함
		
		// 회원 탈퇴
		ProductInfoDao dao = new ProductInfoDao();
		
		ProductInfo productInfo = dao.selectProductById(productId);
		if (productInfo.getProductImg()!=null) {
			File file = new File(productInfo.getProductImg());
			file.delete();
		}
				
		dao.deleteProductById(productId);
	}

}
