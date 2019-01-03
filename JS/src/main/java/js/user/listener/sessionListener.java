package js.user.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class abc
 *
 */
public class sessionListener implements ServletContextListener, HttpSessionListener {

 
    public sessionListener() {
  
    }
    
    // 세션 카운트: 접속자 숫자 파악하기 위함
    public static int count;
    
    public static int getCount() {
        return count;
    }
    
    
    
    // 세션이 만들어질때 호출
    public void sessionCreated(HttpSessionEvent se)  { 
        HttpSession session = se.getSession();
        // 15분 설정
        session.setMaxInactiveInterval(900);
        
        count++;
        
        session.getServletContext().log(session.getId() + " 세션생성 " + ", 접속자수 : " + count);


        
    }

    //세션이 소멸될 때 호출
    public void sessionDestroyed(HttpSessionEvent se)  { 
    	
     count--;
     if(count<0)
    	 count=0;
          
         HttpSession session = se.getSession();
         session.getServletContext().log(session.getId() + " 세션소멸 " + ", 접속자수 : " + count);

    }

    public void contextDestroyed(ServletContextEvent sce)  { 

    	System.out.println("종료");
    	
    	
    }

    public void contextInitialized(ServletContextEvent sce)  { 
        
    }
	
}
