package com.sc.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jettison.json.JSONObject;

import com.google.gson.Gson;
import com.sc.dao.dto.LoginDto;
import com.sc.dao.dto.UserDto;

public class WebserviceInvokeServlet extends HttpServlet{

	
	 @SuppressWarnings("null")
	public void doPost( HttpServletRequest request,
            HttpServletResponse response ) throws IOException{
		
	     // final PrintWriter out = response.getWriter();
	      //out.write("GET method (retrieving data) was invoked!");
		 HttpSession sessionObj =request.getSession(true);
		 final ResourceBundle bundle = ResourceBundle.getBundle("com.sc.util.WebserviceUrl");
		 
		 OutputStream os = null,os1;
       BufferedOutputStream bos = null;
      
       String webservicename = null;
       String strServiceResp = null;
       String actualUrl = "";
       String requesturl = null;
       String strNewRequestUrl = null;
       int index = -1;
       
       
       try{
      	 webservicename = request.getParameter("wsname");

			Gson gson = new Gson();
			String usrObjstr = (String)sessionObj.getAttribute("userobject");
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>> "+usrObjstr);
			if(usrObjstr !=null){
	 			JSONObject json = new JSONObject(usrObjstr);
	 			usrObjstr = json.getString("userDto");
	 			}
			UserDto userDto = (UserDto)gson.fromJson(usrObjstr, UserDto.class);
			
           //LOGGER.debug("Websevice Name : "+webservicename);
      	 System.out.println(request.getParameter("jsonstr"));
      	if(accessHub(webservicename,userDto)){
	      	 BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
	         String json = "";
	         if(br != null){
	             json = br.readLine();
	         }
	         
	         System.out.println(json);
	         
/*	        strNewRequestUrl = "http://localhost:9080"+request.getContextPath()+"/rest/webservice/"
	                                       + bundle.getString(webservicename);
*/	         
	        strNewRequestUrl = "http://supremecards.in/IndianWeddingCards/rest/webservice/"
	                 + bundle.getString(webservicename) + "?"+ actualUrl;
	
	         System.out.println(strNewRequestUrl);
	           
	           
	           
	        URL url = new URL(strNewRequestUrl);
	   		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	   		conn.setRequestMethod("POST");
	   		conn.setRequestProperty("Accept", "application/json");
	   		conn.setRequestProperty("Content-Type", "application/json");
	   		conn.setDoOutput(true);
	   		
	   		os = conn.getOutputStream();
			os.write(json.getBytes());
			os.flush();
	
	   		if (conn.getResponseCode() != 200) {
	   			throw new RuntimeException("Failed : HTTP error code : "
	   					+ conn.getResponseCode());
	   		}
	
	   		
	   		BufferedReader br1 = new BufferedReader(new InputStreamReader(
					(conn.getInputStream())));
	
	   		
	   		
			  String output;
	 		  response.setContentType("application/json");
	          response.addHeader("Cache-Control", "no-transform, max-age=0");   
	          os1 = response.getOutputStream();
	          bos = new BufferedOutputStream(os1);
	
			System.out.println("Output from Server .... \n");
			/*while ((output = br1.readLine()) != null) {
				System.out.println(output);
				bos.write(output.getBytes("UTF-8"));
			}*/
			
			output = br1.readLine();
			
     		if(webservicename.equals("dologin")){
     			String userObjstr = output;
     			sessionObj.setAttribute("userobject", userObjstr);
     			//sessionObj.setAttribute("userobject", "raja");
     			System.out.println("******************** "+(String)sessionObj.getAttribute("userobject"));
     		}

			bos.write(output.getBytes("UTF-8"));
	          bos.flush();
	      	}
	      	else{
	       	 response.sendError(500,"Unauthorised access");
	        }
	           
	       }catch (Exception e) {
				e.printStackTrace();
			}
	       finally {
	           try {
	                  if (bos != null) {
	                         bos.close();
	                  }
	           } catch (Exception e) { }
	           try {
	                  if (os != null) {
	                         os.close();
	                  }
	           } catch (Exception e) { }
	           finally{}
	       }

	}
	
