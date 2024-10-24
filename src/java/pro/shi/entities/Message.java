/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pro.shi.entities;

/**
 *
 * @author shiva
 */
public class Message {
	private String content;

	public void setContent(String content) {
		this.content = content;
	}

	public Message(String content, String type, String cssClass) {
		this.content = content;
		this.type = type;
		this.cssClass = cssClass;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}
	private String type;
	private String cssClass;

	public String getContent() {
		return content;
	}

	public String getType() {
		return type;
	}

	public String getCssClass() {
		return cssClass;
	}
	
	
}
