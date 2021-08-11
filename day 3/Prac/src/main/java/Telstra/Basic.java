package Telstra;
import java.io.*;


import javax.servlet.*;
import javax.servlet.http.*;



public class Basic extends HttpServlet {
	private String message;
	
	public void init() throws ServletException {
		message = "Welcome, This is my practise servlet";
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		// Set Response content Type
		response.setContentType("text/html");
		
		// Actual logic here
		
		PrintWriter out = response.getWriter();
		
		out.println("<h1>" + message + "</h1>");
		
	}
	
	public void destory() {
		// do nothing
	}
	
}
