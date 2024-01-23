package kr.spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.google.api.services.youtube.model.Playlist;
import com.google.api.services.youtube.model.PlaylistItem;
import com.google.api.services.youtube.model.PlaylistItemListResponse;
import com.google.api.services.youtube.model.PlaylistItemSnippet;

import kr.spring.entity.Theme;
import kr.spring.entity.YouTubeApiUtil;
import kr.spring.repository.ThemeRepository;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ThemeServiceImpl implements ThemeService {

	@Autowired
    private ThemeRepository themeRepository;
	@Autowired
    private YouTubeApiUtil youTubeApiUtil;

    public List<Theme> fetchAndSavePlaylistInfo(String playlistId) throws IOException, GeneralSecurityException {
        PlaylistItemListResponse playlistItems = youTubeApiUtil.getPlaylistItems(playlistId);

        List<Theme> savedThemes = new ArrayList<>();

        if (!playlistItems.getItems().isEmpty()) {
            for (PlaylistItem item : playlistItems.getItems()) {
                PlaylistItemSnippet snippet = item.getSnippet();

                Theme theme = new Theme();
                theme.setTitle(snippet.getTitle());
                theme.setUrl("https://www.youtube.com/watch?v=" + item.getContentDetails().getVideoId());
                theme.setCaption(snippet.getDescription());
                // 'language'와 'translate' 필드는 추가적인 처리가 필요
                theme.setLanguage("언어 설정"); // 언어 설정 필요
                theme.setTranslate("번역 필요"); // 번역 처리 필요

                // savedThemes.add(themeRepository.save(theme)); 재생목록 db저장 코드
            }
            List<Theme> themes = themeRepository.findAll(); // 모든 Theme 인스턴스를 조회
            savedThemes.addAll(themes); // 조회한 Theme 리스트를 savedThemes에 추가
        } else {
            throw new IOException("No items found in the playlist.");
        }
        
        return savedThemes;
    }
        
        
        
    

	
}
