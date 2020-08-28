package uni.sta.model;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
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
}
