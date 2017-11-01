package com.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.menu.MenuDAO;
import com.menu.MenuDTO;
import com.util.MyServlet;

@WebServlet("/main.do")
public class MainServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String uri=req.getRequestURI();
		
		if(uri.indexOf("main.do")!=-1) {
			mainPage(req, resp);
		}
	}
	
	protected void mainPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp=req.getContextPath();
		MenuDAO dao=new MenuDAO();
		
		//�Խù� ��������
		List<MenuDTO> best=null;
		List<MenuDTO> newarr=null;
		best=dao.bestMenuPage();
		newarr=dao.newMenuPage();
		
		//����¡ ó��
		String menu_detail_url=cp+"/menu/menu_detail.do";
		
		//�������� JSP�� �ѱ� �Ӽ�
		req.setAttribute("type", "main");
		req.setAttribute("best", best);
		req.setAttribute("list", newarr);
		req.setAttribute("menu_detail_url", menu_detail_url);
		
		forward(req, resp, "/WEB-INF/views/main/main.jsp");
	}
}
