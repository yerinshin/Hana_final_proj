package kr.ac.kopo.spending.vo;

public class CalendarVO {
	private String color; 
	private String textColor;
	private String title;
	private String start;

	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	
	@Override
	public String toString() {
		return "CalendarVO [color=" + color + ", textColor=" + textColor + ", title=" + title + ", start=" + start
				+ "]";
	}
	
	
	
}
