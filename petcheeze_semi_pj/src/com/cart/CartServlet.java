package com.cart;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.SessionInfo;
import com.util.MyServlet;
@WebServlet("/cart/*")
public class CartServlet extends MyServlet{	
	
private static final long serialVersionUID = 1L;

@Override
protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.setCharacterEncoding("utf-8");
	
	String uri = req.getRequestURI();// 클라이언트가 요청한 uri주소 가져오기
	//System.out.println(uri);
	
	/*
	HttpSession session = req.getSession();
	SessionInfo info =(SessionInfo)session.getAttribute("member");
	String cp = req.getContextPath();
	if(info==null) {
		resp.sendRedirect(cp+"/member/login.do");
		return;
	}
	*/
	
	if(uri.indexOf("pdpage.do")!=-1) {
		forward(req, resp, "/WEB-INF/views/cart/pdimgpage.jsp");
	}
	
	if(uri.indexOf("list.do")!=-1) {
		cartList(req,resp);  //장바구니목록가져오기
	}else if(uri.indexOf("list2.do")!=-1) {
		cartListNoMem(req,resp); //비회원 장바구니보기
	}else if(uri.indexOf("insertno.do")!=-1){
		insertCartNoMem(req,resp);  //비회원 장바구니 추가
	}else if(uri.indexOf("insertCart_ok.do")!=-1) {
		insertCart(req,resp);  //회원 장바구니 추가
	}else if(uri.indexOf("updateCart.do")!=-1) {
		updatePdCount(req,resp);
	}else if(uri.indexOf("deleteOne.do")!=-1) {
		deleteCart(req, resp);
	}else if(uri.indexOf("deleteList.do")!=-1) {
		deleteList(req, resp);
	}else if(uri.indexOf("removeAll.do")!=-1) {
		removeAll(req,resp);
	}else if(uri.indexOf("updateCart_no.do")!=-1) {
		//쿠키 _수량 변경 (updateCart_no.do)
		updatePdCount_NoMem(req,resp);
	}else if(uri.indexOf("deleteOne_no.do")!=-1) {
		//쿠키 선택삭제 (deleteOne_no.do)
		deleteCart_NoMem(req,resp);
	}else if(uri.indexOf("deleteList_no.do")!=-1) {
		//쿠키 전체삭제(deleteList_no.do)
		deleteList_NoMem(req, resp);
	}else if(uri.indexOf("removeAll_no.do")!=-1) {
		//쿠키 장바구니 비우기(removeAll_no.do)
		removeAll_NoMem(req,resp);
	}

	
	//쿠키 _수량 변경 (updateCart_no.do)
	//쿠키 전체삭제 (deleteOne_no.do)
	//쿠키 선택삭제(deleteList_no.do)
	//쿠키 장바구니 비우기(removeAll_no.do)
	
	
	
	
	
}
//장바구니 목록 불러오기
protected void cartList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	//String cp = req.getContextPath();
	CartDAO dao = new CartDAO();
	
	HttpSession session = req.getSession();
	SessionInfo info = (SessionInfo)session.getAttribute("member");
	
	String searchKey = req.getParameter("searchKey");
	String searchValue = req.getParameter("searchValue");
	if(searchKey==null) {
		searchKey="";
		searchValue="";
	}
	
	if(req.getMethod().equalsIgnoreCase("GET")) {
		searchValue=URLDecoder.decode(searchValue, "utf-8");
	}
	
	//해당 고객의 장바구니상품 갯수
	int dataCount=dao.dataCount(info.getUserId());
	int totPrice = dao.totPrice(info.getUserId());
	
	List<CartDTO> list =null;
	
	list=dao.listCart(info.getUserId());
	
	//글번호 매기기
	int listNum,num=1;
	Iterator<CartDTO> it = list.iterator();
	while(it.hasNext()) {
		CartDTO dto = it.next();
		listNum=num;
		dto.setListNum(listNum);
		num++;
	}
	

	
	req.setAttribute("list", list);
	req.setAttribute("dataCount", dataCount);
	req.setAttribute("totPrice", totPrice);
	
	forward(req, resp, "/WEB-INF/views/cart/list.jsp");
}

