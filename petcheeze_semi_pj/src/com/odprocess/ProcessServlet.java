package com.odprocess;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cart.CartDAO;
import com.cart.CartDTO;
import com.member.MemberDAO;
import com.member.MemberDTO;
import com.member.SessionInfo;
import com.util.MyServlet;

@WebServlet("/odprocess/*")
public class ProcessServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String uri = req.getRequestURI();

		if (uri.indexOf("odlist.do") != -1) {
			odProcessList(req, resp); // 체크를 하고 주문하러온경우
		} else if (uri.indexOf("odlist_all.do") != -1) {// 전체상품주문 클릭인 경우
			odProcessAllList(req, resp);
		}else if(uri.indexOf("oddirect.do")!=-1) {  //1개만주문하는경우
			odProcessList(req, resp);
		}else if(uri.indexOf("pay_complete.do")!=-1) {  //결제완료를 누른경우
			odProcessPayCom(req,resp);
		} else if(uri.indexOf("odlist_all_no.do")!=-1) {
			//비회원 전체상품주문 클릭인 경우
			odProcessAllList_NoMem(req, resp);
		}else if(uri.indexOf("odlist_no.do")!=-1) {
			//비회원 체크하고 주문하러온 경우
			odProcessList_NoMem(req, resp);
		}else if(uri.indexOf("oddirect_no.do")!=-1) {
			//비회원 1개만 주문하는 경우
			odProcessList_NoMem(req, resp);
		}else if(uri.indexOf("pay_complete_no.do")!=-1) {
			//비회원 결제완료를 누른경우
			odProcessPayCom_NoMem(req,resp);
		}
		

	}

	/* 회원 장바구니에서 주문할 목록(체크된것만) 가져오기 */
	protected void odProcessList(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String[] cartCode = req.getParameterValues("checkOne");
		ProcessDAO dao = new ProcessDAO();
		List<ProcessDTO> list = null;

		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		/* memberDAO로 회원의 배송정보 가져오기 */
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.readMember(info.getUserId());
		int totPrice=0;
		int oneCartCode=0;
		int orderCode;
		
		ProcessDTO dto=null;
		
		if (cartCode != null) { //체크한 것이 있을때
			list = dao.getCartListOdProcess(cartCode);
			totPrice = dao.getTotPrice(cartCode);
			req.setAttribute("mode", "check");
			
			//주문, 주문상세 테이블에 넣기
			dto = new ProcessDTO();
			dto.setTotprice(totPrice);
			dto.setEmail(info.getUserId());
			dao.insertOrderBoard(dto);
			
			 orderCode = dao.readPdSeq();//주문코드
			dto.setOrdercode(orderCode);
			
			for(ProcessDTO code :list) {
				dto.setPdcode(code.getPdcode());  //상품코드
				dto.setPdcnt(code.getCartCnt()); //수량
				dto.setOrdercode(orderCode);    //주문코드
				dao.insertOrderDetail(dto);
			}
			
		}else {
			//오른쪽에 주문 버튼을 누른경우
		    oneCartCode = Integer.parseInt(req.getParameter("cartCode"));
		    dto = dao.readCart(oneCartCode);
			totPrice=dto.getCartCnt()*dto.getPdprice();
			
			//주문, 주문상세 테이블에 넣기
			dto.setTotprice(totPrice);
			dto.setEmail(info.getUserId());
			dao.insertOrderBoard(dto);
			
			 orderCode = dao.readPdSeq();//주문코드
			dto.setOrdercode(orderCode);
			dto.setPdcnt(dto.getCartCnt());
			dao.insertOrderDetail(dto);

			
			
			req.setAttribute("mode", "nocheck");
			
		}
		
		req.setAttribute("dto", dto);
		req.setAttribute("cartlist", list);
		req.setAttribute("totPrice", totPrice);
		req.setAttribute("mdto", mdto);

		forward(req, resp, "/WEB-INF/views/odprocess/odlist.jsp");
	}

	/* 회원 장바구니에서 주문할 목록(전체상품주문) 가져오기 */
	protected void odProcessAllList(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		CartDAO dao = new CartDAO();
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		int totPrice = 0;
		// 해당 아이디의 장바구니목록 가져오기

		List<CartDTO> clist = dao.listCart(info.getUserId());
		String [] cartCode = new String[clist.size()];
		int i=0;
		for(CartDTO code :clist) {
			cartCode[i]=Integer.toString(code.getCartCode());
			i++;
		}
		ProcessDAO pdao = new ProcessDAO();
		
		List<ProcessDTO> list = pdao.getCartListOdProcess(cartCode);
		
		totPrice = dao.totPrice(info.getUserId());
		
		/* memberDAO로 회원의 배송정보 가져오기 */
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.readMember(info.getUserId());
		
		
		//주문테이블에 넣기
		ProcessDTO dto = new ProcessDTO();
		dto.setTotprice(totPrice);
		dto.setEmail(info.getUserId());
		
		pdao.insertOrderBoard(dto); 
		
		int orderCode = pdao.readPdSeq();  //생성된 주문의 시퀀스번호 가져오기
		
		for(CartDTO code :clist) {
			dto.setPdcode(code.getPdcode());  //상품코드
			dto.setPdcnt(code.getCartCnt()); //수량
			dto.setOrdercode(orderCode);    //주문코드
			pdao.insertOrderDetail(dto);
		}
		

		req.setAttribute("mode", "check");
		req.setAttribute("mdto", mdto);
		req.setAttribute("cartlist", list);
		req.setAttribute("totPrice", totPrice);
		req.setAttribute("dto", dto);
		
		forward(req, resp, "/WEB-INF/views/odprocess/odlist.jsp");
	}
	
	/*회원장바구니에서 결제를 눌렀을때*/
	protected void odProcessPayCom(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//주문상세 테이블에 넣기
	
		String payMethod = req.getParameter("paymethod");
		
		int orderCode = Integer.parseInt(req.getParameter("orderCode")); //주문코드
		
		
		ProcessDTO dto = new ProcessDTO();
		ProcessDAO dao = new ProcessDAO();
		
		dto.setOrdercode(orderCode);
		
		if(payMethod.equals("paycard")) {
			dto.setPayState("결제완료");
			dto.setPaymethod("카드");
		}else {
			dto.setPayState("입금대기중");
			dto.setPaymethod("계좌이체");
		}
		
		dao.insertPayState(dto);
		
		//배달목록 테이블에 넣기
		dto.setTaker(req.getParameter("takerName"));
		dto.setTel(req.getParameter("tel1")+req.getParameter("tel2")+req.getParameter("tel3"));
		dto.setAddr0(req.getParameter("add0"));
		dto.setAddr1(req.getParameter("add1"));
		dto.setAddr2(req.getParameter("add2"));
		

		
		if(req.getParameter("memo")!=null) {
			dto.setMemo(req.getParameter("memo"));
		}
		dao.insertDelivery(dto);
		
		
		
		//결제상세에 넣기
		String useMil = req.getParameter("useMil");
		int totPrice = Integer.parseInt(req.getParameter("totPrice"));
		dto.setUsemil(Integer.parseInt(useMil));
		dto.setTotprice(totPrice);
		dao.insertPayDetail(dto);
		
		List<ProcessDTO> list = dao.readPayComList(orderCode);
		
		
		
		req.setAttribute("paydto", dto);
		req.setAttribute("list", list);
		req.setAttribute("totPrice", totPrice);
		
		forward(req, resp, "/WEB-INF/views/odprocess/complete.jsp");  // 주문 목록 페이지 보여주는 곳으로 가기로 수정하기
	}
	
	/*비회원 전체주문을 눌럿을때*/
	protected void odProcessAllList_NoMem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		List<ProcessDTO> list = new ArrayList<>();
		
		//쿠키 가져오기
		Cookie [] cookie = req.getCookies();
		ProcessDTO dto = null;
		ProcessDAO dao = new ProcessDAO();
		int totPrice=0;
		
		//쿠키 이름(pdcode) 에 맞는 정보들 (이미지, 상품이름,판매가 등등 ,+수량) 정보를 담은dto list 가져오기
		if(cookie!=null) {
			for(Cookie c : cookie) {
				if(Pattern.matches("^[0-9]+$", c.getName())) {
					dto= dao.readPdCode(Integer.parseInt(c.getName()));
					dto.setCartCnt(Integer.parseInt(c.getValue()));
					totPrice+=dto.getPdprice()*dto.getCartCnt();
					list.add(dto);
				}		
			}
		}
		
		req.setAttribute("totPrice", totPrice);
		req.setAttribute("mode", "check");
		req.setAttribute("cartlist", list);
		//forward 해주기
		forward(req, resp, "/WEB-INF/views/odprocess/odlist.jsp");
	}
	
	/*비회원 체크하고 or 한개만 주문을 눌럿을때*/
	protected void odProcessList_NoMem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		//checkOne 체크박스배열들 받아오기 (pdcode임)
		String [] checkbox = req.getParameterValues("checkOne");
		ProcessDTO dto = null;
		ProcessDAO dao = new ProcessDAO();
		List<ProcessDTO> list = new ArrayList<>();
		int totPrice=0;
		
		Cookie []  cookie = req.getCookies();
		
		//pdcode에 맞는 정보들(이미지, 상품, 이름 등등)의 정보를 담은dto list 가져오기
		if(checkbox!=null) {
		for(String pd : checkbox) {
			dto = dao.readPdCode(Integer.parseInt(pd));
	
			for(Cookie ck:cookie) {
				if(pd.equals(ck.getName())) {
					dto.setCartCnt(Integer.parseInt(ck.getValue()));
					totPrice+=dto.getCartCnt()*dto.getPdprice();
					list.add(dto);
				}
			}
		}

		req.setAttribute("totPrice", totPrice);
		req.setAttribute("mode", "check");
		req.setAttribute("cartlist", list);
		//forward 해주기
		
		}else {
			
			String pdCode = req.getParameter("pdCode");
			dto=dao.readPdCode(Integer.parseInt(pdCode));
			
			for(Cookie ck:cookie) {
				if(pdCode.equals(ck.getName())) {
					dto.setCartCnt(Integer.parseInt(ck.getValue()));
					totPrice+=dto.getCartCnt()*dto.getPdprice();
					
				}
			}
			
			req.setAttribute("dto",dto);
			req.setAttribute("mode", "nocheck");
			req.setAttribute("totPrice",totPrice);
		}
		
		forward(req, resp, "/WEB-INF/views/odprocess/odlist.jsp");
	}
	
	/*비회원 결제완료을 눌럿을때*/
	protected void odProcessPayCom_NoMem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
	
		ProcessDAO dao = new ProcessDAO();
		ProcessDTO dto = new ProcessDTO();
		
		//고객테이블에 넣기
		dto.setEmail(req.getParameter("takerEmail"));
		dto.setTaker(req.getParameter("takerName"));
		dto.setAddr0(req.getParameter("add0"));
		dto.setAddr1(req.getParameter("add1"));
		dto.setAddr2(req.getParameter("add2"));
		dto.setTel(req.getParameter("tel1")+req.getParameter("tel2")+req.getParameter("tel3"));
		
		dao.insertMember1(dto);
		//totPrice
		//주문테이블에넣기
		dto.setTotprice(Integer.parseInt(req.getParameter("totPrice")));
		dao.insertOrderBoard(dto);

		
		//주문상세에 넣기
		int orderCode = dao.readPdSeq();
		
		
		
		//결제상세에 넣기
		
		
		//배송주소록에 넣기
		//주문상세 테이블에 넣기
		
			String payMethod = req.getParameter("paymethod");
		
			dto.setOrdercode(orderCode);
			
			if(payMethod.equals("paycard")) {
				dto.setPayState("결제완료");
				dto.setPaymethod("카드");
			}else {
				dto.setPayState("입금대기중");
				dto.setPaymethod("계좌이체");
			}
			
			dao.insertPayState(dto);  
			
			//배달목록 테이블에 넣기
			dto.setEmail(req.getParameter("takerEmail"));
			dto.setTaker(req.getParameter("takerName"));
			dto.setTel(req.getParameter("tel1")+req.getParameter("tel2")+req.getParameter("tel3"));
			dto.setAddr0(req.getParameter("add0"));
			dto.setAddr1(req.getParameter("add1"));
			dto.setAddr2(req.getParameter("add2"));

			if(req.getParameter("memo")!=null) {
				dto.setMemo(req.getParameter("memo"));
			}
			dao.insertDelivery(dto);  

			//결제상세에 넣기
			int totPrice = Integer.parseInt(req.getParameter("totPrice"));
			dto.setUsemil(0);
			dto.setTotprice(totPrice);
			dao.insertPayDetail(dto);
			
			req.setAttribute("totPrice", totPrice);
			req.setAttribute("paydto",dto);
			forward(req, resp, "/WEB-INF/views/odprocess/complete.jsp");  // 주문 목록 페이지 보여주는 곳으로 가기로 수정하기
			
	}
	
	
	
	
}









