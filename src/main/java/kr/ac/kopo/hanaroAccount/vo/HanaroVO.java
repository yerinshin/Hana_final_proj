package kr.ac.kopo.hanaroAccount.vo;

public class HanaroVO {
	
	private String accountNo;
	private int basicBalance;
	private int consumptionBalance;
	private int savingBalance;
	
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public int getBasicBalance() {
		return basicBalance;
	}
	public void setBasicBalance(int basicBalance) {
		this.basicBalance = basicBalance;
	}
	public int getConsumptionBalance() {
		return consumptionBalance;
	}
	public void setConsumptionBalance(int consumptionBalance) {
		this.consumptionBalance = consumptionBalance;
	}
	public int getSavingBalance() {
		return savingBalance;
	}
	public void setSavingBalance(int savingBalance) {
		this.savingBalance = savingBalance;
	}
	
	@Override
	public String toString() {
		return "HanaroAccountVO [accountNo=" + accountNo + ", basicBalance=" + basicBalance + ", consumptionBalance="
				+ consumptionBalance + ", savingBalance=" + savingBalance + "]";
	}
}
