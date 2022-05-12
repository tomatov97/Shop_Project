package vo;

public class ProductInfo {
	int productId;
	String productName;
	String category;
	int stock;
	int price;
	String productImg;
	
	public ProductInfo(String productName, String category, int stock, int price, String productImg) {
		this(0, productName, category, stock, price, productImg);
	}
	
	public ProductInfo(int productId, String productName, String category, int stock, int price, String productImg) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.category = category;
		this.stock = stock;
		this.price = price;
		this.productImg = productImg;
	}

	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
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
