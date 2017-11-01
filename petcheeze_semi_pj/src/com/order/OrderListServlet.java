package com.order;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.BoardDTO;
import com.member.SessionInfo;
import com.util.MyServlet;
@WebServlet("/order/*")
public class OrderListServlet extends MyServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		String uri =req.getRequestURI();
		
		if(uri.indexOf("order_list.do")!=-1) {
			orderListForm(req,resp);
		}else if(uri.indexOf("address.do")!=-1) {
			addressForm(req,resp);
		}else if(uri.indexOf("milege.do")!=-1) {
			milegeForm(req,resp);
		}
		
	}
	
	protected void orderListForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		String duringdate=req.getParameter("duringdate");
		Calendar cal=new GregorianCalendar(Locale.KOREA);
		OrderDTO dto=new OrderDTO();
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		
		HttpSession session = req.getSession();
		SessionInfo info =(SessionInfo)session.getAttribute("member");

		OrderDAO dao =new OrderDAO();
		
		List<OrderDTO> list=dao.listOrder(info.getUserId());;
		
		
		req.setAttribute("list", list);
		
		System.out.println(dto.getTotalPrice());
		
		try {
			
			if(duringdate.equals("today")) {
				
				req.setAttribute("today", sdf.format(cal.getTime()));
				String strDate=sdf.format(cal.getTime());
				req.setAttribute("duringdate", strDate);
				
			}else if(duringdate.equals("week")) {
				
				req.setAttribute("today", sdf.format(cal.getTime()));
				cal.setTime(new Date());
				cal.add(Calendar.DAY_OF_YEAR, -7);
				String strDate=sdf.format(cal.getTime());
				req.setAttribute("duringdate", strDate);
				
			}else if(duringdate.equals("month")) {
				
				req.setAttribute("today", sdf.format(cal.getTime()));
				cal.setTime(new Date());
				cal.add(Calendar.MONTH, -1);
				String strDate=sdf.format(cal.getTime());
				req.setAttribute("duringdate", strDate);
				
			}else if(duringdate.equals("3month")) {
				
				req.setAttribute("today", sdf.format(cal.getTime()));
				cal.setTime(new Date());
				cal.add(Calendar.MONTH, -3);
				String strDate=sdf.format(cal.getTime());
				req.setAttribute("duringdate", strDate);
				
			}else if(duringdate.equals("6month")) {
				
				req.setAttribute("today", sdf.format(cal.getTime()));
				cal.setTime(new Date());
				cal.add(Calendar.MONTH, -6);
				String strDate=sdf.format(cal.getTime());
				req.setAttribute("duringdate", strDate);
			}
			
			
			
			
			
			
			
			
		} catch (Exception e) {
			
		}finally {
			
		}
		
		forward(req, resp, "/WEB-INF/views/order/order_list.jsp");
	}
	
	protected void addressForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		forward(req, resp, "/WEB-INF/views/order/address.jsp");
	}
	
	protected void milegeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		forward(req, resp, "/WEB-INF/views/order/milege.jsp");
	}
	

}
