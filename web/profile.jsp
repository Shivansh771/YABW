

<%@page import="pro.shi.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pro.shi.dao.PostDao"%>
<%@page import="pro.shi.helper.ConnectionProvider"%>
<%@page import="pro.shi.entities.Message"%>
<%@page import="pro.shi.entities.User"%>
<% 
User user=(User)session.getAttribute("currentUser");
if(user==null){
response.sendRedirect("login_page.jsp");
	}

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Profile</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>.primary-background{
    background:#3d5afe!important;
}</style>
	</head>
	<body>
		<!-- navbar -->
		<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>Yet Another Blogging Website</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#"> <span class="	fa fa-bell-o"></span> Made By Shivansh<span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="	fa fa-check-square-o"></span> Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Programming Language</a>
                    <a class="dropdown-item" href="#">Projects</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Data Structure</a>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#"> <span class="	fa fa-address-card-o"></span> Contact</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="fa fa-plus"></span> Post</a>
            </li>
           
            <li class="nav-item">
            </li>

        </ul>
	   <ul class="navbar-nav ml-auto">
    <li class="nav-item">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#exampleModal" href="register_page.jsp"> 
            <span class="fa fa-user-circle"></span> <%= user.getName()%>
        </a>
    </li>   
    <li class="nav-item">
        <a class="nav-link" href="LogoutServlet"> 
            <span class="fa fa-sign-out"></span> Logout
        </a>
    </li>   
</ul>

    </div>
</nav>
	
  <%
				Message m=(Message) session.getAttribute("msg");
				if(m!=null){
				 %>
				  <div class="text-center alert <%= m.getCssClass()%>" role="alert">
				<%=m.getContent()%>
				</div>
                          
				    
				   <%
					   session.removeAttribute("msg");}
					   
				   %>
		<!--main body of the page-->
		<div class="container">
			<div class="row mt-4">
				<!--first col-->
				<!--categories-->
				
				<div class="col-md-4">
				<div class="list-group">
   <a href="#" class="list-group-item list-group-item-action active">All Posts</a>
   <%
   PostDao d=new PostDao(ConnectionProvider.getConnection());
   ArrayList<Category> list1=d.getAllCategories();
   for(Category cc:list1){
		%>
      <a href="#" class="list-group-item list-group-item-action"><%=cc.getName()%></a>

   
   <%
	   }
   
   
   %>

</div>	
				</div>
				<!--posts-->
				<div class="col-md-8">
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading...</h3>
					</div>
				</div>
				
			</div>
			
		</div>
		
		<!--end of main body-->
	
	<!--profile modal-->
	
	<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title " id="exampleModalLabel">YABW</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <div class="container text-center">
          <img src="pics/<%= user.getProfile() %>" alt="Profile Picture" class="img-fluid" style="width: 150px; height: 150px; border-radius: 50%;">
        <h5 class="modal-title " id="exampleModalLabel"><%= user.getName()%></h5>
	
	<!--details-->
	<div id="profile-details">
	<table class="table">
 
  <tbody>
    <tr>
      <th scope="row">ID </th>
      <td><%=user.getId()%></td>
     
   
    </tr>
    <tr>
      <th scope="row">Email </th>
      <td><%=user.getEmail()%></td>
   
  
    </tr>
    <tr>
      <th scope="row">Gender </th>
      <td><%=user.getGender()%></td>
    
    </tr>
    <tr>
      <th scope="row">About</th>
      <td><%=user.getAbout()%></td>
    
    </tr>
    <tr>
      <th scope="row">Registered on</th>
      <td><%=user.getDateTime().toString()%></td>
    
    </tr>
    
  </tbody>
</table>
	</div>
      <div id="profile-edit" style="display: none;">
	      <h3 class="mt-2">Edit</h3>
<form action="EditServlet" method="post" enctype="multipart/form-data">
		      <table class="table">
			      <tr>
				      <td>ID </td>
				      <td><%=user.getId()%></td>
				      
			      </tr>
			      <tr>
				      <td>Email </td>
				      
<td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>"></td>

				      
			      </tr>
			      <tr>
				      <td>Name </td>
				      
<td><input type="text" class="form-control" name="user_name" value="<%=user.getName()%>"></td>

				      
			      </tr>
			      <tr>
				      <td>Password </td>
				      
