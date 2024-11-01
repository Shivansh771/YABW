/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package pro.shi.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import pro.shi.dao.PostDao;
import pro.shi.entities.Post;
import pro.shi.entities.User;
import pro.shi.helper.ConnectionProvider;
import pro.shi.helper.Helper;

/**
 *
 * @author shiva
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and
	 * <code>POST</code> methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			String pTitle=request.getParameter("pTitle");
			int cid=Integer.parseInt(request.getParameter("cid"));
			String pContent=request.getParameter("pContent");
			String pCode=request.getParameter("pCode");
			Part part=request.getPart("pic");
			//getting current user id
			HttpSession session=request.getSession();
			User user=(User)session.getAttribute("currentUser");
			Post p=new Post(pTitle,pContent,pCode,part.getSubmittedFileName(),null,cid,user.getId());
			PostDao postDao=new PostDao(ConnectionProvider.getConnection());
			if(postDao.savePost(p)){
				
				                String path = request.getRealPath("/") + "blog_pic" + File.separator + part.getSubmittedFileName();
						Helper.saveFile(part.getInputStream(), path);
						out.println("done");

			}else{
				out.print("Error");
			}
		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
