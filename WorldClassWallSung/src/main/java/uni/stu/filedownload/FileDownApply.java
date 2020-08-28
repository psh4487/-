package uni.stu.filedownload;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;
@Component
public class FileDownApply  extends AbstractView {
			 
	    public void Download() {
	        // 객체가 생성될 때 Content Type을 다음과 같이 변경 
	        setContentType("application/download; charset=utf-8");
	    }
	 
	    @Override
	    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
	         
	    	setContentType("application/download; utf-8");
	    	
	    	File file = (File) model.get("downloadFile");
	    	
	    	 System.out.println("DownloadView --> file.getPath() : " + file.getPath());
	         System.out.println("DownloadView --> file.getName() : " + file.getName());
	    	
	    	response.setContentType(getContentType());
	    	response.setContentLength((int)file.length());
	    	
	    	String header = request.getHeader("User-Agent");
	    	boolean b = header.indexOf("MSIE") > -1;
	    	String fileName = null;
	    	
	    	 if (b) {
	             fileName = URLEncoder.encode(file.getName(),"UTF-8");
	         } else {
	             fileName = new String(file.getName().getBytes("UTF-8"),"iso-8859-1");
	         }
	       
	    	 response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
	         response.setHeader("Content-Transfer-Encoding", "binary");
	         	
	         
	         OutputStream out = response.getOutputStream();
	         FileInputStream fis = null;
	         
	         try {
	             fis = new FileInputStream(file);
	             FileCopyUtils.copy(fis, out);
	         } catch (Exception e) {
	             e.printStackTrace();
	         } finally {
	             if (fis != null) {
	                 try {
	                     fis.close();
	                 } catch (IOException ioe) {
	                     ioe.printStackTrace();
	                 }
	             }
	             out.flush();
	    }
	    }
}
