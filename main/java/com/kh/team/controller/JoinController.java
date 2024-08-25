package com.kh.team.controller;

import java.util.HashMap;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.JoinEmailVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.service.JoinService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping(value="/join")
public class JoinController implements JoinSMSKey {

	@Inject
	private JavaMailSender mailSender;
	
	@Inject
	private JoinService joinService;
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {	
		//System.out.println("joinForm Controller");
		return "joinForm";
	}
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map() {
		//System.out.println("Controller Map");
		return "map";
	}
	
	@RequestMapping(value = "/joinRun", method = RequestMethod.GET)
	public String joinRun(MemberVo memberVo,String m_phonenumber1, String m_phonenumber2, String m_phonenumber3, String email1, String email2) throws Exception{
		
		//System.out.println("memberVo:"+memberVo);
		//System.out.println("m_phonenumber1:"+m_phonenumber1+" ,m_phonenumber2:"+m_phonenumber2+" ,m_phonenumber3:"+m_phonenumber3+" ,email1:"+email1+" ,email2:"+email2);
		
		String m_name = memberVo.getM_name();
		String m_id = memberVo.getM_id();
		String m_pass = memberVo.getM_pass();
		String m_phonenumber = m_phonenumber1+m_phonenumber2+m_phonenumber3;
		String email = email1+"@"+email2;
		
		//System.out.println("m_phonenumber:"+m_phonenumber+" ,email:"+email);
		
		MemberVo member = new MemberVo();
		member.setM_id(m_id);
		member.setM_name(m_name);
		member.setM_pass(m_pass);
		member.setM_phonenumber(m_phonenumber);
		member.setEmail(email);
		
		joinService.joinMember(member);
			
		return "main";
	}
	
	@RequestMapping(value="/phoneConfirm/{phoneNumber}", method=RequestMethod.GET)
	@ResponseBody
	public String phoneConfirm(@PathVariable("phoneNumber") String phoneNumber) throws Exception{
		//System.out.println("phoneNumber:"+phoneNumber);
	    Message sms = new Message(api_key, api_secret);
	    
	    String randomStr = makeRandom(4);
	    //System.out.println("str_random:"+randomStr);
	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phoneNumber);
	    params.put("from", "01087116886"); //무조건 자기번호 (인증)
	    params.put("type", "SMS");
	    params.put("text", "안녕하세요 중고동네입니다. 인증번호는["+randomStr+"]입니다");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	    	//send() 는 메시지를 보내는 함수  
	      JSONObject obj = (JSONObject) sms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    
		return String.valueOf(randomStr);
	}
	
	//난수 만드는 함수
	public String makeRandom(int size) { 
		StringBuffer randomBuffer = new StringBuffer();
		Random random = new Random();
		
		while(randomBuffer.length() < size) {
			randomBuffer.append(random.nextInt(9)+1);
		}
		
		return randomBuffer.toString();
	}
	
	@RequestMapping(value="/emailConfirm/{email_name}/{email_domain_first}/{email_domain_second}", method=RequestMethod.GET)
	@ResponseBody
	public String emailConfirm(@PathVariable("email_name") String email_name,
			@PathVariable("email_domain_first") String email_domain_first,
			@PathVariable("email_domain_second") String email_domain_second
			) throws Exception{
		
		String checkid = makeRandom(6);
		String email = email_name + "@" + email_domain_first + "." + email_domain_second;
		//System.out.println("email:"+email+" ,checkid:"+checkid);
		
		JoinEmailVo joinEmailVo = new JoinEmailVo();
		joinEmailVo.setEmail(email);
		joinEmailVo.setCheckid(checkid);
		joinService.joinEmailConfirmInsert(joinEmailVo);
		
		String url = "http://localhost/join/emailConfirmCheck?email="+email+"&checkid="+checkid;
		//String fullUrl = "<a href="+url+" onClick=\"window.open('"+url+"','pagename','resizable,height=260,width=370'); return false;\">새창열기</a>";
		
		StringBuffer sb = new StringBuffer();
		sb.append("<h1>[이메일 인증]</h1>");
		sb.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>");
		sb.append("<a href=");
        sb.append(url);
        sb.append(" onClick=\"window.open('");
        sb.append(url);
        sb.append("','pagename','resizable,height=260,width=370'); return false;\">이메일 인증 확인</a>");
        
        //System.out.println("sb.toString():"+sb.toString());
		
		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("natista99@gmail.com");
				helper.setTo(email);
				helper.setText(sb.toString(), true);
				helper.setSubject("제목");
			}
		};	
		
		mailSender.send(preparator);
		//System.out.println("preparator:"+preparator);
		
		return checkid;
	}
	
	@RequestMapping(value="/emailConfirmCheck", method=RequestMethod.GET) //보낸 메일에서 인증을 눌렀을 때 창만 띄워주는 부분, 이 컨트롤로가 실행이 됐다는 거 자체가 메일 인증이 되었다는 것
	public String emailConfirmCheck(JoinEmailVo joinEmailVo, HttpSession session, RedirectAttributes rttr) throws Exception{
		
		System.out.println("controller emailConfirmCheck에서 joinEmailVo:"+joinEmailVo);
		joinService.joinEmailStatusUpdate(joinEmailVo.getEmail());
		
		/*
		session.setAttribute("emailStatus", "112"); 
		페이지가  로드될 때 session값을 가져오지 이벤트를 준다고 세션을 새로 불러오는 건 아니다
		jsp에서 새로고침을 해야 session값이 바뀌는데 새로고침을 할 순 없다. 그래서 비동기로 불러야 한다
		rttr.addFlashAttribute("emailStatus", "33"); rttr은 페이가 바뀌면 값을 못 넘긴다
		*/
		
		return "furnitureCategory/emailConfirmCheck";
	}
	
	@RequestMapping(value="/emailStatusConfirm/{email_name}/{email_domain_first}/{email_domain_second}/{checkid}", method=RequestMethod.GET)
	@ResponseBody
	public String emailStatusConfirm(@PathVariable("email_name") String email_name,
			@PathVariable("email_domain_first") String email_domain_first,
			@PathVariable("email_domain_second") String email_domain_second,
			@PathVariable("checkid") String checkid,
			HttpSession session) throws Exception{
	
			String email = email_name + "@" + email_domain_first + "." + email_domain_second;
			//System.out.println("emailStatusConfirm email:"+email+" ,checkid:"+checkid);
			
			JoinEmailVo vo = new JoinEmailVo();
			vo.setEmail(email);
			vo.setCheckid(checkid);
			
			JoinEmailVo joinEmailVo = joinService.joinEmailConfirmSelected(vo);
			//System.out.println("emailStatusConfirm joinEmailVo:"+joinEmailVo);
			String status = joinEmailVo.getStatus();
			
			String resultStr = "fail";
			if(status.equals("1")) {
				resultStr = "success";
			}
			//System.out.println("resultStr:"+resultStr);
			return resultStr;
	}
}
	