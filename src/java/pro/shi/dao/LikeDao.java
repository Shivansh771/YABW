package pro.shi.dao;

import pro.shi.helper.ConnectionProvider;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class LikeDao {
	Connection con;

	public LikeDao(Connection con) {
		this.con = con;
	}
	
	public boolean insertLike(int pid,int uid){
		boolean flag=false;
		try{
			String q="insert into liked(pid,uid)values(?,?)";
			PreparedStatement p=this.con.prepareStatement(q);
			p.setInt(1, pid);
			p.setInt(2,uid);
			p.executeUpdate();
			flag=true;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}
	public int countLikeOnPost(int pid){
		int cnt=0;
		String q="select count(*) from liked where pid=?";
		try {
			PreparedStatement p=con.prepareStatement(q);
			p.setInt(1, pid);
			ResultSet set=p.executeQuery();
			if(set.next()){
				cnt=set.getInt("count(*)");
			}
		} catch (SQLException ex) {
				ex.printStackTrace();
		}
		return cnt;
	}
	public boolean isLikedByUser(int uid, int pid) {
    boolean f = false;
    try {
        String q = "select * from liked where pid=? and uid=?";
        PreparedStatement p = con.prepareStatement(q);
        p.setInt(1, pid);
        p.setInt(2, uid);  // Fixed to check for user id instead of pid twice
        ResultSet set = p.executeQuery();
        if (set.next()) {
            f = true;  // If there's a record, the post is already liked by the user
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return f;
}

	
	public boolean deleteLike(int pid,int uid){
		boolean f=false;
		try{
			PreparedStatement p=this.con.prepareStatement("delete from liked where pid=? and uid=?");
			p.setInt(1, pid);
			p.setInt(2,uid);
			p.executeUpdate();
			f=true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}
	
}
