package kr.ac.kopo.spending.vo;

public class WeeklySpendingVO {
	private int week1;			//5주전
	private int week2;			//4주전
	private int week3;			//3주전
	private int week4;			//2주전
	private int week5;			//1주전
	private int week6;			//이번주 소비
		
	public int getWeek1() {
		return week1;
	}

	public void setWeek1(int week1) {
		this.week1 = week1;
	}

	public int getWeek2() {
		return week2;
	}

	public void setWeek2(int week2) {
		this.week2 = week2;
	}

	public int getWeek3() {
		return week3;
	}

	public void setWeek3(int week3) {
		this.week3 = week3;
	}

	public int getWeek4() {
		return week4;
	}

	public void setWeek4(int week4) {
		this.week4 = week4;
	}

	public int getWeek5() {
		return week5;
	}

	public void setWeek5(int week5) {
		this.week5 = week5;
	}

	public int getWeek6() {
		return week6;
	}

	public void setWeek6(int week6) {
		this.week6 = week6;
	}

	@Override
	public String toString() {
		return "WeeklySpendingVO [week1=" + week1 + ", week2=" + week2 + ", week3=" + week3 + ", week4=" + week4
				+ ", week5=" + week5 + ", week6=" + week6 + "]";
	}


	
	
}
