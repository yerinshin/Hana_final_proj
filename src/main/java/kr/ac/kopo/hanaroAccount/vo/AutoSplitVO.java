package kr.ac.kopo.hanaroAccount.vo;

public class AutoSplitVO {
	
	private String accountNo;
	private int moneyToConsumption;
	private int moneyToSaving;
	private int splitDate;
	
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public int getMoneyToConsumption() {
		return moneyToConsumption;
	}
	public void setMoneyToConsumption(int moneyToConsumption) {
		this.moneyToConsumption = moneyToConsumption;
	}
	public int getMoneyToSaving() {
		return moneyToSaving;
	}
	public void setMoneyToSaving(int moneyToSaving) {
		this.moneyToSaving = moneyToSaving;
	}
	public int getSplitDate() {
		return splitDate;
	}
	public void setSplitDate(int splitDate) {
		this.splitDate = splitDate;
	}
	
	@Override
	public String toString() {
		return "AutoSplitVO [accountNo=" + accountNo + ", moneyToConsumption=" + moneyToConsumption + ", moneyToSaving="
				+ moneyToSaving + ", splitDate=" + splitDate + "]";
	}
	
	
}
