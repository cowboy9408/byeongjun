package com.butler.app.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.butler.app.action.ActionTo;
import com.butler.app.action.GoReviewWritingAction;
import com.butler.app.action.ReviewWriteOKAction;

public class ReviewFrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		doProcess(req,resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI= req.getRequestURI();
		String contextPath=req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionTo transfer = null;
		String path="";
		boolean isRedirect;
		switch (command) {
			case "/review/goReviewWriting.review":
			try {
				transfer = new GoReviewWritingAction().execute(req, resp);		
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		}
		switch (command) {
		case "/review/reviewWriteOK.review":
		try {
			transfer = new ReviewWriteOKAction().execute(req, resp);		
		} catch (Exception e) {
			e.printStackTrace();
		}
		break;
	}
		
		
		if(transfer !=null) {
			if(transfer.isRedirect()) {
				resp.sendRedirect(transfer.getPath());
			}else {
				req.getRequestDispatcher(transfer.getPath()).forward(req, resp);
			}
		}
	}
}
