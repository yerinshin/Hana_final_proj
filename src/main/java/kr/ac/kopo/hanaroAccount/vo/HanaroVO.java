package kr.ac.kopo.hanaroAccount.vo;

public class HanaroVO {
	
	private String accountNo;
	private int basicBalance;
	private int consumptionBalance;
	private int savingBalance;
	private String payDay;
	private int salary;
	
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
	
	public String getPayDay() {
		return payDay;
	}
	public void setPayDay(String payDay) {
		this.payDay = payDay;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	@Override
	public String toString() {
		return "HanaroVO [accountNo=" + accountNo + ", basicBalance=" + basicBalance + ", consumptionBalance="
				+ consumptionBalance + ", savingBalance=" + savingBalance + ", payDay=" + payDay + ", salary=" + salary
				+ "]";
	}

}
