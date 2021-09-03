package kr.ac.kopo.hanaroAccount.vo;

public class SplitInfoVO {
	//하나로 통장 내부에서 잔액이동
	
	private String accountNo;		//하나로통장 계좌번호
	
	private String splitFrom;		//잔액이동(보내는 쪼개기통장 ex) 기본금, 생활금, 비상금)
	private String splitTo;			//잔액이동(받는 쪼개기통장)
	private int transMoney;			//이동 금액
	
	private String memo;			//메모
	
	

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

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "SplitInfoVO [accountNo=" + accountNo + ", splitFrom=" + splitFrom + ", splitTo=" + splitTo
				+ ", transMoney=" + transMoney + ", memo=" + memo + "]";
	}

	

}
