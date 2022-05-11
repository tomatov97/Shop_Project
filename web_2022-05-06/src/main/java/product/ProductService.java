package product;

import dao.ProductInfoDao;
import vo.ProductInfo;

public class ProductService {
	public int insert(ProductInfo productInfo) {
		ProductInfoDao dao = new ProductInfoDao();
		
		boolean result = dao.insertProductInfo(productInfo);
		
		if (result) {
			return 200;
		} else {
			return 409;
		}
	}
}
