package uni.stu.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RevokeDto {
	private int stu_no; // 학생번호
	private int stu_name; // 학생이름
	private int sub_cd; // 강의실명
	private String dept_cd;
	private String sub_nm;
	private String dept_nm;
	private int prof_cd;
	private String prof_nm;
	private String isu;
	private int credit;
	private int attend_mem;
	private int max_mem;
	private String sub_path;
	private String week;
	private int lec_1;
	private int lec_2;
	private int lec_3;
	private String sub_state;
	private int mid_score; // 중간성적
	private int end_score; // 기말성적
	private int report_score; // 과제점수
	private int attend_score; // 출결점수
	private int attend_sum; // 총합
	private String attend_grade; // 등급
	private String attend_rating; // 평점
	private int years;
	private int sem;
	
}
