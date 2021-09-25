package kr.ac.kopo.report.vo;

public class ReportVO {
	//하나로 통장 user 정보
	private String userCode;
	private String name;
	private String email;
	private String accountNo;
	
	
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	@Override
	public String toString() {
		return "ReportVO [userCode=" + userCode + ", name=" + name + ", email=" + email + ", accountNo=" + accountNo
				+ "]";
	}
	
	
	
}