//비회원인 경우 장바구니 목록 불러오기
protected void cartListNoMem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	

	List<CartDTO> pdlist = new ArrayList<>();
	CartDAO dao = new CartDAO();
	CartDTO dto = null;
	
	Cookie[] ck = req.getCookies();  //쿠키내용 가져오기
	int dataCount=0;
	int totPrice=0;

	if(ck!=null){
		for(Cookie c: ck) {
			//if(!c.getName().startsWith("JS")&&!c.getName().startsWith("dt"))
			if(Pattern.matches("^[0-9]+$", c.getName())){ 
				int pdcode= Integer.parseInt(c.getName());
				dto=dao.readCartList(pdcode);
				
				if(dto!=null) {
					dto.setCartCnt(Integer.parseInt(c.getValue()));
					dataCount++;
					pdlist.add(dto);
					totPrice+=dto.getPdPrice()*dto.getCartCnt();
				}
				req.setAttribute("pdlist", pdlist);
				req.setAttribute("dataCount", dataCount);
				req.setAttribute("totPrice", totPrice);
				
			}

		}
		
	}


	
	forward(req, resp, "/WEB-INF/views/cart/list.jsp");
	
}



//비회원인경우 장바구니 추가
protected void insertCartNoMem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String cp = req.getContextPath();

	//쿠키생성
	//상품코드 쿠키에 저장
	
	Cookie [] ck = req.getCookies();
	int cnt=0;

	//이미 같은 상품을 장바구니에 넣은경우 --> 수량 추가한 만큼 증가
	for(Cookie c: ck) {
		if(req.getParameter("pdcode").equals(c.getName())) {
			cnt=Integer.parseInt(c.getValue());
			cnt+=Integer.parseInt(req.getParameter("cnt"));
			
			Cookie pd1 = new Cookie(req.getParameter("pdcode"), Integer.toString(cnt));
			pd1.setPath("/");
			resp.addCookie(pd1);
			//원래 보던 목록페이지로 돌아가야함. 
			resp.sendRedirect(cp+"/cart/list2.do");
			return;
		}
	}
	
	Cookie pd1 = new Cookie(req.getParameter("pdcode"), req.getParameter("cnt")); //pdcode는 유일함. 
	pd1.setPath("/");
	resp.addCookie(pd1);


	
	//원래 보던 목록페이지로 돌아가야함. 
	resp.sendRedirect(cp+"/cart/list2.do");
	
}

//회원인경우 장바구니 추가
protected void insertCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	String cp = req.getContextPath();
	CartDAO dao = new CartDAO();
	CartDTO dto = null;
	
	HttpSession session = req.getSession();
	SessionInfo info = (SessionInfo)session.getAttribute("member");
	
	dto = dao.readCheckSamePd(Integer.parseInt(req.getParameter("pdcode")));

	if(dto!=null) {//이미 같은 물건이 존재하는 경우
		int chagecnt = dto.getCartCnt()+Integer.parseInt(req.getParameter("cnt"));
		dto.setCartCnt(chagecnt);
		dao.updatePdCount(dto);
		
	}else { //같은 물건을 장바구니에 담지 않았으면
	//String page = req.getParameter("page");
		dto=new CartDTO();
		dto.setPdcode(Integer.parseInt(req.getParameter("pdcode")));
		dto.setCartCnt(Integer.parseInt(req.getParameter("cnt")));
		dto.setEmail(info.getUserId());

		int result = dao.insertCart_Member(dto);
	
		if(result!=1) {
			System.out.println("입력 실패");
			resp.sendRedirect(cp);
			return;
		}
	}
	//원래 보던 목록페이지로 돌아가야함. 
	resp.sendRedirect(cp+"/cart/list.do");

	
}


