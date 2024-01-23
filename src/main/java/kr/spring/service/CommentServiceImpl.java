package kr.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Board;
import kr.spring.entity.Comment;
import kr.spring.entity.Member;
import kr.spring.repository.CommentRepository;
import kr.spring.service.CommentService;
import java.util.List;
import java.util.Optional;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentRepository commentRepository;

    @Override
    public List<Comment> get(Board board_idx) {
    	List<Comment> comments = commentRepository.getComment(board_idx);
    	return comments;
    }

    @Override
	public void addComment(Board board_idx, Member username, String content) {
		Comment comment = new Comment();
		comment.setBoard_idx(board_idx);
		comment.setUsername(username);
		comment.setContent(content);
		
		commentRepository.save(comment);
	}

	@Override
	public void delete(Member username, Long comment_idx) {
		Optional<Comment> ocomment = commentRepository.findById(comment_idx);
		Comment comment = ocomment.get();
		if(comment.getUsername() != null && comment.getUsername().equals(username.getUsername())) {
			commentRepository.deleteById(comment_idx);
		}
	}

	@Override
	public void update(Member username, Long comment_idx, String content) {
		Optional<Comment> ocomment = commentRepository.findById(comment_idx);
		Comment comment = ocomment.get();
		if(comment.getUsername() != null && comment.getUsername().equals(username.getUsername())) {
			comment.setContent(content);
			commentRepository.save(comment);
		}
	}


}
