package com.incapp.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.incapp.model.DAO;


/**
 * Servlet implementation class FileUpload
 */
@WebServlet("/GetProductImage")
public class GetProductImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String name=request.getParameter("name");
			DAO db=new DAO();
			byte[] image=db.getProductImage(name);
			db.closeConnection();
			
			response.getOutputStream().write(image);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}
}
