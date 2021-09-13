package kr.ac.kopo.account.vo;

public class TransactionHistoryVO {
	
	private int transactionNo;
	private int transCode;
	private String myAccNo;
	private int transMoney;
	private int balance;
	private String transInfo;
	private String othersName;
	private String transDate;
	private String category;
	
	
	public int getTransactionNo() {
		return transactionNo;
	}
	public void setTransactionNo(int transactionNo) {
		this.transactionNo = transactionNo;
	}
	public int getTransCode() {
		return transCode;
	}
	public void setTransCode(int transCode) {
		this.transCode = transCode;
	}
	public String getMyAccNo() {
		return myAccNo;
	}
	public void setMyAccNo(String myAccNo) {
		this.myAccNo = myAccNo;
	}
	public int getTransMoney() {
		return transMoney;
	}
	public void setTransMoney(int transMoney) {
		this.transMoney = transMoney;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getTransInfo() {
		return transInfo;
	}
	public void setTransInfo(String transInfo) {
		this.transInfo = transInfo;
	}
	public String getOthersName() {
		return othersName;
	}
	public void setOthersName(String othersName) {
		this.othersName = othersName;
	}
	public String getTransDate() {
		return transDate;
	}
	public void setTransDate(String transDate) {
		this.transDate = transDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	@Override
	public String toString() {
		return "TransactionHistoryVO [transactionNo=" + transactionNo + ", transCode=" + transCode + ", myAccNo="
				+ myAccNo + ", transMoney=" + transMoney + ", balance=" + balance + ", transInfo=" + transInfo
				+ ", othersName=" + othersName + ", transDate=" + transDate + ", category=" + category + "]";
	}
	
	
}
