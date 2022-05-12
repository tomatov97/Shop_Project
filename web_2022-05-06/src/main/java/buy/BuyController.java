package buy;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BuyListDao;
import dao.ProductInfoDao;
import vo.BuyInfo;
import vo.ProductInfo;

/**
 * Servlet implementation class BuyController
 */
@WebServlet("/buy")
public class BuyController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request.getParameter를 하기 전에 인코딩을 해줘야 한다!
		request.setCharacterEncoding("UTF-8");
		if (request.getParameter("memberId") == null || request.getParameter("productId")==null) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}		
		String paymentMethod = request.getParameter("paymentMethod");
		int memberId = Integer.parseInt(request.getParameter("memberId"));
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		ProductInfoDao productInfoDao = new ProductInfoDao();
		ProductInfo productInfo = productInfoDao.selectProductById(productId);
		if (productInfo.getStock() <= 0) {
			response.setStatus(HttpServletResponse.SC_FORBIDDEN);
			return;
		}
		
		BuyInfo buyInfo = new BuyInfo(paymentMethod, memberId, productId, LocalDateTime.now());
		
		BuyListDao buyListDao = new BuyListDao();
		productInfoDao.decreaseStock(productId);
		boolean result = buyListDao.insertBuyInfo(buyInfo);		
		response.setStatus(HttpServletResponse.SC_OK);
		}
}

