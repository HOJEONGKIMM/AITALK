package kr.spring.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.spring.entity.Board;
import kr.spring.entity.Comment;
import kr.spring.entity.Member;
import kr.spring.service.BoardService;
import kr.spring.service.CommentService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {

    @Autowired
    private CommentService commentService;
    
    // 댓글 목록보기
    @GetMapping("/get")
    public @ResponseBody List<Map<String, Object>> get(@RequestParam("board_idx") Board board_idx) {
        List<Comment> comments = commentService.get(board_idx);
        List<Map<String, Object>> response = new ArrayList<>();

        for (Comment comment : comments) {
            Map<String, Object> commentMap = new HashMap<>();
            commentMap.put("comment_idx", comment.getComment_idx());
            commentMap.put("board_idx", comment.getBoard_idx().getBoard_idx());
            commentMap.put("content", comment.getContent());
            commentMap.put("username", comment.getUsername());
            commentMap.put("indate", comment.getIndate());

            response.add(commentMap);
        }

        return response;
    }
    
    // 댓글 추가
    @PostMapping("/add")
    public @ResponseBody void addComment(@RequestParam("board_idx") Board board_idx,
    									@RequestParam("username") Member username,
    									@RequestParam("content") String content) {
    	
    	commentService.addComment(board_idx, username, content);
    }
    
    // 댓글 삭제
    @PostMapping("/delete")
    public @ResponseBody void Delete(@RequestParam("username") Member username, @RequestParam("comment_idx") Long comment_idx) {
    	commentService.delete(username, comment_idx);
    }
    
    // 댓글 수정
    @PostMapping("/update")
    public @ResponseBody void Update(@RequestParam("username") Member username, @RequestParam("comment_idx") Long comment_idx, @RequestParam("content") String content) {
    	commentService.update(username, comment_idx, content);
    }
}
