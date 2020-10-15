package uni.main.AuthLoginInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AuthLoginInterceptor extends HandlerInterceptorAdapter{


 @Override
 public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
    
     HttpSession session = request.getSession();
  Object obj = session.getAttribute("login");
       
     if ( obj == null ){
   
    	 System.out.println("Interceptor : Session Check Fail");
    	 response.sendRedirect("loginstu.do");
         return false; 
     }
       
     return super.preHandle(request, response, handler);
 }


}