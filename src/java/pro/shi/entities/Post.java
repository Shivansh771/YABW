
package pro.shi.entities;

import java.sql.*;


public class Post {
	private int pid;
	private String pTitle;
	private String pContent;
	private String pCode;
	private String pPic;
	private Timestamp pDate;
	private int userId;

	public Post(int pid, String pTitile, String pContent, String pCode, String pPic, Timestamp pDate, int catId,int userId) {
		this.userId=userId;
		this.pid = pid;
		this.pTitle = pTitile;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
	}

	public Post() {
	}

	public Post(String pTitile, String pContent, String pCode, String pPic, Timestamp pDate, int catId,int userId) {
		this.pTitle = pTitile;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
		this.catId = catId;
		this.userId=userId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getpTitile() {
		return pTitle;
	}

	public void setpTitile(String pTitile) {
		this.pTitle = pTitile;
	}

	public String getpContent() {
		return pContent;
	}

	public void setpContent(String pContent) {
		this.pContent = pContent;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getpPic() {
		return pPic;
	}

	public void setpPic(String pPic) {
		this.pPic = pPic;
	}

	public Timestamp getpDate() {
		return pDate;
	}

	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}
	private int catId;
	
	
}
