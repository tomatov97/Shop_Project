package vo;

public class ProductInfo {
	String productName;
	String category;
	int stock;
	int price;
	String productImg;
	
	public ProductInfo(String productName, String category, int stock, int price, String productImg) {
		super();
		this.productName = productName;
		this.category = category;
		this.stock = stock;
		this.price = price;
		this.productImg = productImg;
	}
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProductImg() {
		return productImg;
	}
	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}
}
