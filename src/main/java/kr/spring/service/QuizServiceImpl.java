package kr.spring.service;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Quiz;
import kr.spring.repository.QuizRepository;

@Service
public class QuizServiceImpl implements QuizService{
	
	@Autowired
	private QuizRepository quizRepository;
	
	@Override
	public List<Quiz> getlist(String language) {
		List<Quiz> quizlist = quizRepository.findAll();
		List<Quiz> userLanguageList = new ArrayList<>();
		
		for (Quiz quiz : quizlist) {
			if(quiz.getLanguage().equals(language)) {
				userLanguageList.add(quiz);
			}
		}
		
		return userLanguageList;
	}

}
