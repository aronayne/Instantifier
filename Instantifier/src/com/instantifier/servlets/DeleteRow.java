package com.instantifier.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteRow extends HttpServlet {
	
	  public void doPost(HttpServletRequest request,
              HttpServletResponse response)
throws ServletException, IOException {

String id = request.getParameter("id");

/*  Delete a record by id */

PrintWriter out = response.getWriter();
out.println("ok"+id);
}

}