<td><input type="password" class="form-control" name="user_password" value="<%=user.getPassword()%>"></td>

				      
			      </tr>
			       <tr>
				      <td>Gender </td>
				      <td><%=user.getGender().toUpperCase()%></td>
				      
			      </tr>
			       <tr>
				      <td>About </td>
				      
				      <td><textarea row="3" class="form-control" name="user_about"><%=user.getAbout()%></textarea></td>
			      </tr>
			       <tr>
				      <td>New Profile Pic</td>
				      
				      <td><input type="file" name="image" class="form-control"></td>
			      </tr>
			     
		      </table> 
				      <div class="container">
					      <button type="submit" class="btn btn-outline-primary">Save</button>
				      </div>
	      </form>
	      
	      
      </div>
      
	      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide post Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <form id="add-post-form" action="AddPostServlet" method="post">
		      <div class="form-group">
			      <select class="form-control" name="cid">
			      <option selected disabled>---Select Category---</option>
			      <%
			      PostDao postd=new PostDao(ConnectionProvider.getConnection());
			      ArrayList<Category> list=postd.getAllCategories();
			      for(Category c:list){
			      %> <option value="<%=c.getCid()%>"><%=c.getName()%></option>
				      <%}%>
			     
			   
		      </select></div>
		      <div class="form-group">
			      <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
		      </div>
		      <div class="form-group"><textarea name="pContent" class="form-control" style="height:250px" placeholder="Enter your text"></textarea></div>
		      <div class="form-group"> <textarea name="pCode" class="form-control" style="height: 250px" placeholder="Enter your Code (If any)"></textarea></div>
		      <div class="form-group">
			      <label>Select a pic...</label>
			      <br>
			      <input name="pic" type="file"><!-- comment -->
		      </div>
				      <div class="container text-center">
					      <button type="submit" class="btn btn-outline-primary">Post</button>
				      </div>
	      </form>
		      
	      
      </div>
    
    </div>
  </div>
</div>
		 <!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>function doLike(postId, userId) {
    $.ajax({
        url: "LikeServlet",
        type: "POST",
        data: {
            operation: "like",
            pid: postId,
            uid: userId
        },
        success: function (data) {
            let likeCounter = $("#like-counter-" + postId);
            let currentLikes = parseInt(likeCounter.text());

            // Ensure the currentLikes doesn't go negative
            if (isNaN(currentLikes)) {
                currentLikes = 0;
            }

            if (data.trim() == "liked") {
                likeCounter.text(currentLikes + 1); // Increment like count
            } else if (data.trim() == "unliked") {
                if (currentLikes > 0) {
                    likeCounter.text(currentLikes - 1); // Decrement like count
                }
            } else {
                console.error("Error: ", data);
            }
        },
        error: function (xhr, status, error) {
            console.error("Error: " + error);
        }
    });
}
</script>
	
	<script>
		$(document).ready(function(){
			
		let editStatus=false;

			$('#edit-profile-button').click(function(){
//				alert("button click");
			if(editStatus==false){
			$("#profile-details").hide()
			$("#profile-edit").show()
			$(this).text("Back");
			editStatus=true;
			}else{
			$("#profile-details").show()
			$("#profile-edit").hide()
			$(this).text("Edit");
			editStatus=false;
			}
		
	})
		});
		</script>
		<!--now add post js-->
		<script>
		$(document).ready(function(e){
			$("#add-post-form").on("submit",function(event){
				
				event.preventDefault();
				console.log("You have clicked submit");
				let form=new FormData(this);
				//now requesting to server
				$.ajax({
					url:"AddPostServlet",
					type:'POST',
					data:form,
					success: function(data,textStatus,jqXHR){
						console.log(data);
						if(data.trim()=='done'){
						Swal.fire({
						 title: "Good job!",
						 text: "Successfully Submitted!",
							icon: "success"
							});
						}else{
						Swal.fire({
						 title: "Error",
						 text: "Something went wrong try again...",
						 icon: "error"
						});
					}
					},
					error: function(jqXHR,textStatus,errorThrown){
					Swal.fire("Error","Something went wrong try agin...","error")

					},
					processData: false,
					contentType: false
				})
				
			})
		})	
			
		</script>
	</body>	
	
</html>
