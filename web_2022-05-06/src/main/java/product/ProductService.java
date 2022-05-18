package product;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

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
	
	public String loadProductListToJson (int pageNumber) {
		ProductInfoDao dao = new ProductInfoDao();
		List<ProductInfo> productInfoList = dao.selectProductListInfo(pageNumber);
		List<String> productTempList = new ArrayList<>();
		int amount = dao.getAmountOfProduct();
		
		for(ProductInfo productInfo : productInfoList) {
			int productId = productInfo.getProductId();
			String productName = productInfo.getProductName();
			String category = productInfo.getCategory();
			int stock = productInfo.getStock();
			int price = productInfo.getPrice();
			String productImg = productInfo.getProductImg();
			String product = "{\"productId\":"+ productId+ ", \"productName\":\"" + productName + "\", \"category\":\"" + category + "\",\"stock\":" + stock +  ",\"price\":" + price + ", \"productImg\":\"" + productImg + "\"}";
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
			data = "{\"productName\": \"(1)\", \"category\":\"(2)\", \"stock\":\"(3)\", \"price\":\"(4)\", \"productImg\":\"(5)\"}";
			data = data.replace("(1)", productInfo.getProductName());
			data = data.replace("(2)", productInfo.getCategory());
			data = data.replace("(3)", productInfo.getStock()+""); // String.valueOf() : 다른 데이터 타입을 문자열화. 그냥 데이터 + "" (빈문자열)로 문자열화 할 수도 있음 
			data = data.replace("(4)", productInfo.getPrice()+"");
			
			if (productInfo.getProductImg()==null) {
				data = data.replace("(5)", "");
			} else {
				data = data.replace("(5)", productInfo.getProductImg());
			}
			
			// data = "{\"productName\": \"" + productInfo.getProductName() + "\", \"category\":\"" + productInfo.getCategory()+ "\", \"stock\":\"" + productInfo.getStock()+"\", \"price\":\"" + productInfo.getPrice()+"\", \"productImg\":\"" + productInfo.getProductImg()+"\"}";
		}		
		
		return data;
	}
	
}
