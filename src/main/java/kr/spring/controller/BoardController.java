package kr.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.spring.entity.Board;
import kr.spring.entity.Criteria;
import kr.spring.entity.PageMaker;
import kr.spring.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	private BoardService boardService;

	// 공지사항게시판 페이징
	@RequestMapping("/notice")
	public String noticelist(Model model, Criteria criteria) {
		// 이제는 페이지 정보를 알고 있는 Criteria 객체를 Service에게 전달
		List<Board> list = boardService.noticelist(criteria);
		List<Board> AllList = boardService.getList();
		// 페이징 처리에 필요한 PageMaker객체도 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria); // pageMaker가 페이징 기법을 하기위한 cri객체 전달
		pageMaker.setTotalCount(boardService.noticetotalCount(criteria)); // 페이지 기법을 하려면 전체 게시글 개수 알려줘야함
		model.addAttribute("list", list);
		model.addAttribute("AllList", AllList);
		model.addAttribute("pageMaker", pageMaker); // 페이징 정보를 알고있는 객체 전달
		return "board/notice";
	}

	// 공지사항게시판 검색기능
	@PostMapping("/notice")
	public String noticesearch(@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "keyword", required = false) String keyword, Model model, Criteria criteria) {
		// 검색 조건과 페이징 정보를 포함하여 검색 결과 조회
		List<Board> AllList = boardService.getList();
		List<Board> list = boardService.noticesearch(type, keyword, criteria);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.noticesearchtotalCount(type, keyword)); // 검색 결과에 대한 총 개수 설정 필요
		model.addAttribute("list2", list);
		model.addAttribute("AllList", AllList);
		model.addAttribute("pageMaker2", pageMaker);
		return "board/notice";
	}

	// 공부법공유게시판 페이징
	@RequestMapping("/share")
	public String sharelist(Model model, Criteria criteria) {
		// 이제는 페이지 정보를 알고 있는 Criteria 객체를 Service에게 전달
		List<Board> list = boardService.sharelist(criteria);
		List<Board> AllList = boardService.getList();
		// 페이징 처리에 필요한 PageMaker객체도 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria); // pageMaker가 페이징 기법을 하기위한 cri객체 전달
		pageMaker.setTotalCount(boardService.sharetotalCount(criteria)); // 페이지 기법을 하려면 전체 게시글 개수 알려줘야함
		model.addAttribute("list", list);
		model.addAttribute("AllList", AllList);
		model.addAttribute("pageMaker", pageMaker); // 페이징 정보를 알고있는 객체 전달
		return "board/share";
	}

	// 공지사항게시판 검색기능
	@PostMapping("/share")
	public String sharesearch(@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "keyword", required = false) String keyword, Model model, Criteria criteria) {
		// 검색 조건과 페이징 정보를 포함하여 검색 결과 조회
		List<Board> AllList = boardService.getList();
		List<Board> list = boardService.sharesearch(type, keyword, criteria);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.sharesearchtotalCount(type, keyword)); // 검색 결과에 대한 총 개수 설정 필요
		model.addAttribute("list2", list);
		model.addAttribute("AllList", AllList);
		model.addAttribute("pageMaker2", pageMaker);
		return "board/share";
	}

	// Q&A게시판 페이징
	@RequestMapping("/qna")
	public String qnalist(Model model, Criteria criteria) {
		// 이제는 페이지 정보를 알고 있는 Criteria 객체를 Service에게 전달
		List<Board> list = boardService.qnalist(criteria);
		List<Board> AllList = boardService.getList();
		// 페이징 처리에 필요한 PageMaker객체도 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria); // pageMaker가 페이징 기법을 하기위한 cri객체 전달
		pageMaker.setTotalCount(boardService.qnatotalCount(criteria)); // 페이지 기법을 하려면 전체 게시글 개수 알려줘야함
		model.addAttribute("list", list);
		model.addAttribute("AllList", AllList);
		model.addAttribute("pageMaker", pageMaker); // 페이징 정보를 알고있는 객체 전달
		return "board/qna";
	}

	// 공지사항게시판 검색기능
	@PostMapping("/qna")
	public String qnasearch(@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "keyword", required = false) String keyword, Model model, Criteria criteria) {
		// 검색 조건과 페이징 정보를 포함하여 검색 결과 조회
		List<Board> AllList = boardService.getList();
		List<Board> list = boardService.qnasearch(type, keyword, criteria);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.qnasearchtotalCount(type, keyword)); // 검색 결과에 대한 총 개수 설정 필요
		model.addAttribute("list2", list);
		model.addAttribute("AllList", AllList);
		model.addAttribute("pageMaker2", pageMaker);
		return "board/qna";
	}

	// 학습후기게시판 페이징
	@RequestMapping("/review")
	public String reviewlist(Model model, Criteria criteria) {
		// 이제는 페이지 정보를 알고 있는 Criteria 객체를 Service에게 전달
		List<Board> list = boardService.reviewlist(criteria);
		List<Board> AllList = boardService.getList();
		// 페이징 처리에 필요한 PageMaker객체도 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria); // pageMaker가 페이징 기법을 하기위한 cri객체 전달
		pageMaker.setTotalCount(boardService.reviewtotalCount(criteria)); // 페이지 기법을 하려면 전체 게시글 개수 알려줘야함
		model.addAttribute("list", list);
		model.addAttribute("AllList", AllList);
		model.addAttribute("pageMaker", pageMaker); // 페이징 정보를 알고있는 객체 전달
		return "board/review";
	}

	// 공지사항게시판 검색기능
	@PostMapping("/review")
	public String reviewsearch(@RequestParam(value = "type", required = false) String type,
			@RequestParam(value = "keyword", required = false) String keyword, Model model, Criteria criteria) {
		// 검색 조건과 페이징 정보를 포함하여 검색 결과 조회
		List<Board> AllList = boardService.getList();
		List<Board> list = boardService.reviewsearch(type, keyword, criteria);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.reviewsearchtotalCount(type, keyword)); // 검색 결과에 대한 총 개수 설정 필요
		model.addAttribute("list2", list);
		model.addAttribute("AllList", AllList);
		model.addAttribute("pageMaker2", pageMaker);
		return "board/review";
	}

	// 게시물 상세보기
	@GetMapping("/get")
	public @ResponseBody Map<String, Object> get(Long board_idx) {
		Board board = boardService.get(board_idx);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("board_idx", board.getBoard_idx());
		map.put("category", board.getCategory());
		map.put("title", board.getTitle());
		map.put("content", board.getContent());
		map.put("username", board.getUsername());
		map.put("fileURLs", board.getFileURLs());
		map.put("indate", board.getIndate().toString());
		map.put("available", board.getAvailable());
		map.put("count", board.getCount());
		System.out.println(map + "null");
		return map;
	}
	
	// 게시판글 조회수 늘리기
    @PutMapping("/UpdateCount")
    public @ResponseBody void UpdateCount(Long board_idx){
    	boardService.UpdateCount(board_idx);
    }

	@PostMapping("/register")
	public String register(MultipartFile[] file, Board board) {
		System.out.println(file + "파일 정보 있나");
		boardService.register(file, board);
	    System.out.println(file + "넌 출력되니?");
	    return "redirect:/board/" + board.getCategory();
	}

	// 게시물 삭제
	@GetMapping("/remove")
	public String remove(@RequestParam("board_idx") Long board_idx) {
		Board board = boardService.get(board_idx);
		boardService.delete(board_idx);
		return "redirect:/board/" + board.getCategory();
	}

	// 게시물 수정
	@PostMapping("/modify")
	public String modify(Board board) {
		System.out.println(board.toString());
		boardService.update(board);
		return "redirect:/board/" + board.getCategory();
	}

}
