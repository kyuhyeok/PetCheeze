package com.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		System.out.println(uri);
		//uri에 따른 작업 구분
		if(uri.indexOf("login.do")!=-1) {
			loginForm(req,resp);
		}else if(uri.indexOf("login_ok.do")!=-1) {
			loginSubmit(req,resp);
		}
		
	
	}
	
	protected void loginForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		forward(req, resp, "/WEB-INF/views/member/login.jsp");
	}
	
	protected void loginSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
	}

}
