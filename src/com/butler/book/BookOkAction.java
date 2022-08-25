package com.butler.book;


import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.Loader.Simple;

import com.butler.app.action.Action;
import com.butler.app.action.ActionTo;
import com.butler.app.dao.BookDTO;
import com.butler.app.dao.UserDTO;

public class BookOkAction implements Action{
	
	
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		HttpSession session = req.getSession(false);
		Date nowDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");		
		PrintWriter out = resp.getWriter();
		
		//데이터베이스에 올릴 호텔 DTO 생성부분
		
		System.out.println("BookOkAction 클래스 도착");
		//호텔넘버를 가져오는 부분
		int BUSINESS_PLACE_NUM_FK = Integer.parseInt(req.getParameter("BUSINESS_PLACE_NUM_FK"));
		System.out.println("BUSINESS_PLACE_NUM_FK = "+ BUSINESS_PLACE_NUM_FK);
		//예약 입실일 받아오는 부분
		String checkInDateStr= req.getParameter("book_checkin_date") ;
		Date checkInDatetypeDate = sdf.parse(checkInDateStr);
		//sql에 들어갈수 있도록 형변환
		java.sql.Date book_checkin_date = java.sql.Date.valueOf(sdf.format(checkInDatetypeDate));
		System.out.println("book_checkin_date = "+ book_checkin_date);
		//예약 퇴실일 받아오는 부분
		//예약 입실일 받아오는 부분
		String checkOutDateStr= req.getParameter("book_checkin_date") ;
		Date checkOutDatetypeDate = sdf.parse(checkOutDateStr);
		//sql에 들어갈수 있도록 형변환
		java.sql.Date book_checkout_date = java.sql.Date.valueOf(sdf.format(checkOutDatetypeDate));
		System.out.println("book_checkout_date = "+ book_checkout_date);
		//예약 등록시간 만들기
		java.sql.Date book_regdate = java.sql.Date.valueOf(sdf.format(nowDate));
		System.out.println("book_regdate = "+ book_regdate);
		//비용
		int book_charge = Integer.parseInt(req.getParameter("book_charge"));
		System.out.println("book_charge = "+ book_charge);
		//예약 요청사항
		//세션에서 로그인 유저넘버 가져오기		
		int USER_NUM_FK = 0;
		
		if(session!=null) {
			UserDTO loginUser = (UserDTO)session.getAttribute("LoginUser");
			USER_NUM_FK = loginUser.getUser_num_pk();
			System.out.println("USER_NUM_FK = "+USER_NUM_FK);
		}else {
			System.out.println("BookOkAction 에서 session에 로그인된 유저의 정보가 없습니다.");
			out.print("<script>");
			//alert('apple님 어서오세요~!');
			out.print("alert('BookOkAction 에서 session에 로그인된 유저의 정보가 없습니다. 메인으로 돌아갑니다');");
			//location.href = '???/app/board/main.jsp';
			out.print("location.href = '"+req.getContextPath()+"/index.jsp';");
			out.print("</script>");
		}
		//데이터베이스에 올릴 PETSDTO 생성부분
		
		BookDTO bdto = new BookDTO(BUSINESS_PLACE_NUM_FK, USER_NUM_FK,book_regdate, book_checkin_date, book_checkout_date, book_charge);
		System.out.println(bdto);
		

		
		

		return null;

	}
	
}
