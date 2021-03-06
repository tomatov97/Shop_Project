package product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductInfoDao;
import vo.ProductInfo;


@WebServlet("/product/list")
public class ProductListController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		
		ProductInfoDao dao = new ProductInfoDao();
		int amount = dao.getAmountOfProduct();
		int startIndex = (pageNumber-1)*8;
		if (startIndex >= amount) {
			response.setStatus(HttpServletResponse.SC_NO_CONTENT);
		}
		
		List<ProductInfo> productInfoList = dao.selectProductListInfo(pageNumber);
		request.setAttribute("productList", productInfoList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/shop/product_list.jsp");
		rd.forward(request, response);
	}

}
