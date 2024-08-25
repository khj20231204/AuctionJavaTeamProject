package com.kh.team.controller;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.kh.team.domain.EmailDto;
import com.kh.team.domain.MemberVo;
import com.kh.team.service.MemberService;



@Controller
@RequestMapping(value="/email")
public class EmailController {
	
	
	public MemberVo memberVo;
	
	//인젝
	@Inject
	private MemberService memberService;
	
	//인젝
	@Inject
	private JavaMailSender mailSender;
	
	// 아이디 찾기위한 이메일보내기
	@RequestMapping(value="/sendEmailForFindId", method=RequestMethod.POST)
	@ResponseBody
	public String sendEmailForFindId(EmailDto emailDto) throws Exception{
		String m_id = memberService.sendEmailForFindId(emailDto.getTo());
		//준비작업 -설정
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
				
				//보내는 사람 주소 저장
				helper.setFrom(emailDto.getFrom());
				
				//받는 사람 주소 저장
				helper.setTo(emailDto.getTo());				
				emailDto.setContent(m_id);	
				emailDto.setSubject("아이디 보내드립니다.");
				System.out.println("체크m_id:" + m_id);
				
				//제목 저장
				helper.setSubject(emailDto.getSubject());
				
				//내용 저장
				helper.setText(emailDto.getContent());
				
			}
			
		};
		System.out.println("/sendEmailForFindId + emailDto:" + emailDto);
		
		System.out.println("m_id_find:"+ m_id);
		
		// 해당이메일이 존재하는지 대조하기
		String result = "";
		if(m_id == null || m_id.equals("")) {
			System.out.println("체크null");
			result = "fail";
			
		}else {
			//보내기
			System.out.println("체크true");
			mailSender.send(preparator);
			result = "success";
			
		}			
		return result;		
	}
	
	//비밀번호 찾기
	@RequestMapping(value="/sendEmailForFindPw", method=RequestMethod.POST)
	@ResponseBody
	public String[] sendEmailForFindPw(String to, String m_id) throws Exception{
		System.out.println("to:" + to);
		System.out.println("m_id:" + m_id);
		
		//데이터 베이스에서 해당 아이디에 등록된 이메일을 참조하여 비밀번호 가져오기
		String m_pass = memberService.sendEmailForFindPw(to, m_id);
		
		EmailDto emailDto = new EmailDto();
		System.out.println("m_pass:" + m_pass);
		//준비작업 -설정
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, false, "utf-8");
				
				//보내는 사람 주소 저장
				helper.setFrom(emailDto.getFrom());
				
				//받는 사람 주소 저장
				helper.setTo(to);
				
				//인증코드 생성
				emailDto.setContent(m_pass + "1q2w3e4r" + m_pass);
				emailDto.setSubject("인증코드를 보내드립니다.");
				
				//제목 저장
				helper.setSubject(emailDto.getSubject());
				
				//내용 저장
				helper.setText(emailDto.getContent());
				
			}
			
		};	
		
		
		emailDto.setContent(m_pass + "1q2w3e4r" + m_pass);
		System.out.println("인증코드:" + emailDto.getContent());
		String[] result = {"", emailDto.getContent()};
		
		//jsp에서 인증코드를 확인하고 이메일 전송이 성공하였는지 확인하기 위한 신호 전송		
		if(m_pass == null || m_pass.equals("")) {
			result[0] = "fail";
		}else {
			result[0] = "success";
			result[1] = emailDto.getContent();
			
			//메일보내기
			mailSender.send(preparator);
		}
					
		return result;		
	}
}
