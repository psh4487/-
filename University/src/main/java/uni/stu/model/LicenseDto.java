package uni.stu.model;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class LicenseDto {
	int li_no;
	int stu_no;
	String li_nm;
	String li_file;
	String li_date;
	String li_path;
	MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getLi_no() {
		return li_no;
	}
	public void setLi_no(int li_no) {
		this.li_no = li_no;
	}
	public int getStu_no() {
		return stu_no;
	}
	public void setStu_no(int stu_no) {
		this.stu_no = stu_no;
	}
	public String getLi_nm() {
		return li_nm;
	}
	public void setLi_nm(String li_nm) {
		this.li_nm = li_nm;
	}
	public String getLi_file() {
		return li_file;
	}
	public void setLi_file(String li_file) {
		this.li_file = li_file;
	}
	
	public String getLi_date() {
		return li_date;
	}
	public void setLi_date(String li_date) {
		this.li_date = li_date;
	}
	public String getLi_path() {
		return li_path;
	}
	public void setLi_path(String li_path) {
		this.li_path = li_path;
	}
	
	
}
