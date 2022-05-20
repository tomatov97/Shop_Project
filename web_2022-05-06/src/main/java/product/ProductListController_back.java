package product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductInfoDao;


@WebServlet("/product/list/back")
public class ProductListController_back extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		
		ProductInfoDao dao = new ProductInfoDao();
		ProductService service = new ProductService();
		String data = service.loadProductListToJson(pageNumber);
		
		int amount = dao.getAmountOfProduct();
		int startIndex = (pageNumber-1)*8;
		if (startIndex >= amount) {
			response.setStatus(HttpServletResponse.SC_NO_CONTENT);
		}
		// JOSN을 전달한다.
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print(data);
		
		out.close();
	}

}
