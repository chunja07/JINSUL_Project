package js.user.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import js.user.model.Member;



// 개인정보 변경 전 사용자의 비밀번호 확인

public class privacyFilter implements Filter {

   
    public privacyFilter() {
    }

	public void destroy() {
		
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// SessionAttributes("checkPw")에 값이 없다면 계속 checkPw.jsp 로 가도록 
		if(((HttpServletRequest)request).getSession().getAttribute("checkPw") == null) {
		request.getRequestDispatcher("/WEB-INF/view/update/checkPw.jsp").forward(request, response);
		}else {
		// 값이 있다면 chain (요청 페이지로 넘겨줌)
		chain.doFilter(request, response);
		}
	}


	public void init(FilterConfig fConfig) throws ServletException {

	}

}
