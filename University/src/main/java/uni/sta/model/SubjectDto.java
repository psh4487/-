package uni.sta.model;

public class SubjectDto {
	
	int sub_cd; //강의코드
	String dept_cd; //학과코드
	String sub_nm; //강의명
	String buil_no; //건물명
	String subroom_nm; //강의실명
	int prof_cd; //교수번호
	String prof_nm; //교수이름
	String isu; //이수구분
	int credit;  //학점
	int attend_mem; //신청인원
	int max_mem; //최대인원
	String sub_path; //강의계획서 경로
	int lec_1; //교시1
	int lec_2; //교시2
	int lec_3;	//교시3
	String sem; //학기
	String sub_state; //강의여부 
	int years; //개강연도
	String noclass_dt; // 휴강신청날짜
	String noclass_state; //휴강처리상태
	String can_dt; //휴강일자
	String sup_dt; //보강일자
	String can_iu; //휴강사유
	String lec; //강의시간

	public void setLec(	int lec_1,int lec_2,int lec_3) {
		
		String lec1="",lec2="",lec3 ="";
		
		if(lec_1/10 ==0) {
			lec1="월"+lec_1%10;
		}
		if(lec_1/10 ==1) {
			lec1="화"+lec_1%10;
		}
		if(lec_1/10 ==2) {
			lec1="수"+lec_1%10;
		}
		if(lec_1/10 ==3) {
			lec1="목"+lec_1%10;
		}
		if(lec_1/10 ==4) {
			lec1="금"+lec_1%10;
		}
		
		if(lec_2/10 ==0) {
			lec2="월"+lec_2%10;
		}
		if(lec_2/10 ==1) {
			lec2="화"+lec_2%10;
		}
		if(lec_2/10 ==2) {
			lec2="수"+lec_2%10;
		}
		if(lec_2/10 ==3) {
			lec2="목"+lec_2%10;
		}
		if(lec_2/10 ==4) {
			lec2="금"+lec_2%10;
		}
		
		if(lec_3/10 ==0) {
			lec3="월"+lec_3%10;
		}
		if(lec_3/10 ==1) {
			lec3="화"+lec_3%10;
		}
		if(lec_3/10 ==2) {
			lec3="수"+lec_3%10;
		}
		if(lec_3/10 ==3) {
			lec3="목"+lec_3%10;
		}
		if(lec_3/10 ==4) {
			lec3="금"+lec_3%10;
		}	
		
		this.lec = lec1+","+lec2+","+lec3;		
	}

	public int getSub_cd() {
		return sub_cd;
	}

	public void setSub_cd(int sub_cd) {
		this.sub_cd = sub_cd;
	}

	public String getDept_cd() {
		return dept_cd;
	}

	public void setDept_cd(String dept_cd) {
		this.dept_cd = dept_cd;
	}

	public String getSub_nm() {
		return sub_nm;
	}

	public void setSub_nm(String sub_nm) {
		this.sub_nm = sub_nm;
	}

	public String getBuil_no() {
		return buil_no;
	}

	public void setBuil_no(String buil_no) {
		this.buil_no = buil_no;
	}

	public String getSubroom_nm() {
		return subroom_nm;
	}

	public void setSubroom_nm(String subroom_nm) {
		this.subroom_nm = subroom_nm;
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

	public String getIsu() {
		return isu;
	}

	public void setIsu(String isu) {
		this.isu = isu;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public int getAttend_mem() {
		return attend_mem;
	}

	public void setAttend_mem(int attend_mem) {
		this.attend_mem = attend_mem;
	}

	public int getMax_mem() {
		return max_mem;
	}

	public void setMax_mem(int max_mem) {
		this.max_mem = max_mem;
	}

	public String getSub_path() {
		return sub_path;
	}

	public void setSub_path(String sub_path) {
		this.sub_path = sub_path;
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

	public String getSem() {
		return sem;
	}

	public void setSem(String sem) {
		this.sem = sem;
	}

	public String getSub_state() {
		return sub_state;
	}

	public void setSub_state(String sub_state) {
		this.sub_state = sub_state;
	}

	public int getYears() {
		return years;
	}

	public void setYears(int years) {
		this.years = years;
	}

	public String getNoclass_dt() {
		return noclass_dt;
	}

	public void setNoclass_dt(String noclass_dt) {
		this.noclass_dt = noclass_dt;
	}

	public String getNoclass_state() {
		return noclass_state;
	}

	public void setNoclass_state(String noclass_state) {
		this.noclass_state = noclass_state;
	}

	public String getCan_dt() {
		return can_dt;
	}

	public void setCan_dt(String can_dt) {
		this.can_dt = can_dt;
	}

	public String getSup_dt() {
		return sup_dt;
	}

	public void setSup_dt(String sup_dt) {
		this.sup_dt = sup_dt;
	}

	public String getCan_iu() {
		return can_iu;
	}

	public void setCan_iu(String can_iu) {
		this.can_iu = can_iu;
	}

	public String getLec() {
		return lec;
	}

	public void setLec(String lec) {
		this.lec = lec;
	}
	
}
