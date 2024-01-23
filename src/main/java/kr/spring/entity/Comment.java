package kr.spring.entity;

import java.util.Date;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long comment_idx; // 댓글 고유번호

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "board_idx") // Board의 bd_idx와 연결
    @ToString.Exclude
    private Board board_idx;

    @Column(length = 1000) // 댓글 내용 길이
    private String content;

    @ManyToOne(fetch = FetchType.EAGER) // 댓글 작성자 (Member 엔터티와 연결)
    @JoinColumn(name = "username")
    @ToString.Exclude
    private Member username;

    @Column(insertable = false, updatable = false, columnDefinition = "datetime default now()")
    private Date indate; // 댓글 작성 시간
    
    public Long getBoardIdx() {
    	return board_idx.getBoard_idx();
    }
    
    public String getUsername() {
    	return username.getUsername();
    }

    @Override
    public String toString() {
        return getClass().getName() + "{" +
                "comment_idx=" + comment_idx +
                ", content='" + content + '\'' +
                ", username=" + username.getUsername() +
                ", board_idx=" + board_idx.getBoard_idx() +
                '}';
    }
    
}
