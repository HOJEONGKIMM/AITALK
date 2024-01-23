package kr.spring.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import kr.spring.entity.Board;
import kr.spring.entity.Criteria;

public interface BoardService {

	public List<Board> getList(); // 게시글 전체조회
	
	public void register(MultipartFile[] file, Board board); // 게시글 등록

	public Board get(Long idx);

	public void delete(Long idx);
	
	public void update(Board board);
	
	public int noticetotalCount(Criteria criteria);

	public List<Board> noticelist(Criteria criteria);
	
    public List<Board> noticesearch(String type, String keyword, Criteria criteria);

    public int noticesearchtotalCount(String type, String keyword);

	public List<Board> sharelist(Criteria criteria);

	public int sharetotalCount(Criteria criteria);

	public List<Board> sharesearch(String type, String keyword, Criteria criteria);

	public int sharesearchtotalCount(String type, String keyword);

	public List<Board> qnalist(Criteria criteria);

	public int qnatotalCount(Criteria criteria);

	public List<Board> qnasearch(String type, String keyword, Criteria criteria);

	public int qnasearchtotalCount(String type, String keyword);

	public List<Board> reviewlist(Criteria criteria);

	public int reviewtotalCount(Criteria criteria);

	public List<Board> reviewsearch(String type, String keyword, Criteria criteria);

	public int reviewsearchtotalCount(String type, String keyword);

	public void UpdateCount(Long board_idx);

	
}
