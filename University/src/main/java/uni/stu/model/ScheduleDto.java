package uni.stu.model;

public class ScheduleDto {
	private int stu_no; // 학생번호
	private String stu_name; // 학생이름
	private int sub_cd; // 강의코드
	private String sub_nm; // 강의명
	private int lec_1;
	private int lec_2;
	private int lec_3;
	private int prof_cd;
	private String prof_nm;
	private String subroom_nm;
	private String dept_cd;
	private String dept_nm;
	public int getStu_no() {
		return stu_no;
	}
	public void setStu_no(int stu_no) {
		this.stu_no = stu_no;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public int getSub_cd() {
		return sub_cd;
	}
	public void setSub_cd(int sub_cd) {
		this.sub_cd = sub_cd;
	}
	public String getSub_nm() {
		return sub_nm;
	}
	public void setSub_nm(String sub_nm) {
		this.sub_nm = sub_nm;
	}
	public int getLec_1() {
		return lec_1;
	}
	public void setLec_1(int lec_1) {
		this.lec_1 = lec_1;
	}
	public int getLec_2() {
		return lec_2;
	}
	public void setLec_2(int lec_2) {
		this.lec_2 = lec_2;
	}
	public int getLec_3() {
		return lec_3;
	}
	public void setLec_3(int lec_3) {
		this.lec_3 = lec_3;
	}
	public int getProf_cd() {
		return prof_cd;
	}
	public void setProf_cd(int prof_cd) {
		this.prof_cd = prof_cd;
	}
	public String getProf_nm() {
		return prof_nm;
	}
	public void setProf_nm(String prof_nm) {
		this.prof_nm = prof_nm;
	}
	public String getSubroom_nm() {
		return subroom_nm;
	}
	public void setSubroom_nm(String subroom_nm) {
		this.subroom_nm = subroom_nm;
	}
	public String getDept_cd() {
		return dept_cd;
	}
	public void setDept_cd(String dept_cd) {
		this.dept_cd = dept_cd;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	
	
}