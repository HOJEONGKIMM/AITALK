package kr.spring.service;

import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.speech.v1.*;
import com.google.protobuf.ByteString;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.google.api.gax.core.FixedCredentialsProvider;
import com.google.cloud.speech.v1.SpeechSettings;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.File;
import java.io.IOException;
import javax.sound.sampled.*;



@Service
public class SpeechServiceImpl implements SpeechService {

    private final String jsonPath = "src/main/resources/static/file/speechtotext-403800-45b60a30a8f0.json";
    
    @Autowired
    private AudioConverter audioConverter;

    @Override
    public String transcribe(MultipartFile audioFile, String language) {
    	// 무슨 언어로 설정할 것인지 하는 변수
    	String translang;
    	
    	if(language.equals("ENG")) {
    		translang = "en-US";
    	}else if(language.equals("JPN")) {
    		translang = "ja-JP";
    	}else if(language.equals("CHN")) {
    		translang = "cmn-Hans-CN";
    	}else if(language.equals("SPN")) {
    		translang = "es-ES";
    	}else {
    		translang = "en-US";
    	}
    	
        try {
            File inputFile = convertToFile(audioFile);
            System.out.println("서버 :"+inputFile);
            
            File convertedFile = audioConverter.convertToLinear16(inputFile);
            ByteString audioBytes = ByteString.copyFrom(Files.readAllBytes(convertedFile.toPath()));
            ServiceAccountCredentials credentials = ServiceAccountCredentials.fromStream(Files.newInputStream(Paths.get(jsonPath)));
            SpeechSettings settings = SpeechSettings.newBuilder().setCredentialsProvider(FixedCredentialsProvider.create(credentials)).build();

            try (SpeechClient speechClient = SpeechClient.create(settings)) {
                RecognitionConfig config = RecognitionConfig.newBuilder()
                        .setEncoding(RecognitionConfig.AudioEncoding.LINEAR16)
                        .setLanguageCode(translang)
                        .build();
                RecognitionAudio recognitionAudio = RecognitionAudio.newBuilder().setContent(audioBytes).build();
                RecognizeResponse response = speechClient.recognize(config, recognitionAudio);
                StringBuilder transcription = new StringBuilder();
                for (SpeechRecognitionResult result : response.getResultsList()) {
                    transcription.append(result.getAlternativesList().get(0).getTranscript());
                }
                inputFile.delete();
                convertedFile.delete();

                return transcription.toString();
            } catch (Exception e) {
            	inputFile.delete();
                convertedFile.delete();
                throw new RuntimeException("오류 발생", e);
			}
        } catch (IOException | InterruptedException e) {
            throw new RuntimeException("오류 발생", e);
        }
    }

    private File convertToFile(MultipartFile multipartFile) throws IOException {
        File convFile = new File(System.getProperty("java.io.tmpdir"), multipartFile.getOriginalFilename());
        multipartFile.transferTo(convFile);
        return convFile;
    }
}
