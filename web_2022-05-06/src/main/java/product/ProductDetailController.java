package product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exception.BadParameterException;

@WebServlet("/product/detail")
public class ProductDetailController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			if (request.getParameter("productId")==null) {
				throw new BadParameterException();
			}
			
			int productId = Integer.parseInt(request.getParameter("productId"));			
			ProductService service = new ProductService();			
			String data = service.loadProductByIdToJson(productId);
			
			if (data == null) {
				response.setStatus(HttpServletResponse.SC_NO_CONTENT);
			}		
			
			response.setContentType("application/json;charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.print(data);
			
			out.close();
		} catch (BadParameterException e) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
		
		
	}
}
