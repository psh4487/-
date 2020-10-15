package uni.stu.model;

public class GradeMDto {
	
	private String isu;
	private String sub_nm;
	private int stu_no; 
	private int sub_cd;
	private int mid_score; 
	private int end_score; 
	private int report_score;
	private int attend_score; 
	private int attend_sum; 
	private String attend_grade=""; 
	private String attend_rating="";
	private int years;
	private int sem;
	
	public String getIsu() {
		return isu;
	}
	public void setIsu(String isu) {
		this.isu = isu;
	}
	public String getSub_nm() {
		return sub_nm;
	}
	public void setSub_nm(String sub_nm) {
		this.sub_nm = sub_nm;
	}
	public int getStu_no() {
		return stu_no;
	}
	public void setStu_no(int stu_no) {
		this.stu_no = stu_no;
	}
	public int getSub_cd() {
		return sub_cd;
	}
	public void setSub_cd(int sub_cd) {
		this.sub_cd = sub_cd;
	}
	public int getMid_score() {
		return mid_score;
	}
	public void setMid_score(int mid_score) {
		this.mid_score = mid_score;
	}
	public int getEnd_score() {
		return end_score;
	}
	public void setEnd_score(int end_score) {
		this.end_score = end_score;
	}
	public int getReport_score() {
		return report_score;
	}
	public void setReport_score(int report_score) {
		this.report_score = report_score;
	}
	public int getAttend_score() {
		return attend_score;
	}
	public void setAttend_score(int attend_score) {
		this.attend_score = attend_score;
	}
	public int getAttend_sum() {
		return attend_sum;
	}
	public void setAttend_sum(int attend_sum) {
		this.attend_sum = attend_sum;
	}
	public String getAttend_grade() {
		return attend_grade;
	}
	public void setAttend_grade(String attend_grade) {
		this.attend_grade = attend_grade;
	}
	public String getAttend_rating() {
		return attend_rating;
	}
	public void setAttend_rating(String attend_rating) {
		this.attend_rating = attend_rating;
	}
	public int getYears() {
		return years;
	}
	public void setYears(int years) {
		this.years = years;
	}
	public int getSem() {
		return sem;
	}
	public void setSem(int sem) {
		this.sem = sem;
	}	
	
}
