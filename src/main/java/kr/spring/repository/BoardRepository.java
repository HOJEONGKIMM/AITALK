package kr.spring.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import kr.spring.entity.Board;
import kr.spring.entity.Criteria;

@Repository // 메모리로 올리기 위한 어노테이션 (생략가능)
public interface BoardRepository extends JpaRepository<Board, Long>{
										// <> -> 테이블명, PK 데이터타입
	@Modifying
	@Query("UPDATE Board b SET b.title = :title, b.content = :content WHERE b.board_idx = :board_idx")
	void updateBoard(@Param("board_idx") Long board_idx, @Param("title") String title, @Param("content") String content);

	// notice 게시판
	@Query("SELECT b FROM Board b  WHERE b.category = 'notice' ORDER BY b.board_idx DESC")
	List<Board> noticelist(@Param("criteria") Criteria criteria, Pageable pageable);
		
	@Query("SELECT COUNT(*) FROM Board  WHERE category = 'notice' " )
	int noticetotalCount(@Param("criteria") Criteria criteria);
	
	@Query("SELECT e FROM Board e WHERE e.category = 'notice' " +
              "AND ((:type = 'username' AND e.username LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'title' AND e.title LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'content' AND e.content LIKE CONCAT('%', :keyword, '%'))) ORDER BY e.board_idx DESC")
	List<Board> noticesearch(@Param("type") String type, @Param("keyword") String keyword, Pageable pageable);
		
	@Query("SELECT COUNT(*) FROM Board e  WHERE e.category = 'notice' " +
              "AND ((:type = 'username' AND e.username LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'title' AND e.title LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'content' AND e.content LIKE CONCAT('%', :keyword, '%')))" )
	int noticesearchtotalCount(@Param("type") String type, @Param("keyword") String keyword);
	
	// share 게시판
	@Query("SELECT b FROM Board b  WHERE b.category = 'share' ORDER BY b.board_idx DESC")
	List<Board> sharelist(@Param("criteria") Criteria criteria, Pageable pageable);
		
	@Query("SELECT COUNT(*) FROM Board  WHERE category = 'share' " )
	int sharetotalCount(@Param("criteria") Criteria criteria);
	
	@Query("SELECT e FROM Board e WHERE e.category = 'share' " +
              "AND ((:type = 'username' AND e.username LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'title' AND e.title LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'content' AND e.content LIKE CONCAT('%', :keyword, '%'))) ORDER BY e.board_idx DESC")
	List<Board> sharesearch(@Param("type") String type, @Param("keyword") String keyword, Pageable pageable);
		
	@Query("SELECT COUNT(*) FROM Board e  WHERE e.category = 'share' " +
              "AND ((:type = 'username' AND e.username LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'title' AND e.title LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'content' AND e.content LIKE CONCAT('%', :keyword, '%')))" )
	int sharesearchtotalCount(@Param("type") String type, @Param("keyword") String keyword);	

	// Q&A 게시판
	@Query("SELECT b FROM Board b  WHERE b.category = 'qna' ORDER BY b.board_idx DESC")
	List<Board> qnalist(@Param("criteria") Criteria criteria, Pageable pageable);
		
	@Query("SELECT COUNT(*) FROM Board  WHERE category = 'qna' " )
	int qnatotalCount(@Param("criteria") Criteria criteria);
	
	@Query("SELECT e FROM Board e WHERE e.category = 'qna' " +
              "AND ((:type = 'username' AND e.username LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'title' AND e.title LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'content' AND e.content LIKE CONCAT('%', :keyword, '%'))) ORDER BY e.board_idx DESC")
	List<Board> qnasearch(@Param("type") String type, @Param("keyword") String keyword, Pageable pageable);
		
	@Query("SELECT COUNT(*) FROM Board e  WHERE e.category = 'qna' " +
              "AND ((:type = 'username' AND e.username LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'title' AND e.title LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'content' AND e.content LIKE CONCAT('%', :keyword, '%')))" )
	int qnasearchtotalCount(@Param("type") String type, @Param("keyword") String keyword);

	// review 게시판
	@Query("SELECT b FROM Board b  WHERE b.category = 'review' ORDER BY b.board_idx DESC")
	List<Board> reviewlist(@Param("criteria") Criteria criteria, Pageable pageable);
		
	@Query("SELECT COUNT(*) FROM Board  WHERE category = 'review' " )
	int reviewtotalCount(@Param("criteria") Criteria criteria);
	
	@Query("SELECT e FROM Board e WHERE e.category = 'review' " +
              "AND ((:type = 'username' AND e.username LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'title' AND e.title LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'content' AND e.content LIKE CONCAT('%', :keyword, '%'))) ORDER BY e.board_idx DESC")
	List<Board> reviewsearch(@Param("type") String type, @Param("keyword") String keyword, Pageable pageable);
		
	@Query("SELECT COUNT(*) FROM Board e  WHERE e.category = 'review' " +
              "AND ((:type = 'username' AND e.username LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'title' AND e.title LIKE CONCAT('%', :keyword, '%')) " +
              "OR (:type = 'content' AND e.content LIKE CONCAT('%', :keyword, '%')))" )
	int reviewsearchtotalCount(@Param("type") String type, @Param("keyword") String keyword);
    
	@Transactional
    @Modifying
    @Query("UPDATE Board p SET p.count = p.count + 1 WHERE p.board_idx = :board_idx")
    	void UpdateCount(@Param("board_idx") Long board_idx);
	
}
