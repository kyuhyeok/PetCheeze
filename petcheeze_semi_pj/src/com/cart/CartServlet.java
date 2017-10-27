package com.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyServlet;

@WebServlet("/cart/*")
public class CartServlet extends MyServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getContextPath();
		
		if(uri.indexOf("cart.do")!=-1) {
			forward(req, resp, "/WEB-INF/views/cart/list.jsp");
		}
		
	}

}
