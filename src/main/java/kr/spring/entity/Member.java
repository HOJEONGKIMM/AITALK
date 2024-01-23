package kr.spring.entity;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.sun.istack.NotNull;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString
public class Member {

	@Id
	private String username; // Spring Sequrity에서는 id가 아닌 username으로 지정?
	
	@Column(nullable = false)
	private String password; // Spring Sequrity에서는 pw가 아닌 password로 지정
	
	@Enumerated(EnumType.STRING) // @Enumerated -> 열거형 (권한이 여러개이기 때문에)
	private Role role; // 권한정보
	
	@Column(nullable = false)
	private String fullname; // 이름
	
	@Column(nullable = false)
	private Long age; // 나이
	
	private String email; // 이메일
	
	private String gender; // 성별
	
	private String phone; // 폰번호 
	
	private String addr; // 주소
	
	@Column(columnDefinition = "varchar default 'ENG'")
	private String language; // 언어
	
	@Column(insertable = false, updatable = false, columnDefinition = "datetime default now()")
	private LocalDateTime joined_at; // 가입일자
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "username")
	private List<Board> board = new ArrayList<Board>();
	
	@OneToMany(mappedBy = "username")
	private List<Subscription> subscription = new ArrayList<Subscription>();
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "username")
	private List<Comment> comment = new ArrayList<Comment>();
	
	@PrePersist
    public void prePersist() {
        if (language == null) { // language가 null일 때만 기본값 설정
            language = "ENG";
        }
    }
	
	@Override
	public String toString() {
		return "MEMBER";
	}
}
