package kr.spring.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.ToString;

@Entity // Board VO가 Database Table로 만들때 설정
@Data
public class Board { // VO <--- ORM ---> TABLE
	
	@Id // PK 의미 // 1씩 증가하면서 넣기 -> auto_increment와 같음
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long board_idx; // 게시글 고유번호 (호환을 long형 해준다)
	
	private String category; // 카테고리
	
	private String title; // 제목
	
	@Column(length = 2000) // 길이지정 -> 길이지정 따로 안할때 길이 255
	private String content; // 내용
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="username", updatable = false)
	@ToString.Exclude
	private Member username; // Member의 아이디 
	
	private String fileURLs;

	@Column(insertable = false, updatable = false, columnDefinition = "datetime default now()")
	private Date indate; // 작성일자
	
	@Column(columnDefinition = "int default 0")
	private Long available; // 게시글 활성 여부
	
	@Column(insertable = false, updatable = false, columnDefinition = "int default 0")
	private Long count; // 조회수
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "board_idx")
	private List<Comment> comment = new ArrayList<Comment>();
	
	public String getUsername() {
    	return username.getUsername();
    }
}
