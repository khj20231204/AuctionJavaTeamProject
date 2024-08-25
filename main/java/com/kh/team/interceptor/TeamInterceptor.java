package com.kh.team.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.team.domain.MemberVo;



public class TeamInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
				//로그인 되어있는지 확인
				HttpSession session = request.getSession();
				MemberVo memberVo =  (MemberVo) session.getAttribute("memberVo");
				String nonBuyer = (String) session.getAttribute("nonBuyer");
//				System.out.println("TeamProject_nonBuyer:" + nonBuyer);
				
				if(nonBuyer != null && memberVo == null) {
//				System.out.println("비회원 로그인");	
				response.sendRedirect("/");
				return false;
				} else if(nonBuyer == null && memberVo == null) {
					response.sendRedirect("/login/loginForm");
					return false;
				}
		        return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
