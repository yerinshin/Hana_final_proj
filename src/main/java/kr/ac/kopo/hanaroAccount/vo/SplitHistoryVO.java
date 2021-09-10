package kr.ac.kopo.hanaroAccount.vo;

public class SplitHistoryVO {
	
	private int code;					//내역 코드
	private String accountNo;			
	private String transCode;	//거래 분류 코드
	private String splitFrom;
	private String splitTo;
	private int transMoney;				//이동 금액
	private String transDate;			//이동 날짜
	private String memo;
	
	
	public int getCode() {
		return code;
	}
	public String getTransCode() {
		return transCode;
	}
	public void setTransCode(String transCode) {
		this.transCode = transCode;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getSplitFrom() {
		return splitFrom;
	}
	public void setSplitFrom(String splitFrom) {
		this.splitFrom = splitFrom;
	}
	public String getSplitTo() {
		return splitTo;
	}
	public void setSplitTo(String splitTo) {
		this.splitTo = splitTo;
	}
	public int getTransMoney() {
		return transMoney;
	}
	public void setTransMoney(int transMoney) {
		this.transMoney = transMoney;
	}
	public String getTransDate() {
		return transDate;
	}
	public void setTransDate(String transDate) {
		this.transDate = transDate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public void setCode(int code) {
		this.code = code;
	}
	
	@Override
	public String toString() {
		return "SplitHistoryVO [code=" + code + ", transCode=" + transCode + ", accountNo=" + accountNo + ", splitFrom="
				+ splitFrom + ", splitTo=" + splitTo + ", transMoney=" + transMoney + ", transDate=" + transDate
				+ ", memo=" + memo + "]";
	}
	
	
}
