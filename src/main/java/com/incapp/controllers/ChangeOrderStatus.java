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
@WebServlet("/ChangeOrderStatus")
public class ChangeOrderStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String page=request.getParameter("page");
			String status=request.getParameter("status");
			String email=request.getParameter("email");
			int id=Integer.parseInt(request.getParameter("id"));
			
			DAO db=new DAO();
			db.changeOrderStatus(id, status);
			db.closeConnection();
			
			//mail send
			String sub="Order Status Update";
			String body="Your Order Status is "+status;
			SendMail.sendMail(email, sub, body);
			//mail code ends
			
			HttpSession session=request.getSession();
			session.setAttribute("msg", "Status Updated Successfully!");
			response.sendRedirect(page+".jsp");
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}

}
