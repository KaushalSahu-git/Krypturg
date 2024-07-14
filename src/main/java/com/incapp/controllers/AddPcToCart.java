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

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AddPcToCart")
public class AddPcToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");

			String motherboard = request.getParameter("motherboard");
			String harddisk = request.getParameter("harddisk");
			String ram = request.getParameter("ram");
			String processor = request.getParameter("processor");
			String mouse = request.getParameter("mouse");
			String keyboard = request.getParameter("keyboard");
			String webcam = request.getParameter("webcam");
			String ups = request.getParameter("ups");
			String cabinate = request.getParameter("cabinate");

			DAO db = new DAO();
			db.addToCart(email, motherboard);
			db.addToCart(email, harddisk);
			db.addToCart(email, ram);
			db.addToCart(email, processor);
			db.addToCart(email, mouse);
			db.addToCart(email, keyboard);
			db.addToCart(email, webcam);
			db.addToCart(email, ups);
			db.addToCart(email, cabinate);
			db.closeConnection();

			session.setAttribute("msg", "PC Build Successfully!");
			response.sendRedirect("Cart.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}

}
