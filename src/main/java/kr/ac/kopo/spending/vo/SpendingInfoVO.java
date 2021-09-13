package kr.ac.kopo.spending.vo;

public class SpendingInfoVO {
	private String accountNo;
	private String yearMonth;	//202108 ,202109
	private String category;
	private int spendingMoney;
	
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getYearMonth() {
		return yearMonth;
	}
	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getSpendingMoney() {
		return spendingMoney;
	}
	public void setSpendingMoney(int spendingMoney) {
		this.spendingMoney = spendingMoney;
	}
	@Override
	public String toString() {
		return "SpendingInfoVO [accountNo=" + accountNo + ", yearMonth=" + yearMonth + ", category=" + category
				+ ", spendingMoney=" + spendingMoney + "]";
	}
	

	
	

}
