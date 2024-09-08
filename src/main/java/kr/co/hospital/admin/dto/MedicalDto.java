package kr.co.hospital.admin.dto;

import lombok.Data;

@Data
public class MedicalDto {

	private String user_id, user_name, doc_name, medi_visit, medi_content, medi_type, medi_part;
	private int medi_id;
	private String res_code;
	
	private String user_jumin;
	private String[] medi_types;
	
	public String getUser_jumin() {
		return user_jumin;
	}
	public void setUser_jumin(String user_jumin) {
		this.user_jumin = user_jumin;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getDoc_name() {
		return doc_name;
	}
	public void setDoc_name(String doc_name) {
		this.doc_name = doc_name;
	}
	public String getMedi_visit() {
		return medi_visit;
	}
	public void setMedi_visit(String medi_visit) {
		this.medi_visit = medi_visit;
	}
	public String getMedi_content() {
		return medi_content;
	}
	public void setMedi_content(String medi_content) {
		this.medi_content = medi_content;
	}
	public String getMedi_type() {
		return medi_type;
	}
	public void setMedi_type(String medi_type) {
		this.medi_type = medi_type;
	}
	public String getMedi_part() {
		return medi_part;
	}
	public void setMedi_part(String medi_part) {
		this.medi_part = medi_part;
	}
	public int getMedi_id() {
		return medi_id;
	}
	public void setMedi_id(int medi_id) {
		this.medi_id = medi_id;
	}
	
}