	 @Override
	   public void doGet( HttpServletRequest request,
	                      HttpServletResponse response ) throws IOException
	   {
	     // final PrintWriter out = response.getWriter();
	      //out.write("GET method (retrieving data) was invoked!");
		 HttpSession sessionObj =request.getSession(true);
		 final ResourceBundle bundle = ResourceBundle.getBundle("com.sc.util.WebserviceUrl");
		 
		 OutputStream os = null;
         BufferedOutputStream bos = null;
        
         String webservicename = null;
         String strServiceResp = null;
         String actualUrl = "";
         String requesturl = null;
         String strNewRequestUrl = null;
         int index = -1;
         
         
         try{
        	 webservicename = request.getParameter("wsname");
             //LOGGER.debug("Websevice Name : "+webservicename);
 			Gson gson = new Gson();
 			String usrObjstr = (String)sessionObj.getAttribute("userobject");
 			if(usrObjstr !=null){
 			JSONObject json = new JSONObject(usrObjstr);
 			usrObjstr = json.getString("userDto");
 			}
 			System.out.println("<<<<<<<<<<<<<<<<<<<<<< "+usrObjstr);
 			UserDto userDto = (UserDto)gson.fromJson(usrObjstr, UserDto.class);

 			if(webservicename.equals("logout")){
        		 request.getSession().invalidate();
        	 }
		      else{
		        	 if(accessHub(webservicename,userDto)){
		        	 
		        	 requesturl = request.getQueryString();
		             index = requesturl.indexOf('&');
		             if (index >= 0) {
		                    actualUrl = requesturl.substring(index);
		             }
		            /*strNewRequestUrl = "http://localhost:9080"+request.getContextPath()+"/rest/webservice/"
		                                         + bundle.getString(webservicename) + "?"+ actualUrl;
*/		             
		            strNewRequestUrl = "http://supremecards.in/IndianWeddingCards/rest/webservice/"
		                     + bundle.getString(webservicename) + "?"+ actualUrl;
		             System.out.println(strNewRequestUrl);
		             
		
		            URL url = new URL(strNewRequestUrl);
		     		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		     		conn.setRequestMethod("GET");
		     		conn.setRequestProperty("Accept", "application/json");
		
		     		if (conn.getResponseCode() != 200) {
		     			throw new RuntimeException("Failed : HTTP error code : "
		     					+ conn.getResponseCode());
		     		}
		
		     		BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
		
		     		//String output;
		     		System.out.println("Output from Server .... \n");
		     		/*while ((strServiceResp = br.readLine()) != null) {
		     			System.out.println(strServiceResp);
		     		}*/
		
		     		strServiceResp = br.readLine();
		     		
		     		if(webservicename.equals("dologin")){
		     			sessionObj.setAttribute("userobject", strServiceResp);
		     		}
		     		
		     		response.setContentType("application/json");
		            response.addHeader("Cache-Control", "no-transform, max-age=0");   
		            os = response.getOutputStream();
		            bos = new BufferedOutputStream(os);
		            System.out.println(strServiceResp);
		            bos.write(strServiceResp.getBytes("UTF-8"));
		            bos.flush();
		         }else{
		        	 response.sendError(500,"Unauthorised access");
		         }
		      }
             
         }catch (Exception e) {
			e.printStackTrace();
		}
         finally {
             try {
                    if (bos != null) {
                           bos.close();
                    }
             } catch (Exception e) { }
             try {
                    if (os != null) {
                           os.close();
                    }
             } catch (Exception e) { }
       }
	}

	 
	 
	 public boolean accessHub(String wsName, UserDto userDto){
		 boolean retval = false;
		 
		 if(wsName.equals("getCardListForAdmin") || wsName.equals("deletecards")){
			 System.out.println(".......... "+wsName);
			 System.out.println(".......... "+userDto);
			 if(userDto !=null && userDto.getUserType().equals("admin")){
				 System.out.println(wsName +" - "+userDto.getUserType());
				 retval = true;
			 }
			 if(userDto !=null && !(userDto.getUserType().equals("admin"))){
				 System.out.println(wsName +" - "+userDto.getUserType());
				 retval = false;
			 }
		 }else{
			 System.out.println("else part");
			 retval = true;
		 }
		 return retval;
	 }
}
