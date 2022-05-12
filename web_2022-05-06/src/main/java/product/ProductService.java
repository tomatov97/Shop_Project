package product;

import java.util.ArrayList;
import java.util.List;

import dao.ProductInfoDao;
import dao.ProductInfoDao;
import vo.ProductInfo;
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
	
	public String loadProductListToJson (int pageNumber) {
		ProductInfoDao dao = new ProductInfoDao();
		List<ProductInfo> productInfoList = dao.selectProductListInfo(pageNumber);
		List<String> productTempList = new ArrayList<>();
		int amount = dao.getAmountOfProduct();
		
		for(ProductInfo productInfo : productInfoList) {
			String productName = productInfo.getProductName();
			String category = productInfo.getCategory();
			int stock = productInfo.getStock();
			int price = productInfo.getPrice();
			String productImg = productInfo.getProductImg();
			String product = "{\"productName\":" + productName + ", \"category\":\"" + category + "\",\"stock\":\"" + stock +  "\",\"price\":\"" + price + "\", \"productImg\":\"" + productImg + "\"}";
			productTempList.add(product);
		}
		String data = "{\"productList\":" + productTempList + ", \"amount\":" + amount + "}";

		return data;
	}
	
	public String loadProductByIdToJson(int productId) {
		ProductInfoDao dao = new ProductInfoDao();
		ProductInfo productInfo = dao.selectProductById(productId);
		String data = null;
		
		if(productInfo != null) {
			data = "{\"productName\": \"" + productInfo.getProductName() + "\", \"category\":\"" + productInfo.getCategory()+ "\", \"stock\":\"" + productInfo.getStock()+"\", \"price\":\"" + productInfo.getPrice()+"\", \"productImg\":\"" + productInfo.getProductImg()+"\"}";
		}		
		
		return data;
	}
}
