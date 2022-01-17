package com.diary.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.ccavenue.security.*;

public class PaymentController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void doPost( HttpServletRequest request,
            HttpServletResponse response ) throws IOException{
	
		
		response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    
	    
	    String accessCode= "AVPM67DK64AD91MPDA";		//Put in the Access Code in quotes provided by CCAVENUES.
		 String workingKey = "251A23BB144BFB2CED3D1AC20375EA6E";    //Put in the 32 Bit Working Key provided by CCAVENUES.  
		 Enumeration enumeration=request.getParameterNames();
		 String ccaRequest="", pname="", pvalue="";
		 while(enumeration.hasMoreElements()) {
		      pname = ""+enumeration.nextElement();
		      pvalue = request.getParameter(pname);
		      ccaRequest = ccaRequest + pname + "=" + pvalue + "&";
		 }
		 AesCryptUtil aesUtil=new AesCryptUtil(workingKey);
		 String encRequest = aesUtil.encrypt(ccaRequest);
		 

	    out.println("<html>");
	    out.println("<head>");
	    out.println("<title>Hola</title>");
	    out.println("</head>");
	    out.println("<body bgcolor=\"white\">");
	    
	    out.println("<form id=\"nonseamless\" method=\"post\" name=\"redirect\" action=\"https://test.ccavenue.com/transaction/transaction.do?command=initiateTransaction\"/>"); 
	    out.println("<input type=\"hidden\" id=\"encRequest\" name=\"encRequest\" value=\""+encRequest+"\">");
	    out.println("<input type=\"hidden\" name=\"access_code\" id=\"access_code\" value=\""+accessCode+"\">");
	    out.println("<script language='javascript'>document.redirect.submit();</script></form>");
	    out.println("</body>");
	    out.println("</html>");
	}
	
	 public void doGet( HttpServletRequest request,
             HttpServletResponse response ) throws IOException
	{
			 
	}

}
