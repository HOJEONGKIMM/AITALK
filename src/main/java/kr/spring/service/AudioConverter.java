package kr.spring.service;
import org.springframework.stereotype.Service;
import java.io.File;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

@Service
public class AudioConverter {
    public File convertToLinear16(File inputFile) throws IOException, InterruptedException {
        String outputPath = inputFile.getPath()+ ".wav"; // 수정된 부분
        File outputFile = new File(outputPath);

        ProcessBuilder processBuilder = new ProcessBuilder(
        		"ffmpeg", "-i", inputFile.getAbsolutePath(), "-acodec", "pcm_s16le", "-ar", "16000", "-ac", "1", outputPath);
        Process process = processBuilder.start();
      
        if (!process.waitFor(5, TimeUnit.SECONDS)) {
            // 프로세스가 5초 안에 완료되지 않았을 경우
            // 프로세스를 강제 종료하거나 사용자에게 알림 등의 조치를 취할 수 있습니다.
           // process.destroy();
        }
        
        return outputFile;
    }
}