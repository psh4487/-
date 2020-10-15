package uni.pro.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

public class ReportDto {
	int stu_no;
	String stu_name;
	String sub_cd;
	String sub_nm;
	String report_file;
	String report_path;
	String report_state;
	Date report_dt;
	String report_nm;
	String file_size;
	public int getStu_no() {
		return stu_no;
	}
	public void setStu_no(int stu_no) {
		this.stu_no = stu_no;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	public String getSub_cd() {
		return sub_cd;
	}
	public void setSub_cd(String sub_cd) {
		this.sub_cd = sub_cd;
	}
	public String getSub_nm() {
		return sub_nm;
	}
	public void setSub_nm(String sub_nm) {
		this.sub_nm = sub_nm;
	}
	public String getReport_file() {
		return report_file;
	}
	public void setReport_file(String report_file) {
		this.report_file = report_file;
	}
	public String getReport_path() {
		return report_path;
	}
	public void setReport_path(String report_path) {
		this.report_path = report_path.replace("\\","/");
	}
	public String getReport_state() {
		return report_state;
	}
	public void setReport_state(String report_state) {
		this.report_state = report_state;
	}
	public Date getReport_dt() {
		return report_dt;
	}
	public void setReport_dt(Date report_dt) {
		this.report_dt = report_dt;
	}
	public String getReport_nm() {
		return report_nm;
	}
	public void setReport_nm(String report_nm) {
		this.report_nm = report_nm;
	}
	public String getFile_size() {
		return file_size;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	
}
