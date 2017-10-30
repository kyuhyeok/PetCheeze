package com.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@ WebServlet("/member/*")
public class MemberServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp,String path) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
	
		//uri�� ���� �۾� ����
		if(uri.indexOf("login.do")!=-1) {
			loginForm(req,resp);
		}else if(uri.indexOf("login_ok.do")!=-1) {
			loginSubmit(req,resp);
		}else if(uri.indexOf("logout.do")!=-1) {
			logout(req, resp);
		}else if (uri.indexOf("member.do")!=-1) {
			memberForm(req, resp);
		}else if (uri.indexOf("member_ok.do")!=-1) {
			memberSubmit(req, resp);
		}else if (uri.indexOf("pwd.do")!=-1) {
			pwdForm(req, resp);
		}else if (uri.indexOf("pwd_ok.do")!=-1) {
			pwdSubmit(req, resp);
		}else if (uri.indexOf("update_ok.do")!=-1) {
			updateSubmit(req, resp);
		}else if (uri.indexOf("email_check.do")!=-1) {
			checkEmail(req, resp);
		}else if (uri.indexOf("mypage.do")!=-1) {
			mypageForm(req, resp);
		}
		
	
	}
	
	protected void loginForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		forward(req, resp, "/WEB-INF/views/member/login.jsp");
	}
	
	protected void loginSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		HttpSession session = req.getSession();
		
		MemberDAO dao = new MemberDAO();
		String email = req.getParameter("userId");
		String pwd = req.getParameter("userPwd");
		
		MemberDTO dto = dao.readMember(email);
		//System.out.println(dto.getUserEmail());
		//System.out.println(dto.getUserPwd());
		
		if(dto==null||!dto.getUserPwd().equals(pwd)) {
			req.setAttribute("message", "���̵� �Ǵ� �н����尡 ��ġ���� �ʽ��ϴ�.");
			forward(req, resp, "/WEB-INF/views/member/login.jsp");
			return;
		}
		
		SessionInfo info = new SessionInfo();
		info.setUserId(email);
		info.setUserName(dto.getUserName());
		
		session.setAttribute("member", info);
		
		String cp = req.getContextPath();
		
		resp.sendRedirect(cp);
		
	}
	
	protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		HttpSession session=req.getSession();
		
		session.removeAttribute("member");
		session.invalidate();
		
		String cp=req.getContextPath();
		resp.sendRedirect(cp);
		
	}
	
	protected void memberForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		req.setAttribute("mode", "created");
		req.setAttribute("title", "ȸ������");
		
		forward(req, resp, "/WEB-INF/views/member/member.jsp");
		
	}
	
	
	protected void mypageForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		req.setAttribute("mode", "created");
		req.setAttribute("title", "ȸ������");
		
		forward(req, resp, "/WEB-INF/views/member/mypage.jsp");
		
	}
	
	protected void checkEmail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		MemberDAO dao=new MemberDAO();
		MemberDTO dto=null;
		
		String userEmail=(req.getParameter("email1")+"@"+req.getParameter("email2"));
		
		dto=dao.readMember(userEmail);
		if(dto==null) {
			String message="���� ������ �̸��� �Դϴ�..";
			
			req.setAttribute("title", "ȸ������");
			req.setAttribute("mode", "created");
			req.setAttribute("message", message);
			forward(req, resp, "/WEB-INF/views/member/member.jsp");
			return;
		}
		
		StringBuffer sb=new StringBuffer();
		sb.append("<b>"+dto.getUserEmail()+"</b>�� ������� �̸��� �Դϴ�..");
		sb.append("�ٸ� �̸����� ������ֽñ� �ٶ��ϴ�.<br>");
		
		req.setAttribute("title", "ȸ������");
		req.setAttribute("message", sb.toString());
		
		forward(req, resp,"/WEB-INF/views/member/member.jsp");
		
		String cp=req.getContextPath();
		resp.sendRedirect(cp);
		
		
	}
	
	
	
	
	protected void memberSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		MemberDAO dao=new MemberDAO();
		MemberDTO dto=new MemberDTO();
		
		dto.setUserEmail(req.getParameter("email1")+"@"+req.getParameter("email2"));
		dto.setUserName(req.getParameter("userName"));
		dto.setUserPwd(req.getParameter("userPwd"));
		dto.setBirth(req.getParameter("birth"));
		dto.setAddr0(req.getParameter("addr0"));
		dto.setAddr1(req.getParameter("addr1"));
		dto.setAddr2(req.getParameter("addr2"));
		dto.setTel(req.getParameter("tel1")+"-"+req.getParameter("tel2")+"-"+req.getParameter("tel3"));
		dto.setPname(req.getParameter("pname"));
		
		int result=dao.insertMember(dto);
		if(result==0) {
			String message="ȸ�� ������ ���� �߽��ϴ�.";
			
			req.setAttribute("title", "ȸ������");
			req.setAttribute("mode", "created");
			req.setAttribute("message", message);
			forward(req, resp, "/WEB-INF/views/member/member.jsp");
			return;
		}
		
		StringBuffer sb=new StringBuffer();
		sb.append("<b>"+dto.getUserName()+"</b>�� ȸ�������� �Ǿ����ϴ�.");
		sb.append("����ȭ������ �̵��Ͽ� �α��� �Ͻñ� �ٶ��ϴ�.<br>");
		
		req.setAttribute("title", "ȸ������");
		req.setAttribute("message", sb.toString());
		
		forward(req, resp,"/WEB-INF/views/member/complete.jsp");
		
		String cp=req.getContextPath();
		resp.sendRedirect(cp);
		
		
	}
	
	protected void pwdForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		
	}
	
	protected void pwdSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		
	}
	
	protected void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		
	}

}


















