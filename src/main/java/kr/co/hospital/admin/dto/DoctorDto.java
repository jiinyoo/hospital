package kr.co.hospital.admin.dto;

import lombok.Data;

@Data
public class DoctorDto {
	
	private String doc_name, doc_part, doc_img, doc_history, doc_phone, writeday;
	private String doc_userid;
	private int doc_id;
	private String[] historys;
	
	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public String getDoc_part() {
		return doc_part;
	}
	public void setDoc_part(String doc_part) {
		this.doc_part = doc_part;
	}
	public String getDoc_img() {
		return doc_img;
	}
	public void setDoc_img(String doc_img) {
		this.doc_img = doc_img;
	}
	public String getDoc_history() {
		return doc_history;
	}
	public void setDoc_history(String doc_history) {
		this.doc_history = doc_history;
	}
	public String getDoc_phone() {
		return doc_phone;
	}
	public void setDoc_phone(String doc_phone) {
		this.doc_phone = doc_phone;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public int getDoc_id() {
		return doc_id;
	}
	public void setDoc_id(int doc_id) {
		this.doc_id = doc_id;
	}
	
	
}
