package uni.sta.model;

public class SubjectDto {
	
	int sub_cd; //�����ڵ�
	String dept_cd; //�а��ڵ�
	String sub_nm; //���Ǹ�
	String buil_no; //�ǹ���
	String subroom_nm; //���ǽǸ�
	int prof_cd; //������ȣ
	String prof_nm; //�����̸�
	String isu; //�̼�����
	int credit;  //����
	int attend_mem; //��û�ο�
	int max_mem; //�ִ��ο�
	String sub_path; //���ǰ�ȹ�� ���
	int lec_1; //����1
	int lec_2; //����2
	int lec_3;	//����3
	String sem; //�б�
	String sub_state; //���ǿ��� 
	int years; //��������
	String noclass_dt; // �ް���û��¥
	String noclass_state; //�ް�ó������
	String can_dt; //�ް�����
	String sup_dt; //��������
	String can_iu; //�ް�����
	String lec; //���ǽð�

	public void setLec(	int lec_1,int lec_2,int lec_3) {
		
		String lec1="",lec2="",lec3 ="";
		
		if(lec_1/10 ==0) {
			lec1="��"+lec_1%10;
		}
		if(lec_1/10 ==1) {
			lec1="ȭ"+lec_1%10;
		}
		if(lec_1/10 ==2) {
			lec1="��"+lec_1%10;
		}
		if(lec_1/10 ==3) {
			lec1="��"+lec_1%10;
		}
		if(lec_1/10 ==4) {
			lec1="��"+lec_1%10;
		}
		
		if(lec_2/10 ==0) {
			lec2="��"+lec_2%10;
		}
		if(lec_2/10 ==1) {
			lec2="ȭ"+lec_2%10;
		}
		if(lec_2/10 ==2) {
			lec2="��"+lec_2%10;
		}
		if(lec_2/10 ==3) {
			lec2="��"+lec_2%10;
		}
		if(lec_2/10 ==4) {
			lec2="��"+lec_2%10;
		}
		
		if(lec_3/10 ==0) {
			lec3="��"+lec_3%10;
		}
		if(lec_3/10 ==1) {
			lec3="ȭ"+lec_3%10;
		}
		if(lec_3/10 ==2) {
			lec3="��"+lec_3%10;
		}
		if(lec_3/10 ==3) {
			lec3="��"+lec_3%10;
		}
		if(lec_3/10 ==4) {
			lec3="��"+lec_3%10;
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
