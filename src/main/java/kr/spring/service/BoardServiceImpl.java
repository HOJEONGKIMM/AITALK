package kr.spring.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.spring.entity.Board;
import kr.spring.entity.Criteria;
import kr.spring.repository.BoardRepository;

@Service
public class BoardServiceImpl implements BoardService {

	private static final int List = 0;
	private static final int Board = 0;
	@Autowired
	private BoardRepository boardRepository;

	@Autowired
	private ImageService imageService;

	@Override
	public void UpdateCount(Long board_idx) {
		boardRepository.UpdateCount(board_idx);
	}

	@Override
	public List<Board> getList() {
		List<Board> boards = boardRepository.findAll();
		return boards;
	}

	@Override
	public Board get(Long board_idx) {
		Optional<Board> oboard = boardRepository.findById(board_idx);
		return oboard.get();
	}

	@Override
	public void register(MultipartFile[] file, Board board) {
		List<MultipartFile> iList = new ArrayList<MultipartFile>();
		if(file != null) {
			for (MultipartFile f : file) {
				
				if (!f.getName().isEmpty()) {
					iList.add(f);
				}
			}
			
		}
		
		ImageSaveDto dto = new ImageSaveDto();
		dto.setImages(iList);
		Gson gson = new Gson();

		String imgs = gson.toJson(imageService.saveImages(dto));
		board.setFileURLs(imgs);

		boardRepository.save(board);

	}

	@Override
	public void delete(Long idx) {
		boardRepository.deleteById(idx);
	}

	@Override
	@Transactional
	public void update(Board board) {
		Optional<Board> oboard = boardRepository.findById(board.getBoard_idx());

		if (oboard.isPresent()) {
			Board boards = oboard.get();
			boards.setTitle(board.getTitle());
			boards.setContent(board.getContent());
			boardRepository.save(boards);
		}
	}

	// 공지사항(notice)게시판
	@Override
	public int noticetotalCount(Criteria criteria) {

		return boardRepository.noticetotalCount(criteria);
	}

	@Override
	public List<Board> noticelist(Criteria criteria) {
		Pageable pageable = PageRequest.of(criteria.getPage() - 1, criteria.getPerPageNum());
		return boardRepository.noticelist(criteria, pageable);
	}

	@Override
	public List<Board> noticesearch(String type, String keyword, Criteria criteria) {
		Pageable pageable = PageRequest.of(criteria.getPage() - 1, criteria.getPerPageNum());
		List<Board> search = boardRepository.noticesearch(type, keyword, pageable);
		return search;
	}

	@Override
	public int noticesearchtotalCount(String type, String keyword) {

		return boardRepository.noticesearchtotalCount(type, keyword);
	}

	// 공부법공유(share)게시판
	@Override
	public int sharetotalCount(Criteria criteria) {

		return boardRepository.sharetotalCount(criteria);
	}

	@Override
	public List<Board> sharelist(Criteria criteria) {
		Pageable pageable = PageRequest.of(criteria.getPage() - 1, criteria.getPerPageNum());
		return boardRepository.sharelist(criteria, pageable);
	}

	@Override
	public List<Board> sharesearch(String type, String keyword, Criteria criteria) {
		Pageable pageable = PageRequest.of(criteria.getPage() - 1, criteria.getPerPageNum());
		List<Board> search = boardRepository.sharesearch(type, keyword, pageable);
		return search;
	}

	@Override
	public int sharesearchtotalCount(String type, String keyword) {

		return boardRepository.sharesearchtotalCount(type, keyword);
	}

	// Q&A(qna)게시판
	@Override
	public int qnatotalCount(Criteria criteria) {

		return boardRepository.qnatotalCount(criteria);
	}

	@Override
	public List<Board> qnalist(Criteria criteria) {
		Pageable pageable = PageRequest.of(criteria.getPage() - 1, criteria.getPerPageNum());
		return boardRepository.qnalist(criteria, pageable);
	}

	@Override
	public List<Board> qnasearch(String type, String keyword, Criteria criteria) {
		Pageable pageable = PageRequest.of(criteria.getPage() - 1, criteria.getPerPageNum());
		List<Board> search = boardRepository.qnasearch(type, keyword, pageable);
		return search;
	}

	@Override
	public int qnasearchtotalCount(String type, String keyword) {

		return boardRepository.qnasearchtotalCount(type, keyword);
	}

	// 학습후기(review)게시판
	@Override
	public int reviewtotalCount(Criteria criteria) {

		return boardRepository.reviewtotalCount(criteria);
	}

	@Override
	public List<Board> reviewlist(Criteria criteria) {
		Pageable pageable = PageRequest.of(criteria.getPage() - 1, criteria.getPerPageNum());
		return boardRepository.reviewlist(criteria, pageable);
	}

	@Override
	public List<Board> reviewsearch(String type, String keyword, Criteria criteria) {
		Pageable pageable = PageRequest.of(criteria.getPage() - 1, criteria.getPerPageNum());
		List<Board> search = boardRepository.reviewsearch(type, keyword, pageable);
		return search;
	}

	@Override
	public int reviewsearchtotalCount(String type, String keyword) {

		return boardRepository.reviewsearchtotalCount(type, keyword);
	}

}
