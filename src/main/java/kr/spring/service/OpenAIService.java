package kr.spring.service;

import java.io.IOException;

public interface OpenAIService {

	String getResponseFromOpenAI(String inputText) throws IOException;

}
