package uni.stu.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SelScheduleDto {
	private int stu_no; // 학생번호
	private String stu_name; // 학생이름
	private int sub_cd; // 강의코드
	private String sub_nm; // 강의명
	private int lec_1;
	private int lec_2;
	private int lec_3;
	private int prof_cd;
	private String prof_nm;
	private String subroom_nm; // 강의실명
	private String dept_cd;
	private String dept_nm;
	private String buil_no; // 건물명
}