package kr.spring.service;

import java.util.List;

import kr.spring.entity.Talk;

public interface TalkService {

	List<Talk> getTalk(Long room_idx);

	void saveTalk(String transcription, String response, String audioFilePath, Long room_idx, String username);


}
