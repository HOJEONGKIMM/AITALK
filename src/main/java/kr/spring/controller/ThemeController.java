package kr.spring.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.entity.Theme;
import kr.spring.service.ThemeService;

@Controller
@RequestMapping("/theme/*")
public class ThemeController {

	@Autowired
    private ThemeService themeservice;
	
    @GetMapping("/{playlistId}")
    public String getPlaylistInfo(@PathVariable String playlistId, Model model) throws IOException, GeneralSecurityException {
    	List<Theme> playlist = themeservice.fetchAndSavePlaylistInfo(playlistId);
        model.addAttribute("playlist", playlist);
        return "theme/theme"; // JSP 페이지 이름
    }
	
}
