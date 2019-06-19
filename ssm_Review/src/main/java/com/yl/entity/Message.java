package com.yl.entity;

import java.util.HashMap;

/**
 * 用于操作后的信息显示管理
 */
public class Message {
	
	private int status;
	
	private String msg;
	
	HashMap<String, Object>  map = new HashMap<String, Object>();
	
	public Message add(String content, Object oj){
		this.getMap().put(content, oj);
		return this;
	}
	
	public static Message success(){
		Message message = new Message();
		message.setStatus(1);
		message.setMsg("您好，操作成功！");
		return message;
	}
	
	public static Message fail(){
		Message message = new Message();
		message.setStatus(-1);
		message.setMsg("您好，操作失败！");
		return message;
	}
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public HashMap<String, Object> getMap() {
		return map;
	}

	public void setMap(HashMap<String, Object> map) {
		this.map = map;
	}
	
}
