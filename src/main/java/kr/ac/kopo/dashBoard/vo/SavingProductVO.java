package kr.ac.kopo.dashBoard.vo;

// 예/적금VO
public class SavingProductVO {
	private String name;			//상품명
	private String type;			//상품타입 : 정기예금(2001), 정기적금(2002), 자유적금(2003)
	private int minAge;				//가입가능 최소나이
	private int maxAge;				//가입 가능 최대 나이
	private String availableMember;	//가입가능 조건
	private int minMoney;			//납부최소급액 or 예치최소금액
	private int maxMoney;			//납부 최대금액 or 예치최대금액
	private double interestRate;	//기본금리
	private double maxPRate;		//최대 우대금리
	private int minPeriod;			//최소 기간
	private int maxPeriod;			//최대 기간
	private String description;			//상품특징
	private String optionCheck;			//1인1세대, 가입금액, 정립방법
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getMinAge() {
		return minAge;
	}
	public void setMinAge(int minAge) {
		this.minAge = minAge;
	}
	public int getMaxAge() {
		return maxAge;
	}
	public void setMaxAge(int maxAge) {
		this.maxAge = maxAge;
	}
	public String getAvailableMember() {
		return availableMember;
	}
	public void setAvailableMember(String availableMember) {
		this.availableMember = availableMember;
	}
	public int getMinMoney() {
		return minMoney;
	}
	public void setMinMoney(int minMoney) {
		this.minMoney = minMoney;
	}
	public int getMaxMoney() {
		return maxMoney;
	}
	public void setMaxMoney(int maxMoney) {
		this.maxMoney = maxMoney;
	}
	public double getInterestRate() {
		return interestRate;
	}
	public void setInterestRate(double interestRate) {
		this.interestRate = interestRate;
	}
	
	public double getMaxPRate() {
		return maxPRate;
	}
	public void setMaxPRate(double maxPRate) {
		this.maxPRate = maxPRate;
	}
	public int getMinPeriod() {
		return minPeriod;
	}
	public void setMinPeriod(int minPeriod) {
		this.minPeriod = minPeriod;
	}
	public int getMaxPeriod() {
		return maxPeriod;
	}
	public void setMaxPeriod(int maxPeriod) {
		this.maxPeriod = maxPeriod;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getOptionCheck() {
		return optionCheck;
	}
	public void setOptionCheck(String optionCheck) {
		this.optionCheck = optionCheck;
	}
	
	@Override
	public String toString() {
		return "SavingProductVO [name=" + name + ", type=" + type + ", minAge=" + minAge + ", maxAge=" + maxAge
				+ ", availableMember=" + availableMember + ", minMoney=" + minMoney + ", maxMoney=" + maxMoney
				+ ", interestRate=" + interestRate + ", maxPRate=" + maxPRate + ", minPeriod=" + minPeriod
				+ ", maxPeriod=" + maxPeriod + ", description=" + description + ", optionCheck=" + optionCheck + "]";
	}
	
	
	
}
