package kr.ac.kopo.dashBoard.vo;

public class MonthlySavingVO {
	private int year;
	private int month;
	private int savingMoney;
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getSavingMoney() {
		return savingMoney;
	}
	public void setSavingMoney(int savingMoney) {
		this.savingMoney = savingMoney;
	}
	@Override
	public String toString() {
		return "MonthlySavingVO [year=" + year + ", month=" + month + ", savingMoney=" + savingMoney + "]";
	}
	
	

}
