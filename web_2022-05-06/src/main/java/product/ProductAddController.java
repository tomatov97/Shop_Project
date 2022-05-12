package product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import exception.BadParameterException;
import util.Validator;
import vo.ProductInfo;

@WebServlet("/product/add")
public class ProductAddController extends HttpServlet {
	private static final int MAXIMUM_FILE_SIZE = 10 * 1024 * 1024;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 1. 전달받은 값을 꺼낸다
			String path = request.getRealPath("images/product");
						
			MultipartRequest mr = new MultipartRequest(request, path, MAXIMUM_FILE_SIZE, "UTF-8", new DefaultFileRenamePolicy());
			if (mr.getParameter("stock") == null || mr.getParameter("price") == null) throw new BadParameterException();
			
			String productName = mr.getParameter("productName");
			String category = mr.getParameter("category");
			int stock = Integer.parseInt(mr.getParameter("stock"));
			int price = Integer.parseInt(mr.getParameter("price"));
			String productImg = mr.getFilesystemName("productImg");
			
			
			// 2. 전달받은 값을 검증
			Validator validator = new Validator();			
			if 		(!validator.productNameValidator(productName)) 	throw new BadParameterException();
			else if (!validator.categoryValidator(category)) 		throw new BadParameterException();
			else if (!validator.stockValidator(stock))				throw new BadParameterException();
			else if (!validator.priceValidator(price))				throw new BadParameterException();
			else if (!validator.productImgValidator(productImg))	throw new BadParameterException();
			
			// 3. 전달받은 값을 하나의 정보로 뭉친다
			ProductInfo newProductInfo = new ProductInfo(productName, category, stock, price, productImg);
			
			// 4. 새로운 상품의 정보를 DB에 저장한다
			ProductService service = new ProductService();
			// 5-1. 회원 가입에 성공했을 경우 성공 시그널 보냄
			int status = service.insert(newProductInfo);
			response.setStatus(status);
		
			
			// 5-2. 상품 등록에 실패했을 경우 실패 시그널 보냄
			//  - 파라미터가 규칙에 맞지 않을 때 : 400

		} catch (BadParameterException e) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
	}

}
