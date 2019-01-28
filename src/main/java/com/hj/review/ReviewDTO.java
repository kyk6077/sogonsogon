package com.hj.review;

import java.sql.Date;

public class ReviewDTO {
	private int rnum;
	private String target_num;
	private String writer;
	private String contents;
	private Date reg_date;
	
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getTarget_num() {
		return target_num;
	}
	public void setTarget_num(String target_num) {
		this.target_num = target_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
