package kr.co.hospital.client.dto;

import lombok.Data;

@Data
public class ProgramCapacityDto {
	int capacity_id,pro_id,pro_inwon,minus_inwon;
	String date;
}
