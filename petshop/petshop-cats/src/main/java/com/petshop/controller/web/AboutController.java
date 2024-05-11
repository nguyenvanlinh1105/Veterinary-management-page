package com.petshop.controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petshop.model.UserModel;
import com.petshop.service.IDichVuService;
import com.petshop.utils.FormUtil;
import com.petshop.utils.SessionUtil;
@WebServlet(urlPatterns= {"/web-about"})
public class AboutController extends HttpServlet{

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String view="";
			view ="/views/web/about/about.jsp";
			RequestDispatcher rd = req.getRequestDispatcher(view);
			rd.forward(req, resp);
		
	}
	
	
}
