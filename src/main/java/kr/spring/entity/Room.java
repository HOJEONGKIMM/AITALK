package kr.spring.entity;

import java.sql.Date;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString
public class Room {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long room_idx;
	
	private String username;
	private String title;
	private LocalDateTime opened_at;
	private String status;
	
	@PrePersist
    protected void onCreate() {
		opened_at = LocalDateTime.now(); // 현재 LocalDateTime으로 설정
    }
	
}
