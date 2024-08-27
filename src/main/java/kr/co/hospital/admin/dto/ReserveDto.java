package kr.co.hospital.admin.dto;

import java.time.LocalTime;

public class ReserveDto {

	private String doc_part, user_id, user_phone, res_code, user_jumin, res_date;
	private String writeday;
	private LocalTime res_time;
	private int res_id, doc_id, state;
	
	public String getDoc_part() {
		return doc_part;
	}
	public void setDoc_part(String doc_part) {
		this.doc_part = doc_part;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getRes_code() {
		return res_code;
	}
	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}
	public String getUser_jumin() {
		return user_jumin;
	}
	public void setUser_jumin(String user_jumin) {
		this.user_jumin = user_jumin;
	}
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public LocalTime getRes_time() {
		return res_time;
	}
	public void setRes_time(LocalTime res_time) {
		this.res_time = res_time;
	}
	public int getRes_id() {
		return res_id;
	}
	public void setRes_id(int res_id) {
		this.res_id = res_id;
	}
	public int getDoc_id() {
		return doc_id;
	}
	public void setDoc_id(int doc_id) {
		this.doc_id = doc_id;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
	
}
