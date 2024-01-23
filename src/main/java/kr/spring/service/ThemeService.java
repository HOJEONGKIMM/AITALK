package kr.spring.service;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.List;

import kr.spring.entity.Theme;

public interface ThemeService {

	public List<Theme> fetchAndSavePlaylistInfo(String playlistId) throws IOException, GeneralSecurityException;
	
}
