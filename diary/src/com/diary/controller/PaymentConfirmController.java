package com.diary.controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PaymentConfirmController  extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void doPost( HttpServletRequest request,
            HttpServletResponse response ) throws IOException{
		
		request.getParameter("tid");
		request.getParameter("merchant_id");
		request.getParameter("order_id");
		request.getParameter("currency");
		request.getParameter("amount");
		request.getParameter("delivery_name");
		request.getParameter("billing_email");
		request.getParameter("delivery_tel");
		request.getParameter("delivery_address");
		request.getParameter("delivery_city");
		request.getParameter("delivery_state");
		request.getParameter("delivery_zip");
		request.getParameter("merchant_param1");
		request.getParameter("merchant_param2");
		

	}
	
	
	public void doGet( HttpServletRequest request,
            HttpServletResponse response ) throws IOException{

	}

}
