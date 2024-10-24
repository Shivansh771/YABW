<%@page import="pro.shi.entities.User"%>
<%@page import="pro.shi.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="pro.shi.entities.Post"%>
<%@page import="pro.shi.helper.ConnectionProvider"%>
<%@page import="pro.shi.dao.PostDao"%>
<div class="row">
<%
	
PostDao d=new PostDao(ConnectionProvider.getConnection());
int cid=Integer.parseInt(request.getParameter("cid"));
List<Post> posts=null;
if(cid==0){
posts=d.getAllPosts();}
else{
posts=d.getPostByCatId(cid);
	}
if(posts.size()==0){
out.println("<h3 class='display-3 text-center'>No posts in this category...</h3>");
return;
	}
for(Post p:posts){
%>
<div class="col-md-6 mt-2">
	<div class="card">
		<img class="card-img-top" src="blog_pic/<%=p.getpPic()%>" alt="card image">
		<div class="card-body">
			<h4><%=p.getpTitile()%></h4>
			<p><%=p.getpContent()%></p>
			
		</div>
			<div class="card-footer primary-background text-center">
				<%LikeDao ld=new LikeDao(ConnectionProvider.getConnection());
				User user=(User)session.getAttribute("currentUser");
						%>
					<a href="#!" onclick="doLike(<%=p.getPid()%>, <%=user.getId()%>)" class="btn btn-outline-light btn-sm">
    <i class="fa fa-heart"></i>
    <span id="like-counter-<%=p.getPid()%>"><%=ld.countLikeOnPost(p.getPid())%></span>
</a>

				<a href="show_blog_post.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read More</a>
				<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
				
			</div>
	</div>
	
</div>
	
	<%
	}
%>

</div>