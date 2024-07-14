package com.incapp.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

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
@WebServlet("/AddProduct")
@MultipartConfig
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name=request.getParameter("name");
			int price=Integer.parseInt(request.getParameter("price"));
			String cname=request.getParameter("cname");
			String category=request.getParameter("category");
			String info=request.getParameter("info");
			int qty=Integer.parseInt(request.getParameter("qty"));
			Part p=request.getPart("image");
			InputStream image=p.getInputStream();
			
			HashMap<String,Object> product=new HashMap<>();
			product.put("name", name.trim());
			product.put("price", price);
			product.put("cname", cname);
			product.put("category", category);
			product.put("info", info);
			product.put("qty", qty);
			product.put("image", image);
			DAO db=new DAO();
			String result=db.addProduct(product);
			db.closeConnection();
			HttpSession session=request.getSession();
			session.setAttribute("msg", result);
			response.sendRedirect("Products.jsp");
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExpPage.jsp");
		}
	}


}
