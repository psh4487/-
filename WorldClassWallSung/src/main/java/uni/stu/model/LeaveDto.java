package uni.stu.model;

public class LeaveDto {
	private int no; // 순번
	private int stu_no; // 학생번호
	private String leave_change; // 학적변동
	private String leave_state; // 처리상태
	private String leave_year; // 휴학할연도
	private String leave_sem; // 휴학할학기
	private String leave_dt; // 현재신청일자
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getStu_no() {
		return stu_no;
	}
	public void setStu_no(int stu_no) {
		this.stu_no = stu_no;
	}
	public String getLeave_change() {
		return leave_change;
	}
	public void setLeave_change(String leave_change) {
		this.leave_change = leave_change;
	}
	public String getLeave_state() {
		return leave_state;
	}
	public void setLeave_state(String leave_state) {
		this.leave_state = leave_state;
	}
	public String getLeave_year() {
		return leave_year;
	}
	public void setLeave_year(String leave_year) {
		this.leave_year = leave_year;
	}
	public String getLeave_sem() {
		return leave_sem;
	}
	public void setLeave_sem(String leave_sem) {
		this.leave_sem = leave_sem;
	}
	public String getLeave_dt() {
		return leave_dt;
	}
	public void setLeave_dt(String leave_dt) {
		this.leave_dt = leave_dt;
	}
}
