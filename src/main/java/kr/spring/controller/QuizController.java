package kr.spring.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.spring.entity.Quiz;
import kr.spring.service.QuizService;

@Controller
@RequestMapping("/quiz/*")
public class QuizController {
	
	@Autowired
	private QuizService quizService;

	@RequestMapping("/quiz") // 이 부분을 수정하여 해당 URL로 GET 요청이 들어왔을 때 아래 메서드가 호출됩니다.
    public String startQuiz() {
        return "quiz/quiz"; // 템플릿의 경로를 반환합니다.
    }
	
	@GetMapping("/initial-quiz")
	@ResponseBody
    public List<Quiz> getInitialQuizData(@RequestParam("language") String language) {
        List<Quiz> quizs = quizService.getlist(language);
        return quizs;
    }
    
}
