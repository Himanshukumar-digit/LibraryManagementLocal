package com.digit.javaTraining.LibraryManagement.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digit.javaTraining.LibraryManagemet.model.Admin;
import com.digit.javaTraining.LibraryManagemet.model.User;

@WebServlet("/adminLogin")
public class AdminLoginController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int admin_id = Integer.parseInt(req.getParameter("admin_id"));
		String secret_pin = req.getParameter("secret_pin");
		
		boolean status = Admin.authenticateAdmin(admin_id, secret_pin);
		System.out.println(status);
		if (status) {
			resp.sendRedirect("/LibraryManagementLocal/admin.html");
			return;
		}
		resp.sendRedirect("/LibraryManagementLocal/AdminFail.jsp");
	
	}
}
