package uni.main.service;

import java.util.Map; 
import javax.mail.internet.MimeMessage;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage.RecipientType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import uni.main.model.Login_All_Dto;
import uni.sta.model.ProDto;
import uni.sta.model.StaffDto;
import uni.sta.model.StuDto;

@Service
public class LoginStuService {

	LoginStuDao dao;

	JavaMailSender mailSender;

	@Autowired
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	@Autowired
	public void setDao(LoginStuDao dao) {
		this.dao = dao;
	}

	public Login_All_Dto LoginStu(Map<String, Object> map) {
		return dao.LoginStu(map);
	}

	public Login_All_Dto LoginSta(Map<String, Object> map) {
		return dao.LoginSta(map);
	}

	public Login_All_Dto LoginPro(Map<String, Object> map) {
		return dao.LoginPro(map);
	}

	public Login_All_Dto idmailcheck_stu(Map<String, Object> map, Login_All_Dto alldto) {
		return dao.idmailcheck_stu(map, alldto);
	}

	public Login_All_Dto idmailcheck_pro(Map<String, Object> map, Login_All_Dto dto) {
		return dao.idmailcheck_pro(map, dto);
	}

	public Login_All_Dto idmailcheck_sta(Map<String, Object> map, Login_All_Dto dto) {
		return dao.idmailcheck_sta(map, dto);
	}

	public void pass_change_stu(Map<String, Object> map, StuDto dto) throws Exception {
		dao.pass_change_stu(map, dto);

	}

	public void pass_change_pro(Map<String, Object> map, ProDto dto) throws Exception {
		dao.pass_change_pro(map, dto);
	}

	public void pass_change_sta(Map<String, Object> map, StaffDto dto) throws Exception {
		dao.pass_change_sta(map, dto);
	}

	
	
	public boolean mailSend(Login_All_Dto email) {

		try {
			MimeMessage msg = mailSender.createMimeMessage();

			msg.setSubject(email.getSubject());

			msg.setText(email.getContent());
			msg.setRecipient(RecipientType.TO, new InternetAddress(email.getReceiver()));

			mailSender.send(msg);

			return true;

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return false;

	}
}
