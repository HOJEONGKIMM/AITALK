package kr.spring.service;


import com.google.api.gax.core.FixedCredentialsProvider;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.texttospeech.v1.*;
import com.google.protobuf.ByteString;

import com.google.cloud.texttospeech.v1.AudioConfig;
import com.google.cloud.texttospeech.v1.AudioEncoding;
import com.google.cloud.texttospeech.v1.SsmlVoiceGender;
import com.google.cloud.texttospeech.v1.SynthesisInput;
import com.google.cloud.texttospeech.v1.SynthesizeSpeechResponse;
import com.google.cloud.texttospeech.v1.TextToSpeechClient;
import com.google.cloud.texttospeech.v1.VoiceSelectionParams;
import com.google.protobuf.ByteString;
import java.io.FileOutputStream;
import java.io.OutputStream;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Service;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

@Service
public class TextToSpeechServiceImpl implements TextToSpeechService {

    @Override
    public String ttsService(String text, String language) {
    	
    	// 무슨 언어로 설정할 것인지 하는 변수
    	String translang;
    	String speaker;
    	
    	if(language.equals("ENG")) {
    		translang = "en-US";
    		speaker = "en-US-Neural2-D";
    	}else if(language.equals("JPN")) {
    		translang = "ja-JP";
    		speaker = "ja-JP-Standard-C";
    	}else if(language.equals("CHN")) {
    		translang = "cmn-CN";
    		speaker = "cmn-CN-Standard-B";
    	}else if(language.equals("SPN")) {
    		translang = "es-ES";
    		speaker = "es-ES-Standard-B";
    	}else {
    		translang = "en-US";
    		speaker = "en-US-Neural2-D";
    	}
    	
        // 자격증명 파일 경로
        String jsonPath = "src/main/resources/static/file/speechtotext-403800-45b60a30a8f0.json";
        try (FileInputStream credentialsStream = new FileInputStream(jsonPath)) {
            // 자격증명을 로드합니다.
            GoogleCredentials credentials = GoogleCredentials.fromStream(credentialsStream);

            // 자격증명을 사용하여 TextToSpeechClient를 생성합니다.
            try (TextToSpeechClient textToSpeechClient = TextToSpeechClient.create(TextToSpeechSettings.newBuilder().setCredentialsProvider(FixedCredentialsProvider.create(credentials)).build())) {
                System.out.println(textToSpeechClient);
            	
            	
            	SynthesisInput input = SynthesisInput.newBuilder().setText(text).build();
                VoiceSelectionParams voice = VoiceSelectionParams.newBuilder()
                        .setLanguageCode(translang)
                        .setName(speaker)
                        .build();

				AudioConfig audioConfig = AudioConfig.newBuilder()
				.setAudioEncoding(AudioEncoding.LINEAR16)
				.build();

/*                ByteString audioContents = textToSpeechClient.synthesizeSpeech(input, voice, audioConfig).getAudioContent();
                
                File tempFile = File.createTempFile("tts", ".mp3", new File("C:/Users/gjaischool1/Downloads/tts"));
                
                try (OutputStream out = new FileOutputStream(tempFile)) {
                    out.write(audioContents.toByteArray());
                }

                return "C:/Users/gjaischool1/Downloads/tts" + tempFile.getName();
            }*/
				ByteString audioContents = textToSpeechClient.synthesizeSpeech(input, voice, audioConfig).getAudioContent();
                System.out.println("audioContents"+audioContents);
                String audioBase64 = Base64.encodeBase64String(audioContents.toByteArray());
                System.out.println("audioBase64"+audioBase64.length());
                
                return audioBase64;
            }
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
