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

// @WebServlet("/product/update")
public class ProductUpdateController2 extends HttpServlet {
	private static final int MAXIMUM_FILE_SIZE = 10 * 1024 * 1024;
	// 상품정보 추가, 수정과 같이 클라이언트가 multipart/form-data로 파라미터를 보내면
	// request로 파라미터를 꺼낼 수 없음
	// 반드시 request를 multipartRequest로 변환해야함
	
	// 상품 정보를 수정할 때, 이미지 파일은 그대로이고
	// 이름, 카테고리 등등만 수정하는 상황에서는 img 파라미터를 보내지 않기 때문에
	// DB의 상품 정보에 이미지 파일이 null이 됨
	// 해결 방법 : 이와 같은 상황에서는 img 파라미터에 기존의 img파일의 경로를 담아서 보내보록
	//           포스트맨에서는 쉽지만, html을 이용할 때는 어렵다
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 전달받은 값을 꺼낸다
		String path = request.getRealPath("images/product");
					
		MultipartRequest mr = new MultipartRequest(request, path, MAXIMUM_FILE_SIZE, "UTF-8", new DefaultFileRenamePolicy());
		if (mr.getParameter("productId") == null || mr.getParameter("stock") == null || mr.getParameter("price") == null) throw new BadParameterException();
		
		int productId = Integer.parseInt(mr.getParameter("productId"));
		String productName = mr.getParameter("productName");
		String category = mr.getParameter("category");
		if (category.equals("notebook")) category = "노트북";
		else if (category.equals("tablet")) category = "테블릿";
		else if	(category.equals("smartphone")) category = "스마트폰";
		int stock = Integer.parseInt(mr.getParameter("stock"));
		int price = Integer.parseInt(mr.getParameter("price"));
		// getFileName() 메서드 : 해당 파일이 실제로 저장되어 있는 이름을 꺼내준다.
		String productImg = mr.getFilesystemName("productImg");
		if (productImg == null) {
			productImg = mr.getParameter("productImg");
		}
		/*
		String t_insertDate = mr.getParameter("insertDate");
		
		t_insertDate = t_insertDate.substring(0, t_insertDate.indexOf('.'));
		t_insertDate = t_insertDate.replace(' ', 'T');
		LocalDateTime insertDate = LocalDateTime.parse(t_insertDate);
		*/
		
		// 2. 전달받은 값을 검증
		Validator validator = new Validator();
							
		if 		(!validator.productNameValidator(productName)) 	throw new BadParameterException();
		else if (!validator.categoryValidator(category)) 		throw new BadParameterException();
		else if (!validator.stockValidator(stock))				throw new BadParameterException();
		else if (!validator.priceValidator(price))				throw new BadParameterException();
		else if (!validator.productImgValidator(productImg))	throw new BadParameterException();
	
		ProductInfo ProductInfo = new ProductInfo(productId, productName, category, stock, price, productImg);
		ProductInfoDao dao = new ProductInfoDao();
		int status = dao.updateById(ProductInfo);
		
		response.setStatus(status);
	}

}
