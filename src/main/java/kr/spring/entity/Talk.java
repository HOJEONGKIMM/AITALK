package kr.spring.entity;


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
public class Talk {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long talk_idx;
	
	private Long room_idx;
	private String username;
	private String talk;
	private LocalDateTime talked_at;
	
	@PrePersist
    protected void onCreate() {
        talked_at = LocalDateTime.now(); // 현재 LocalDateTime으로 설정
    }
	
}
