package uni.pro.down;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;
 
public class FileDownloadUtil extends AbstractView {
 
    public FileDownloadUtil() {
        // ��ü�� ������ �� Content Type�� ������ ���� ���� 
        setContentType("application/download; charset=utf-8");
    }
 
    @Override
    protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
         
        @SuppressWarnings("unchecked")
        Map<String, Object> down = (Map<String, Object>) model.get("down"); // ���۹��� ��(���� ����)
        String report_file = (String) down.get("report_file");    // ���� ���ϸ�(ȭ�鿡 ǥ�õ� ���� �̸�)
        String report_path = (String) down.get("report_path");    // ���� ���
        File file = new File(report_path);
        response.setContentType(getContentType());
        response.setContentLength((int) file.length());
        // ������, �ü������
        String userAgent = request.getHeader("User-Agent");
        
        // IE
        if (userAgent.indexOf("MSIE") > -1) {
            
        	report_file= URLEncoder.encode(report_file, "UTF-8");
        }
         
        // IE 11
        if (userAgent.indexOf("Trident") > -1) {
        	report_file = URLEncoder.encode(report_file, "UTF-8");
        }
        
        else {
        	report_file = new String(report_file.getBytes("UTF-8"), "8859_1");
        }
 
        response.setHeader("Content-Disposition", "attachment; filename=\"" +report_file + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        
        OutputStream out = response.getOutputStream();
         FileInputStream fis = null;
 
        try {
            
            fis = new FileInputStream(file);
            FileCopyUtils.copy(fis, out);
            
        } finally {
            
            if(fis != null) {
                fis.close();
            }
        }
        
        out.flush();
    }
}
 
