package kr.ac.kopo.dashBoard.vo;

public class ProductSearchInfoVO {
	private String type;	//상품 종류(정기예금, 정기적금, 자유적금)
	private int age; 		//본인 나이
	private int savingMoney;	//적금 : 매달 저축금, 예금 : 예치금
	private int period;		//기간
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getSavingMoney() {
		return savingMoney;
	}
	public void setSavingMoney(int savingMoney) {
		this.savingMoney = savingMoney;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	@Override
	public String toString() {
		return "ProductSearchtInfoVO [type=" + type + ", age=" + age + ", savingMoney=" + savingMoney + ", period="
				+ period + "]";
	}
	

}
