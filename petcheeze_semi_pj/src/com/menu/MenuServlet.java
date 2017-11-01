package com.menu;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.SessionInfo;
import com.util.MenuUtil;
import com.util.MyServlet;

@WebServlet("/menu/*")
public class MenuServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri=req.getRequestURI();
		
		if(uri.indexOf("menu.do")!=-1) {
			menuPage(req, resp);
		}else if(uri.indexOf("menu_create.do")!=-1) {
			menuCreate(req, resp);
		}else if(uri.indexOf("menu_create_ok.do")!=-1) {
			menuCreateOk(req, resp);
		}else if(uri.indexOf("menu_detail.do")!=-1) {
			menuDetail(req, resp);
		}else if(uri.indexOf("menu_update.do")!=-1) {
			menuUpdate(req, resp);
		}else if(uri.indexOf("menu_update_ok.do")!=-1) {
			menuUpdateOK(req, resp);
		}else if(uri.indexOf("menu_delete.do")!=-1) {
			menuDelete(req, resp);
		}
	}
	
	protected void menuPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp=req.getContextPath();
		MenuDAO dao=new MenuDAO();
		MenuUtil util=new MenuUtil();
		
		//페이지 번호 및 메뉴 분류 파라미터
		int pdKindcode=Integer.parseInt(req.getParameter("pdkindcode"));
		String page=req.getParameter("page");
		int current_page=1;
		if(page!=null)
			current_page=Integer.parseInt(page);
		
		//전체 데이터 개수
		int dataCount=dao.dataCount();
		
		//전체 페이지 수
		int rows=10;
		int total_page=util.pageCount(rows, dataCount);
		
		if(current_page>total_page)
			current_page=total_page;
		
		//게시물 가져올 처음과 마지막
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		
		//게시물 가져오기
		List<MenuDTO> list=null;
		list=dao.listMenuPage(start, end, pdKindcode);
		
		//페이징 처리
		String list_url=cp+"/menu/menu.do?pdkindcode="+pdKindcode;
		String menu_detail_url=cp+"/menu/menu_detail.do?page="+current_page+"&pdkindcode="+pdKindcode;
		
		String paging=util.paging(current_page, total_page, list_url);
		
		//포워딩할 JSP로 넘길 속성
		req.setAttribute("pdkindcode", pdKindcode);
		req.setAttribute("list", list);
		req.setAttribute("page", current_page);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("menu_detail_url", menu_detail_url);
		req.setAttribute("paging", paging);
		
		//JSP로 포워딩
		String path="/WEB-INF/views/menu/menu_page.jsp";
		forward(req, resp, path);
	}
	
	protected void menuCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("mode", "created");
		
		String path="/WEB-INF/views/menu/menu_detail.jsp";
		forward(req, resp, path);
	}
	
	protected void menuCreateOk(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String cp=req.getContextPath();
		String pdKindcode=req.getParameter("pdkindcode");
		
		if(! info.getUserId().equals("admin")) {
			resp.sendRedirect(cp+"/menu/menu.do?pdkindcode="+pdKindcode);
			return;
		}
		
		MenuDAO dao=new MenuDAO();
		MenuDTO dto=new MenuDTO();
		
		dto.setPdContent(req.getParameter("pdcontent"));
		dto.setPdImage(req.getParameter("pdimage"));
		dto.setPdMaker(req.getParameter("pdmaker"));
		dto.setPdMil(Integer.parseInt(req.getParameter("pdmil")));
		dto.setPdName(req.getParameter("pdname"));
		dto.setPdPrice(Integer.parseInt(req.getParameter("pdprice")));
		dto.setPdKindcode(Integer.parseInt(req.getParameter("pdkindcode")));
		
		dao.insertMenu(dto);
		
		resp.sendRedirect(cp+"/menu/menu.do?pdkindcode="+pdKindcode);		
	}
	
	protected void menuDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp=req.getContextPath();
		String page=req.getParameter("page");
		int pdCode=Integer.parseInt(req.getParameter("pdcode"));
		String pdKindcode=req.getParameter("pdKindcode");
		
		MenuDAO dao=new MenuDAO();
		MenuDTO dto=new MenuDTO();
		dto=dao.readMenu(pdCode);
		if(dto==null) {
			resp.sendRedirect(cp+"/menu/menu.do?pdkindcode="+pdKindcode+"&page="+page);
			return;
		}
		
		req.setAttribute("dto", dto);
		req.setAttribute("page", page);
		req.setAttribute("pdkindcode", pdKindcode);
		
		String path="/WEB-INF/views/menu/menu_detail.jsp";
		forward(req, resp, path);
	}
	
	protected void menuUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//준비중
	}
	
	protected void menuUpdateOK(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//준비중
	}
	
	protected void menuDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String cp=req.getContextPath();
		String pdKindcode=req.getParameter("pdkindcode");
		String page=req.getParameter("page");
		int pdCode=Integer.parseInt(req.getParameter("pdcode"));
		
		if(! info.getUserId().equals("admin")) {
			resp.sendRedirect(cp+"/menu/menu.do?pdkindcode="+pdKindcode+"&page="+page);
			return;
		}
		
		MenuDAO dao=new MenuDAO();
		MenuDTO dto=new MenuDTO();
		dto=dao.readMenu(pdCode);
		if(dto==null) {
			resp.sendRedirect(cp+"/menu/menu.do?pdkindcode="+pdKindcode+"&page="+page);
			return;
		}
		
		dao.deleteMenu(pdCode);
		resp.sendRedirect(cp+"/menu/menu.do?pdkindcode="+pdKindcode+"&page="+page);		
	}
	
}