protected void updatePdCount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	CartDAO dao = new CartDAO();
	String cp = req.getContextPath();
	String[] cartCode = req.getParameterValues("cartCode");
	
	for(int i=0;i<cartCode.length;i++) {
		CartDTO dto = new CartDTO();
		dto.setCartCode(Integer.parseInt(cartCode[i]));
		dto.setCartCnt(Integer.parseInt(req.getParameter(cartCode[i])));
		dao.updatePdCount(dto);
	}

	
	resp.sendRedirect(cp+"/cart/list.do");
	
}

protected void deleteList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String[] cartCode = req.getParameterValues("checkOne");
	CartDAO dao = new CartDAO();
	String cp = req.getContextPath();
	
	dao.deleteCartList(cartCode);
	
	resp.sendRedirect(cp+"/cart/list.do");
	
}
protected void deleteCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	CartDAO dao = new CartDAO();
	String cp = req.getContextPath();
	int cartCode = Integer.parseInt(req.getParameter("cartCode"));
	
	dao.deleteCart(cartCode);
	
	resp.sendRedirect(cp+"/cart/list.do");
}
protected void removeAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	CartDAO dao = new CartDAO();
	
	HttpSession session = req.getSession();
	SessionInfo info = (SessionInfo)session.getAttribute("member");
	String cp = req.getContextPath();
	dao.removeAllCart(info.getUserId());
	
	resp.sendRedirect(cp+"/cart/list.do");
}

//쿠키 _수량 변경 (updateCart_no.do)
protected void updatePdCount_NoMem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	String cp = req.getContextPath();
	String [] pdcode= req.getParameterValues("pdcode");
	Cookie [] ck = req.getCookies();
	
	for(Cookie c: ck) {
		for(int i=0;i<pdcode.length;i++) {
			if(pdcode[i].equals(c.getName())) {
				Cookie pd1 = new Cookie(pdcode[i], req.getParameter(pdcode[i]));
				
				pd1.setPath("/");
				resp.addCookie(pd1);
			}
		}
		
	}

	resp.sendRedirect(cp+"/cart/list2.do");
	return;
	
}

//쿠키 선택삭제 (deleteOne_no.do)
protected void deleteCart_NoMem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	System.out.println("쿠키선택삭제");
	
	String cp = req.getContextPath();
	String pdCode = req.getParameter("pdCode");

	Cookie c1 = new Cookie(pdCode, null);
	c1.setMaxAge(0);
	c1.setPath("/");
	resp.addCookie(c1);
	
	resp.sendRedirect(cp+"/cart/list2.do");
	
}

//쿠키 전체삭제(deleteList_no.do)
protected void deleteList_NoMem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	System.out.println("쿠키리스트삭제");
	
	String[] pdcode = req.getParameterValues("checkOne");
	String cp = req.getContextPath();

	
	Cookie [] ck = req.getCookies();
	
	if(ck!=null) {
		for(Cookie c: ck) {
			
			for(int i=0;i<pdcode.length;i++) {
				if(c.getName().equals(pdcode[i])) {
					Cookie pd1 = new Cookie(pdcode[i], null);
					pd1.setMaxAge(0);
					pd1.setPath("/");
					resp.addCookie(pd1);
				}
			}
		}
	}

	resp.sendRedirect(cp+"/cart/list2.do");
 }


//쿠키 장바구니 비우기 
  protected void removeAll_NoMem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	System.out.println("쿠키 장바구니 비우기");
	
	Cookie [] cookie = req.getCookies();
	
	for(Cookie c : cookie) {
		if(Pattern.matches("^[0-9]+$", c.getName())) {
			Cookie c1 = new Cookie(c.getName(), null);
			c1.setMaxAge(0);
			c1.setPath("/");
			resp.addCookie(c1);
		}
		
	}
	String cp = req.getContextPath();
	
	resp.sendRedirect(cp+"/cart/list2.do");
  }
}




