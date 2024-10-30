<%@page import="pro.shi.entities.User"%>
<%@page import="pro.shi.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="pro.shi.entities.Post"%>
<%@page import="pro.shi.helper.ConnectionProvider"%>
<%@page import="pro.shi.dao.PostDao"%>

<div class="row">
<%
    // Initialize DAO objects and fetch posts
    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
    LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts = (cid == 0) ? postDao.getAllPosts() : postDao.getPostByCatId(cid);

    // Check if there are posts in the selected category
    if (posts.isEmpty()) {
%>
    <h3 class="display-3 text-center">No posts in this category...</h3>
<%
        return;
    }

    // Retrieve current user from session once
    User user = (User) session.getAttribute("currentUser");
    int userId = (user != null) ? user.getId() : -1; // -1 as a fallback if user is null

    // Loop through each post and display its content
    for (Post post : posts) {
%>
    <div class="col-md-6 mt-2">
        <div class="card">
            <%
                // Display post image, use default image if null or empty
                String postImage = (post.getpPic() != null && !post.getpPic().isEmpty()) ? "blog_pic/" + post.getpPic() : "default-image.jpg";
            %>
            <img class="card-img-top" src="<%= postImage %>" alt="Card image">
            <div class="card-body">
                <h4 class="card-title"><%= post.getpTitile() %></h4>
                <p class="card-text"><%= post.getpContent().length() > 100 ? post.getpContent().substring(0, 100) + "..." : post.getpContent() %></p>
            </div>
            <div class="card-footer primary-background text-center">
                <!-- Like button with AJAX call -->
                <a href="#!" onclick="doLike(<%= post.getPid() %>, <%= userId %>)" class="btn btn-outline-light btn-sm">
                    <i class="fa fa-heart"></i>
                    <span id="like-counter-<%= post.getPid() %>"><%= likeDao.countLikeOnPost(post.getPid()) %></span>
                </a>

                <!-- Read more button linking to the post detail page -->
                <a href="show_blog_post.jsp?post_id=<%= post.getPid() %>" class="btn btn-outline-light btn-sm">Read More</a>

                <!-- Placeholder for comments -->
                <a href="#!" class="btn btn-outline-light btn-sm">
                    <i class="fa fa-commenting-o"></i> <span>20</span>
                </a>
            </div>
        </div>
    </div>
<%
    }
%>
</div>
