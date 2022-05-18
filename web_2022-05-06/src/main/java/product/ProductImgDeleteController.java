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

@WebServlet("/product/img_delete")
public class ProductImgDeleteController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("productId") == null) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			
			return;
		}
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		ProductInfoDao dao = new ProductInfoDao();
		ProductInfo productInfo = dao.selectProductById(productId);		
		String path = request.getRealPath(productInfo.getProductImg());
		
		int status = dao.deleteImg(productId);		
		
		File file = new File("/shoppingmall/images/product/"+path);
		file.delete();
		
		response.setStatus(status);
	}

}
