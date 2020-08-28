package uni.stu.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
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
}