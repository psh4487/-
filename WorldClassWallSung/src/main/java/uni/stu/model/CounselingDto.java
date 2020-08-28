package uni.stu.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CounselingDto {
	private int cs_no;
	private int stu_no; // 학생번호
	private int sub_cd; // 강의코드
	private String sub_nm;
	private String cs_date;
	private String cs_nm;
	private String cs_con;
	private String cs_state;
	private int prof_cd;
	private String prof_nm;
}
