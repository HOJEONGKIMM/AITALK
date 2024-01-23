package kr.spring.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.spring.entity.Room;
import kr.spring.entity.Talk;
import kr.spring.service.OpenAIService;
import kr.spring.service.RoomService;
import kr.spring.service.SpeechService;
import kr.spring.service.TalkService;
import kr.spring.service.TextToSpeechService;

import org.springframework.http.HttpStatus;


@Controller
@RequestMapping("/aitalk/*")
public class TalkController {

    
    @RequestMapping("/talktalk")
    public String list(Model model) {
        return "aitalk/talktalk";
    }

    @Autowired
    private OpenAIService openAIService;
    
    @Autowired
    private SpeechService speechService;

    @Autowired
	private TextToSpeechService textToSpeechService;
    
    @Autowired
    private TalkService talkService;
    
    @Autowired
    private RoomService roomService;

    @Autowired
    public TalkController(OpenAIService openAIService, SpeechService speechService, TextToSpeechService textToSpeechService) {
        this.openAIService = openAIService;
        this.speechService = speechService;
        this.textToSpeechService = textToSpeechService;
    }
    
    
//    @PostMapping(value ="/transcribe", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
//    public String handleAudioUpload(@RequestParam("audioFile") MultipartFile audioFile, Model model) throws IOException{
//        // STT 변환 서비스를 호출하여 결과를 얻습니다.
//        String transcription = speechService.transcribe(audioFile);
//        // 변환된 텍스트를 모델에 추가합니다.
//        System.out.println("transcription:"+transcription);
//        model.addAttribute("transcription", transcription);
//
//        // 같은 `talktalk.jsp` 페이지에 결과를 표시합니다.
//        return "aitalk/talktalk";
//    }
    
    @PostMapping("/useOpenAI")
    public String useOpenAI(@RequestParam("inputText") String inputText, Model model) {

		String response = null;
		try {
			response = openAIService.getResponseFromOpenAI(inputText);
			System.out.println("response값 확인:"+response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("response", response);
		return "aitalk/talktalk";
        
    }
    
//    @PostMapping("/ttsservice")
//    public String streamAudioFile(@RequestParam("text") String text, Model model) throws IOException {
//        String audioFilePath = textToSpeechService.ttsService(text); // 텍스트를 음성으로 변환하고 파일 경로를 얻음
//
//        model.addAttribute("audioFilePath", audioFilePath); // 모델에 오디오 파일 경로 추가
//        System.out.println(audioFilePath);
//        
//        return "aitalk/talktalk"; // 오디오 파일을 재생할 JSP 페이지로 이동
//    }
    
    @PostMapping("/aitalktalk")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> aitalk(@RequestParam("audioChunks") String audioChunks, @RequestParam("language") String language, Model model) throws IOException {
    	Map<String, Object> responseMap = new HashMap<>();

    	System.out.println(language + "컨트롤러 진행");
    	try {
    		System.out.println(language + "try 진행");
//            String transcription = speechService.transcribe(audioFile,language);
            String response = openAIService.getResponseFromOpenAI(audioChunks);
            //String audioFilePath = textToSpeechService.ttsService(response,language);

            System.out.println(audioChunks + "트랜스");
            System.out.println(response + "리스폰");
            //System.out.println(audioFilePath + "파일경로");
            
            String audioData = textToSpeechService.ttsService(response, language);
            System.out.println("컨트롤러:"+audioData);
            
            
            responseMap.put("transcription", audioChunks);
            responseMap.put("response", response);
            responseMap.put("audioBase64", audioData);
            System.out.println(responseMap);
            //model.addAttribute("audioFilePath", audioFilePath);
            
            
            return ResponseEntity.ok(responseMap);
        } catch (IOException e) {
            e.printStackTrace();
            // 에러 처리
            responseMap.put("error", "처리 중 오류 발생");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(responseMap);
        }
    
    }
    
    @GetMapping("/getRoom")
    public @ResponseBody List<Room> getRoom(@RequestParam("username") String urername) {
    	List<Room> room = roomService.getRoom(urername);
    	return room;
    }
    
    @GetMapping("/getTalk")
    public @ResponseBody List<Talk> getTalk(@RequestParam("room_idx") Long room_idx){
    	List<Talk> talk = talkService.getTalk(room_idx);
    	return talk;
    }
    
    @PostMapping("/createRoom")
    public @ResponseBody void createRoom(@RequestParam("username") String username) {
    	roomService.createRoom(username);
    }
    
    @PostMapping("/saveTalk")
    public @ResponseBody void saveTalk(@RequestParam("response") String response,
    									@RequestParam("audioBase64") String audioBase64,
    									@RequestParam("transcription") String transcription,
    									@RequestParam("room_idx") Long room_idx,
    									@RequestParam("username") String username) {
    	talkService.saveTalk(transcription, response, audioBase64, room_idx, username);
    }
}

