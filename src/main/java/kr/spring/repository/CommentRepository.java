package kr.spring.repository;

import kr.spring.entity.Board;
import kr.spring.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {

	@Query("SELECT c FROM Comment c WHERE c.board_idx = :board_idx")
	public List<Comment> getComment(@Param("board_idx") Board board_idx);
	
}
