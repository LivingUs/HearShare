package com.kh.spring.member.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.member.domain.Member;
import com.kh.spring.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	// 회원가입 페이지
	@RequestMapping(value="memberJoin.do", method=RequestMethod.GET)
	public String memberJoinFormView() {
		return "member/memberJoinForm";
	}
	
	
	// 회원가입
	@RequestMapping(value="memberJoin.do", method=RequestMethod.POST)
	public String joinMember(Model model, Member member) {
		int result = mService.joinMember(member);
		
		if (result > 0) {
			return "index";
		} else {
			model.addAttribute("message", "회원가입 실패");
			return "errorPage";
		}
	}
	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="idRecheck.do", method=RequestMethod.GET)
	public String idRecheck (String memberId) {
		boolean idRecheck = mService.idRecheck(memberId) == 0 ? true:false;
		return idRecheck+"";
	}
	
	
	// 이메일 인증
	@RequestMapping(value="emailCertified.do", method=RequestMethod.GET)
	public ModelAndView emailCertified(ModelAndView mv, HttpServletRequest request) {
		
		String email = request.getParameter("email");
		String authNum = randomNum();
		
		sendEmail(email,authNum);
		
		mv.setViewName("/member/emailCertified");
		mv.addObject("email", email);
		mv.addObject("authNum", authNum);
		
		return mv;
	}
	
	
	// 이메일 인증 시 랜덤 함수 만드는 메소드
	public String randomNum() {
		StringBuffer buffer = new StringBuffer();
		
		for (int i=0;i<=6;i++) {
			int n = (int)(Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	
	// 이메일 발송 메소드
	public void sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com";
		String subject = "Hear:Share 회원가입 인증번호";
		String fromName = "Hear:Share 관리자";
		String from = "HearShare20@gmail.com";
		String to1 = email;
		
		String content = "Hear:Share 회원가입 인증번호 ["+authNum+"]";
		
		try {
			Properties p = new Properties();
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.transport.protocol", "smtp");
			p.put("mail.smtp.host", host);
			p.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(p, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("HearShare20", "flqlddjtm20"); // 관리자의 gmail 아이디, 비밀번호
				}
			});
			
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
			InternetAddress[] address1 = {new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=UTF-8");
			
			Transport.send(msg);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 로그인
	@RequestMapping(value="memberLogin.do", method=RequestMethod.GET)
	public ModelAndView loginMember (String memberId, String password, ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Member member = new Member(memberId, password);
		Member loginMember = mService.loginMember(member);
		
		if (loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			mv.setViewName("home");
		} else {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer;
				writer = response.getWriter();
				writer.println("<script>alert('로그인에 실패하였습니다.'); location.href='/';</script>");
				writer.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return mv;
	}
	
	
}
