/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pro.shi.dao;

/**
 *
 * @author shiva
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import pro.shi.entities.Category;
import pro.shi.entities.Post;
public class PostDao {
	Connection con;
	public PostDao(Connection con) {
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories() {
    ArrayList<Category> list = new ArrayList<>(); // Initialize the list
    try {
        String q = "select * from categories";
        Statement st = this.con.createStatement();
        ResultSet set = st.executeQuery(q);
        while (set.next()) {
            int cid = set.getInt("cid");
            String name = set.getString("name");
            String description = set.getString("description");
            Category cat = new Category(cid, name, description);

            list.add(cat); // Add the category to the list
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return list; // Return the populated list
}
	public boolean savePost(Post p){
	boolean flag=false;
	try{
	String q="insert into posts(pTitle,pContent,pCode,pPic,catId,userId)values(?,?,?,?,?,?)";
	PreparedStatement pstmt=con.prepareStatement(q);
	pstmt.setString(1, p.getpTitile());
	pstmt.setString(2, p.getpContent());
	pstmt.setString(3, p.getpCode());
	pstmt.setString(4, p.getpPic());
	pstmt.setInt(5, p.getCatId());
	pstmt.setInt(6, p.getUserId());
	pstmt.executeUpdate();
	flag=true;
	
	}catch(Exception e){
		e.printStackTrace();
	}
	return flag;
	}
	public List<Post> getAllPosts(){
		List<Post> list=new ArrayList<>();
		try{
			PreparedStatement p=con.prepareStatement("select * from posts order by pid desc");
			ResultSet set = p.executeQuery();
			while(set.next()){
				int pid=set.getInt("pid");
				String pTitle=set.getString("pTitle");
				String pContent=set.getString("pContent");
				String pCode=set.getString("pCode");
				String pPic=set.getString("pPic");
				Timestamp date=set.getTimestamp("pDate");
				int catId=set.getInt("catId");
				int userId=set.getInt("userId");
				Post post=new Post(pid,pTitle,pContent,pCode,pPic,date,catId,userId);
				list.add(post);
				
			}
		
		
		}catch(Exception e){e.printStackTrace();}
		return list;
	}
	public List<Post> getPostByCatId(int catId){
		List<Post> list=new ArrayList<>();
		try{
			PreparedStatement p=con.prepareStatement("select * from posts where catId=?");
			p.setInt(1,catId);
			ResultSet set = p.executeQuery();
			while(set.next()){
				int pid=set.getInt("pid");
				String pTitle=set.getString("pTitle");
				String pContent=set.getString("pContent");
				String pCode=set.getString("pCode");
				String pPic=set.getString("pPic");
				Timestamp date=set.getTimestamp("pDate");
				int userId=set.getInt("userId");
				Post post=new Post(pid,pTitle,pContent,pCode,pPic,date,catId,userId);
				list.add(post);
				
			}
		
		
		}catch(Exception e){e.printStackTrace();}
		return list;
	}
	public Post getPostByPostId(int postId){
		Post post=null;
		try{
			PreparedStatement p=con.prepareStatement("select * from posts where pid=?");
			p.setInt(1,postId);
			ResultSet set = p.executeQuery();
			if(set.next()){
				int pid=set.getInt("pid");
				String pTitle=set.getString("pTitle");
				String pContent=set.getString("pContent");
				String pCode=set.getString("pCode");
				String pPic=set.getString("pPic");
				Timestamp date=set.getTimestamp("pDate");
				int userId=set.getInt("userId");
				int catId=set.getInt("catId");
				 post=new Post(pid,pTitle,pContent,pCode,pPic,date,catId,userId);
			}
		
		
		}catch(Exception e){e.printStackTrace();}
		return post;
	}
	
	
}
