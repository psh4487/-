package uni.pro.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SelScheduleProDto {
	private int stu_no; 
	private String stu_name;
	private int sub_cd; 
	private String sub_nm; 
	private int lec_1;
	private int lec_2;
	private int lec_3;
	private int prof_cd;
	private String prof_nm;
	private String subroom_nm; 
	private String dept_cd;
	private String dept_nm;
	private String buil_no; 
}