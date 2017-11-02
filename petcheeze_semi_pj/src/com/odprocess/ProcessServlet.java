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
			odProcessList(req, resp); // üũ�� �ϰ� �ֹ��Ϸ��°��
		} else if (uri.indexOf("odlist_all.do") != -1) {// ��ü��ǰ�ֹ� Ŭ���� ���
			odProcessAllList(req, resp);
		}else if(uri.indexOf("oddirect.do")!=-1) {  //1�����ֹ��ϴ°��
			odProcessList(req, resp);
		}else if(uri.indexOf("pay_complete.do")!=-1) {  //�����ϷḦ �������
			odProcessPayCom(req,resp);
		} else if(uri.indexOf("odlist_all_no.do")!=-1) {
			//��ȸ�� ��ü��ǰ�ֹ� Ŭ���� ���
			odProcessAllList_NoMem(req, resp);
		}else if(uri.indexOf("odlist_no.do")!=-1) {
			//��ȸ�� üũ�ϰ� �ֹ��Ϸ��� ���
			odProcessList_NoMem(req, resp);
		}else if(uri.indexOf("oddirect_no.do")!=-1) {
			//��ȸ�� 1���� �ֹ��ϴ� ���
			odProcessList_NoMem(req, resp);
		}else if(uri.indexOf("pay_complete_no.do")!=-1) {
			//��ȸ�� �����ϷḦ �������
			odProcessPayCom_NoMem(req,resp);
		}
		

	}

	/* ȸ�� ��ٱ��Ͽ��� �ֹ��� ���(üũ�Ȱ͸�) �������� */
	protected void odProcessList(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String[] cartCode = req.getParameterValues("checkOne");
		ProcessDAO dao = new ProcessDAO();
		List<ProcessDTO> list = null;

		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		/* memberDAO�� ȸ���� ������� �������� */
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.readMember(info.getUserId());
		int totPrice=0;
		int oneCartCode=0;
		int orderCode;
		
		ProcessDTO dto=null;
		
		if (cartCode != null) { //üũ�� ���� ������
			list = dao.getCartListOdProcess(cartCode);
			totPrice = dao.getTotPrice(cartCode);
			req.setAttribute("mode", "check");
			
			//�ֹ�, �ֹ��� ���̺� �ֱ�
			dto = new ProcessDTO();
			dto.setTotprice(totPrice);
			dto.setEmail(info.getUserId());
			dao.insertOrderBoard(dto);
			
			 orderCode = dao.readPdSeq();//�ֹ��ڵ�
			dto.setOrdercode(orderCode);
			
			for(ProcessDTO code :list) {
				dto.setPdcode(code.getPdcode());  //��ǰ�ڵ�
				dto.setPdcnt(code.getCartCnt()); //����
				dto.setOrdercode(orderCode);    //�ֹ��ڵ�
				dao.insertOrderDetail(dto);
			}
			
		}else {
			//�����ʿ� �ֹ� ��ư�� �������
		    oneCartCode = Integer.parseInt(req.getParameter("cartCode"));
		    dto = dao.readCart(oneCartCode);
			totPrice=dto.getCartCnt()*dto.getPdprice();
			
			//�ֹ�, �ֹ��� ���̺� �ֱ�
			dto.setTotprice(totPrice);
			dto.setEmail(info.getUserId());
			dao.insertOrderBoard(dto);
			
			 orderCode = dao.readPdSeq();//�ֹ��ڵ�
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

	/* ȸ�� ��ٱ��Ͽ��� �ֹ��� ���(��ü��ǰ�ֹ�) �������� */
	protected void odProcessAllList(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		CartDAO dao = new CartDAO();
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		int totPrice = 0;
		// �ش� ���̵��� ��ٱ��ϸ�� ��������

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
		
		/* memberDAO�� ȸ���� ������� �������� */
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.readMember(info.getUserId());
		
		
		//�ֹ����̺� �ֱ�
		ProcessDTO dto = new ProcessDTO();
		dto.setTotprice(totPrice);
		dto.setEmail(info.getUserId());
		
		pdao.insertOrderBoard(dto); 
		
		int orderCode = pdao.readPdSeq();  //������ �ֹ��� ��������ȣ ��������
		
		for(CartDTO code :clist) {
			dto.setPdcode(code.getPdcode());  //��ǰ�ڵ�
			dto.setPdcnt(code.getCartCnt()); //����
			dto.setOrdercode(orderCode);    //�ֹ��ڵ�
			pdao.insertOrderDetail(dto);
		}
		

		req.setAttribute("mode", "check");
		req.setAttribute("mdto", mdto);
		req.setAttribute("cartlist", list);
		req.setAttribute("totPrice", totPrice);
		req.setAttribute("dto", dto);
		
		forward(req, resp, "/WEB-INF/views/odprocess/odlist.jsp");
	}
	
	/*ȸ����ٱ��Ͽ��� ������ ��������*/
	protected void odProcessPayCom(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//�ֹ��� ���̺� �ֱ�
	
		String payMethod = req.getParameter("paymethod");
		
		int orderCode = Integer.parseInt(req.getParameter("orderCode")); //�ֹ��ڵ�
		
		
		ProcessDTO dto = new ProcessDTO();
		ProcessDAO dao = new ProcessDAO();
		
		dto.setOrdercode(orderCode);
		
		if(payMethod.equals("paycard")) {
			dto.setPayState("�����Ϸ�");
			dto.setPaymethod("ī��");
		}else {
			dto.setPayState("�Աݴ����");
			dto.setPaymethod("������ü");
		}
		
		dao.insertPayState(dto);
		
		//��޸�� ���̺� �ֱ�
		dto.setTaker(req.getParameter("takerName"));
		dto.setTel(req.getParameter("tel1")+req.getParameter("tel2")+req.getParameter("tel3"));
		dto.setAddr0(req.getParameter("add0"));
		dto.setAddr1(req.getParameter("add1"));
		dto.setAddr2(req.getParameter("add2"));
		

		
		if(req.getParameter("memo")!=null) {
			dto.setMemo(req.getParameter("memo"));
		}
		dao.insertDelivery(dto);
		
		
		
		//�����󼼿� �ֱ�
		String useMil = req.getParameter("useMil");
		int totPrice = Integer.parseInt(req.getParameter("totPrice"));
		dto.setUsemil(Integer.parseInt(useMil));
		dto.setTotprice(totPrice);
		dao.insertPayDetail(dto);
		
		List<ProcessDTO> list = dao.readPayComList(orderCode);
		
		
		
		req.setAttribute("paydto", dto);
		req.setAttribute("list", list);
		req.setAttribute("totPrice", totPrice);
		
		forward(req, resp, "/WEB-INF/views/odprocess/complete.jsp");  // �ֹ� ��� ������ �����ִ� ������ ����� �����ϱ�
	}
	
	/*��ȸ�� ��ü�ֹ��� ��������*/
	protected void odProcessAllList_NoMem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		List<ProcessDTO> list = new ArrayList<>();
		
		//��Ű ��������
		Cookie [] cookie = req.getCookies();
		ProcessDTO dto = null;
		ProcessDAO dao = new ProcessDAO();
		int totPrice=0;
		
		//��Ű �̸�(pdcode) �� �´� ������ (�̹���, ��ǰ�̸�,�ǸŰ� ��� ,+����) ������ ����dto list ��������
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
		//forward ���ֱ�
		forward(req, resp, "/WEB-INF/views/odprocess/odlist.jsp");
	}
	
	/*��ȸ�� üũ�ϰ� or �Ѱ��� �ֹ��� ��������*/
	protected void odProcessList_NoMem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		//checkOne üũ�ڽ��迭�� �޾ƿ��� (pdcode��)
		String [] checkbox = req.getParameterValues("checkOne");
		ProcessDTO dto = null;
		ProcessDAO dao = new ProcessDAO();
		List<ProcessDTO> list = new ArrayList<>();
		int totPrice=0;
		
		Cookie []  cookie = req.getCookies();
		
		//pdcode�� �´� ������(�̹���, ��ǰ, �̸� ���)�� ������ ����dto list ��������
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
		//forward ���ֱ�
		
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
	
	/*��ȸ�� �����Ϸ��� ��������*/
	protected void odProcessPayCom_NoMem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
	
		ProcessDAO dao = new ProcessDAO();
		ProcessDTO dto = new ProcessDTO();
		
		//�����̺� �ֱ�
		dto.setEmail(req.getParameter("takerEmail"));
		dto.setTaker(req.getParameter("takerName"));
		dto.setAddr0(req.getParameter("add0"));
		dto.setAddr1(req.getParameter("add1"));
		dto.setAddr2(req.getParameter("add2"));
		dto.setTel(req.getParameter("tel1")+req.getParameter("tel2")+req.getParameter("tel3"));
		
		dao.insertMember1(dto);
		//totPrice
		//�ֹ����̺��ֱ�
		dto.setTotprice(Integer.parseInt(req.getParameter("totPrice")));
		dao.insertOrderBoard(dto);

		
		//�ֹ��󼼿� �ֱ�
		int orderCode = dao.readPdSeq();
		
		
		
		//�����󼼿� �ֱ�
		
		
		//����ּҷϿ� �ֱ�
		//�ֹ��� ���̺� �ֱ�
		
			String payMethod = req.getParameter("paymethod");
		
			dto.setOrdercode(orderCode);
			
			if(payMethod.equals("paycard")) {
				dto.setPayState("�����Ϸ�");
				dto.setPaymethod("ī��");
			}else {
				dto.setPayState("�Աݴ����");
				dto.setPaymethod("������ü");
			}
			
			dao.insertPayState(dto);  
			
			//��޸�� ���̺� �ֱ�
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

			//�����󼼿� �ֱ�
			int totPrice = Integer.parseInt(req.getParameter("totPrice"));
			dto.setUsemil(0);
			dto.setTotprice(totPrice);
			dao.insertPayDetail(dto);
			
			req.setAttribute("totPrice", totPrice);
			req.setAttribute("paydto",dto);
			forward(req, resp, "/WEB-INF/views/odprocess/complete.jsp");  // �ֹ� ��� ������ �����ִ� ������ ����� �����ϱ�
			
	}
	
	
	
	
}









