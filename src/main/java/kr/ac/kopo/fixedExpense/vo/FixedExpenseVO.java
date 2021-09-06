package kr.ac.kopo.fixedExpense.vo;

public class FixedExpenseVO {
	
	private int code;
	private String accNoToTransfer;
	private String expenseInfo;
	private int transMoney;
	private int transDate;
	private String myAccNo;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getAccNoToTransfer() {
		return accNoToTransfer;
	}
	public void setAccNoToTransfer(String accNoToTransfer) {
		this.accNoToTransfer = accNoToTransfer;
	}
	public String getExpenseInfo() {
		return expenseInfo;
	}
	public void setExpenseInfo(String expenseInfo) {
		this.expenseInfo = expenseInfo;
	}
	public int getTransMoney() {
		return transMoney;
	}
	public void setTransMoney(int transMoney) {
		this.transMoney = transMoney;
	}
	public int getTransDate() {
		return transDate;
	}
	public void setTransDate(int transDate) {
		this.transDate = transDate;
	}
	public String getMyAccNo() {
		return myAccNo;
	}
	public void setMyAccNo(String myAccNo) {
		this.myAccNo = myAccNo;
	}
	
	@Override
	public String toString() {
		return "FixedExpenseVO [code=" + code + ", accNoToTransfer=" + accNoToTransfer + ", expenseInfo=" + expenseInfo
				+ ", transMoney=" + transMoney + ", transDate=" + transDate + ", myAccNo=" + myAccNo + "]";
	}
	
}
