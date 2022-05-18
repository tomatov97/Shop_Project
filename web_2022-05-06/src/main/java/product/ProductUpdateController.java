package product;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ProductInfoDao;
import exception.BadParameterException;
import util.Validator;
import vo.ProductInfo;

@WebServlet("/product/update")
public class ProductUpdateController extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 전달받은 값을 꺼낸다
		request.setCharacterEncoding("UTF-8");
		if (request.getParameter("productId") == null || request.getParameter("stock") == null || request.getParameter("price") == null) throw new BadParameterException();
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		String productName = request.getParameter("productName");
		String category = request.getParameter("category");		
		int stock = Integer.parseInt(request.getParameter("stock"));
		int price = Integer.parseInt(request.getParameter("price"));
		
		if (category.equals("notebook")) category = "노트북";
		else if (category.equals("tablet")) category = "테블릿";
		else if	(category.equals("smartphone")) category = "스마트폰";
		// 2. 전달받은 값을 검증
		Validator validator = new Validator();
							
		if 		(!validator.productNameValidator(productName)) 	throw new BadParameterException();
		else if (!validator.categoryValidator(category)) 		throw new BadParameterException();
		else if (!validator.stockValidator(stock))				throw new BadParameterException();
		else if (!validator.priceValidator(price))				throw new BadParameterException();
			
		ProductInfo ProductInfo = new ProductInfo(productId, productName, category, stock, price);
		ProductInfoDao dao = new ProductInfoDao();
		int status = dao.updateById(ProductInfo);
		
		response.setStatus(status);
	}

}
