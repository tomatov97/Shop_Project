package vo;

import java.time.LocalDateTime;

public class BuyInfo {
	private String paymentMethod;
	private int memberId;
	private int productId;
	private LocalDateTime buyDate;
	
	public BuyInfo(String paymentMethod, int memberId, int productId, LocalDateTime buyDate) {
		super();
		this.paymentMethod = paymentMethod;
		this.memberId = memberId;
		this.productId = productId;
		this.buyDate = buyDate;
	}
	
	public LocalDateTime getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(LocalDateTime buyDate) {
		this.buyDate = buyDate;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	
}
