package pro.shi.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pro.shi.dao.LikeDao;
import pro.shi.helper.ConnectionProvider;

public class LikeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Retrieve parameters from the request
            String operation = request.getParameter("operation");
            int uid = Integer.parseInt(request.getParameter("uid"));
            int pid = Integer.parseInt(request.getParameter("pid"));

            // Create a LikeDao instance
            LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());

            // Check if the operation is "like"
            if ("like".equals(operation)) {
                // Check if the user has already liked the post
                boolean isLiked = ldao.isLikedByUser(uid, pid);

                if (isLiked) {
                    // If already liked, perform "unlike" operation
                    boolean f = ldao.deleteLike(pid, uid);
                    if (f) {
                        out.println("unliked"); // Return unliked response
                    } else {
                        out.println("error-unliking");
                    }
                } else {
                    // If not liked, insert the like
                    boolean f = ldao.insertLike(pid, uid);
                    if (f) {
                        out.println("liked"); // Return liked response
                    } else {
                        out.println("error-liking");
                    }
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Like/Unlike functionality servlet";
    }
}
