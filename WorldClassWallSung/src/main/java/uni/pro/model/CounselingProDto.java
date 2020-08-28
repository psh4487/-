package uni.pro.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CounselingProDto {
	
	int cs_no;
	String sub_cd;
	Date cs_date;
	int stu_no;
	String stu_name;
	String cs_nm;
	String cs_con;
    String cs_state;
    String sub_nm;

}
