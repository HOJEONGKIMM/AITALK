package kr.spring.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import kr.spring.service.ImageSaveDto;
import kr.spring.service.ImageService;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/board/share") // URL의 기본 경로를 설정합니다.
public class ImageController {

    private final ImageService imageService;

    @PostMapping("/upload") // 'upload' 엔드포인트를 추가합니다.
    @ResponseStatus(HttpStatus.OK)
    public List<String> saveImage(MultipartFile[] file) {
    	
    	List<MultipartFile> iList = new ArrayList<MultipartFile>();
    	
    	for( MultipartFile f : file) {
    		iList.add(f);
    	}
    	
    	ImageSaveDto  dto = new ImageSaveDto();
    	
    	dto.setImages(iList);
    	
        return imageService.saveImages(dto);
    }
    
    
}