package com.digit.javaTraining.LibraryManagement.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.digit.javaTraining.LibraryManagemet.model.Book;
import com.digit.javaTraining.LibraryManagemet.model.User;

@WebServlet("/removeBook")
public class RemoveBooksController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int book_id = Integer.parseInt(req.getParameter("book_id"));
		
		boolean b =Book.removeBook(book_id);
 
		
		
		if(b) {
			
			resp.sendRedirect("/LibraryManagementLocal/RemoveBookSucc.jsp");
		}
		else {
			resp.sendRedirect("/LibraryManagementLocal/RemoveBookFail.jsp");
		}
		}
	      
	}

