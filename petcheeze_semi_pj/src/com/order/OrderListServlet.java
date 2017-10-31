package com.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		forward(req, resp, "/WEB-INF/views/order/order_list.jsp");
	}
	
	protected void addressForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		forward(req, resp, "/WEB-INF/views/order/address.jsp");
	}
	
	protected void milegeForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		forward(req, resp, "/WEB-INF/views/order/milege.jsp");
	}
	

}
