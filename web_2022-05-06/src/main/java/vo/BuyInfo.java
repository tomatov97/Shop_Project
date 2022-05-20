package vo;

import java.time.LocalDateTime;

public class BuyInfo {
	private String paymentMethod;
	private int memberIdx;
	private int productId;
	private LocalDateTime buyDate;
	
	public BuyInfo(String paymentMethod, int memberIdx, int productId, LocalDateTime buyDate) {
		super();
		this.paymentMethod = paymentMethod;
		this.memberIdx = memberIdx;
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
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberId(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	
}
