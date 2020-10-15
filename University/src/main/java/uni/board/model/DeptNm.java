package uni.board.model;

public class DeptNm {
	String dept_cd;
	String dept_nm;
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
	@Override
	public String toString() {
		return "DeptNm [dept_cd=" + dept_cd + ", dept_nm=" + dept_nm + "]";
	}
	
	
}
