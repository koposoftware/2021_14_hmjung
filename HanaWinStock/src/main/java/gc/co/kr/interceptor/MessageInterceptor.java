package gc.co.kr.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MessageInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{		
		HttpSession session = request.getSession();
		String msg = (String) session.getAttribute("msg");
		if(msg != null ) {
			System.out.println("from MessageInterceptor : " +  msg);
			request.setAttribute("msg", msg);
			session.removeAttribute("msg");
		}
		return true;
	}
}
