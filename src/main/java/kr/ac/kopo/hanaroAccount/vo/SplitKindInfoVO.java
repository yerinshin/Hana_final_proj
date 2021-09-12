package kr.ac.kopo.hanaroAccount.vo;

public class SplitKindInfoVO {
	
	private String accountNo;
	private String splitKind;
	

	
	public SplitKindInfoVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SplitKindInfoVO(String accountNo, String splitKind) {
		super();
		this.accountNo = accountNo;
		this.splitKind = splitKind;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getSplitKind() {
		return splitKind;
	}

	public void setSplitKind(String splitKind) {
		this.splitKind = splitKind;
	}

	@Override
	public String toString() {
		return "SplitKindInfoVO [accountNo=" + accountNo + ", splitKind=" + splitKind + "]";
	}

	
}
