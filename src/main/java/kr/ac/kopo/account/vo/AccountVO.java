package kr.ac.kopo.account.vo;

public class AccountVO {
	private String accountNo;
	private String accountPwd;
	private String accountOwner;
	private int balance;
	private String accountType;
	private String nickname;
	private String openAccDate;
	private String bankCode;

	
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getAccountPwd() {
		return accountPwd;
	}
	public void setAccountPwd(String accountPwd) {
		this.accountPwd = accountPwd;
	}
	public String getAccountOwner() {
		return accountOwner;
	}
	public void setAccountOwner(String accountOwner) {
		this.accountOwner = accountOwner;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getOpenAccDate() {
		return openAccDate;
	}
	public void setOpenAccDate(String openAccDate) {
		this.openAccDate = openAccDate;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	
	@Override
	public String toString() {
		return "AccountVO [accountNo=" + accountNo + ", accountPwd=" + accountPwd + ", accountOwner=" + accountOwner
				+ ", balance=" + balance + ", accountType=" + accountType + ", nickname=" + nickname + ", openAccDate="
				+ openAccDate + ", bankCode=" + bankCode + "]";
	}

	
		
	
}
