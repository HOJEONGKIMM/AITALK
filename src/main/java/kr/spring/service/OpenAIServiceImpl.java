package kr.spring.service;

import org.apache.http.HttpResponse;
import org.apache.http.ParseException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.spring.repository.TalkRepository;

import org.json.JSONObject;
import org.json.JSONArray;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

@Service
public class OpenAIServiceImpl implements OpenAIService {

	@Value("${openai.api.key}")
	private String apiKey;
	
    private static final String API_URL = "https://api.openai.com/v1/chat/completions";
    private TalkRepository talkRepository;

    // API 키를 파일에서 읽어오는 메서드
    private static String readApiKeyFromFile(String filePath) throws IOException {
        return new String(Files.readAllBytes(Paths.get(filePath))).trim();
    }

    
    
    @Override
    public String getResponseFromOpenAI(String inputText) {
		
		HttpClient httpClient = HttpClients.createDefault();
		HttpPost request = new HttpPost(API_URL);
		request.setHeader("Authorization", "Bearer " + apiKey);
		request.setHeader("Content-Type", "application/json");
		
		JSONObject jsonBodyObj = new JSONObject();
		
		jsonBodyObj.put("model", "gpt-3.5-turbo");

		JSONArray messages = new JSONArray();
		messages.put(new JSONObject().put("role", "system").put("content", "You are a helpful assistant."));
		messages.put(new JSONObject().put("role", "system").put("content", "You have to speak like a human and please speak under three sentences"));
		messages.put(new JSONObject().put("role", "system").put("content", "You must ask a question after your answer."));
		messages.put(new JSONObject().put("role", "system").put("content", "You must speak in the question's language."));
		messages.put(new JSONObject().put("role", "system").put("content", "You must speak only one language."));

		messages.put(new JSONObject().put("role", "user").put("content", inputText)); // 사용자 입력

		jsonBodyObj.put("messages", messages);
		jsonBodyObj.put("max_tokens", 150);  // 글자 제한
		
		StringEntity requestEntity = new StringEntity(jsonBodyObj.toString(), "UTF-8");
		request.setEntity(requestEntity);
        
        // Executing request
        HttpResponse response = null;
		try {
			response = httpClient.execute(request);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String responseString = null;
		try {
			responseString = EntityUtils.toString(response.getEntity(), "UTF-8");
		} catch (ParseException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Parsing response
        JSONObject jsonResponse = new JSONObject(responseString);
        JSONArray choices = jsonResponse.getJSONArray("choices");
        if (choices.length() > 0) {
            JSONObject firstChoice = choices.getJSONObject(0);
            JSONObject message = firstChoice.getJSONObject("message");
            String talk = message.getString("content");
            return talk;
        }
	return "실패";
            
    }
}
