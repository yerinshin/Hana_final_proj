package kr.ac.kopo.challenge.vo;

public class ChallengeVO {
	
	private int code;
	private String accountNo;
	private String category;
	private String title;
	private double penaltyRate;
	private int savingGoal;
	private int penaltyTotal;
	private int nowSpending;		//현재까지 사용 금액
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public double getPenaltyRate() {
		return penaltyRate;
	}
	public void setPenaltyRate(double penaltyRate) {
		this.penaltyRate = penaltyRate;
	}
	public int getSavingGoal() {
		return savingGoal;
	}
	public void setSavingGoal(int savingGoal) {
		this.savingGoal = savingGoal;
	}
	public int getPenaltyTotal() {
		return penaltyTotal;
	}
	public void setPenaltyTotal(int penaltyTotal) {
		this.penaltyTotal = penaltyTotal;
	}
	public int getNowSpending() {
		return nowSpending;
	}
	public void setNowSpending(int nowSpending) {
		this.nowSpending = nowSpending;
	}
	@Override
	public String toString() {
		return "ChallengeVO [code=" + code + ", accountNo=" + accountNo + ", category=" + category + ", title=" + title
				+ ", penaltyRate=" + penaltyRate + ", savingGoal=" + savingGoal + ", penaltyTotal=" + penaltyTotal
				+ ", nowSpending=" + nowSpending + "]";
	}
	

	
	
}
