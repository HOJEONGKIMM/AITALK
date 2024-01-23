package kr.spring.entity;

import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.Playlist;
import com.google.api.services.youtube.model.PlaylistItemListResponse;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeRequestUrl;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.util.store.FileDataStoreFactory;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.util.Collection;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;

@Component
public class YouTubeApiUtil {
    private final String APPLICATION_NAME = "YouTube API Client";
    private final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
    
    @Value("${youtube.api.key}")
    private String apiKey;

    public YouTube getService() throws GeneralSecurityException, IOException {
        return new YouTube.Builder(GoogleNetHttpTransport.newTrustedTransport(), JSON_FACTORY, (HttpRequestInitializer) null)
                .setApplicationName(APPLICATION_NAME)
                .build();
    }

    public PlaylistItemListResponse getPlaylistItems(String playlistId) throws IOException, GeneralSecurityException {
        YouTube youtubeService = getService();
        playlistId="PLZbVbFUCvTlrKrN2ree9qoJ2Okp-tY93D";
        YouTube.PlaylistItems.List request = youtubeService.playlistItems()
                .list("snippet,contentDetails")
                .setPlaylistId(playlistId)
                .setMaxResults(25L)
                .setKey(apiKey);

        return request.execute();
    }
}