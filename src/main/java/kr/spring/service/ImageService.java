package kr.spring.service;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.ObjectMetadata;

import kr.spring.entity.Image;
import kr.spring.repository.ImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ImageService {

    private static String bucketName = "aitalk2023";

    private final AmazonS3Client amazonS3Client;
    private final ImageRepository imageRepository;

    @Transactional
    public List<String> saveImages(ImageSaveDto saveDto) {
        List<String> resultList = new ArrayList<>();

        for(MultipartFile multipartFile : saveDto.getImages()) {
            String value = saveImage(multipartFile);
            resultList.add(value);
        }

        return resultList;
    }

    @Transactional
    public String saveImage(MultipartFile multipartFile) {
       
        String originalName = multipartFile.getOriginalFilename();
        
        if (originalName.isEmpty()) {
           return null;
           
        }
        Image image = new Image(originalName);
        
        String filename = image.getStoredName();
        if(filename == null) {
           return null;
        }else {
           try {
              ObjectMetadata objectMetadata = new ObjectMetadata();
              objectMetadata.setContentType(multipartFile.getContentType());
              objectMetadata.setContentLength(multipartFile.getInputStream().available());
              
              amazonS3Client.putObject(bucketName, filename, multipartFile.getInputStream(), objectMetadata);
              
              String accessUrl = amazonS3Client.getUrl(bucketName, filename).toString();
              image.setAccessUrl(accessUrl);
           } catch(IOException e) {
              image.setAccessUrl(null);
           }
           imageRepository.save(image);
           return image.getAccessUrl();
        }
    }
}