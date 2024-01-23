package kr.spring.service;

import kr.spring.entity.Board;
import kr.spring.entity.Comment;
import kr.spring.entity.Member;

import java.util.List;

public interface CommentService {

	List<Comment> get(Board board_idx);

	void addComment(Board board_idx, Member username, String content);

	void delete(Member username, Long comment_idx);

	void update(Member username, Long comment_idx, String content);
    
}
