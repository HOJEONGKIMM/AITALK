package kr.spring.service;

import java.util.List;

import kr.spring.entity.Quiz;

public interface QuizService {
	
	public List<Quiz> getlist(String language); // 문제 전체 조회
}
