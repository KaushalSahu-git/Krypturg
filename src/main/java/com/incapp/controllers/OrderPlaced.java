package com.incapp.controllers;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.incapp.model.DAO;
import com.incapp.model.SendMail;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/OrderPlaced")
public class OrderPlaced extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
			String email=(String)session.getAttribute("email");
			if(email==null){
				session.setAttribute("msg", "Please Login First!");
				response.sendRedirect("User.jsp");
			}else{
				String address=request.getParameter("address");
				
				DAO db=new DAO();
				db.orderPlaced(email,address);
				db.closeConnection();
				
				//mail send
				String sub="Order Placed";
				String body="Your Order Order Placed Successfully";
				SendMail.sendMail(email, sub, body);
				//mail code ends
				
				session.setAttribute("msg", "Order Placed added Successfully!");
				response.sendRedirect("UserHome.jsp");
				
				
			}
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}

}
