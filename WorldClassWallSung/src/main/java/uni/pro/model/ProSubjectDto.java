package uni.pro.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ProSubjectDto {
	
    private int sub_cd;
    private String dept_cd;
    private int stu_cd;
    private  String sub_nm;
    private String dept_nm;
    private String subroom_nm;
    private String buil_no;
    private int prof_cd;
    private String isu;
    private int credit;
    private int attend_mem;
    private int max_mem;
    private String sub_path;
    private String week;
    private int lec_1; 
    private int lec_2; 	
    private int lec_3;
    private String sem;
    private String sub_state;
    private int years;
	private String noclass_dt;
    private String noclass_state;   
    
}
	
    