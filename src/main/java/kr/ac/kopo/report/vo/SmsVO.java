package kr.ac.kopo.report.vo;

public class SmsVO {
	private String name;
	private String tel;
	private String accountNo;
	private String category;
	private int penaltyMoney;		
	
	private int logCode;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
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

	public int getPenaltyMoney() {
		return penaltyMoney;
	}

	public void setPenaltyMoney(int penaltyMoney) {
		this.penaltyMoney = penaltyMoney;
	}

	public int getLogCode() {
		return logCode;
	}

	public void setLogCode(int logCode) {
		this.logCode = logCode;
	}

	@Override
	public String toString() {
		return "SmsVO [name=" + name + ", tel=" + tel + ", accountNo=" + accountNo + ", category=" + category
				+ ", penaltyMoney=" + penaltyMoney + ", logCode=" + logCode + "]";
	}
	
	
}
