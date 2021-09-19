package kr.ac.kopo.dashBoard.vo;

//상품 별 우대금리 VO
public class PreferentialRateVO {
	private String productName;		//상품 명
	private String condition;		//조건
	private double rate;			//우대금리
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	
	@Override
	public String toString() {
		return "preferentialRateVO [productName=" + productName + ", condition=" + condition + ", rate=" + rate + "]";
	} 
	
}
