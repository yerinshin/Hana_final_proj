package kr.ac.kopo.dashBoard.vo;

public class MonthlyBudgetVO {
	
	private String accountNo;	//
	private int fixedExpense;	// total 한달 고정출금비 
	private int consumption;	// 설정 한달 소비 예산
	private int saving;			// 설정 한달 저축 예산
	private int ageGroup;		// 연령대
	
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public int getFixedExpense() {
		return fixedExpense;
	}
	public void setFixedExpense(int fixedExpense) {
		this.fixedExpense = fixedExpense;
	}
	public int getConsumption() {
		return consumption;
	}
	public void setConsumption(int consumption) {
		this.consumption = consumption;
	}
	public int getSaving() {
		return saving;
	}
	public void setSaving(int saving) {
		this.saving = saving;
	}
	
	public int getAgeGroup() {
		return ageGroup;
	}
	public void setAgeGroup(int ageGroup) {
		this.ageGroup = ageGroup;
	}
	
	@Override
	public String toString() {
		return "MonthlyBudgetVO [accountNo=" + accountNo + ", fixedExpense=" + fixedExpense + ", consumption="
				+ consumption + ", saving=" + saving + ", ageGroup=" + ageGroup + "]";
	}
	
	
}
