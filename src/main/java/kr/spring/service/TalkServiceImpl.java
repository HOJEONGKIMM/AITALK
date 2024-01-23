package kr.spring.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Room;
import kr.spring.entity.Talk;
import kr.spring.repository.RoomRepository;
import kr.spring.repository.TalkRepository;

@Service
public class TalkServiceImpl implements TalkService{

	@Autowired
	private TalkRepository talkRepository;
	
	@Autowired
	private RoomRepository roomRepository;

	@Override
	public List<Talk> getTalk(Long room_idx) {
		List<Talk> talk = talkRepository.getByRoomIdx(room_idx);
		return talk;
	}

	@Override
	public void saveTalk(String transcription, String response, String audioFilePath, Long room_idx, String username) {
		Talk talkUser = new Talk();
		Talk talkAi = new Talk();
		
		talkUser.setRoom_idx(room_idx);
		talkUser.setTalk(transcription);
		talkUser.setUsername(username);
		talkRepository.save(talkUser);
		
		try {
	        // 1초 대기
	        Thread.sleep(1000);
	    } catch (InterruptedException e) {
	        // 스레드가 중단되면 처리
	        Thread.currentThread().interrupt();
	    }
		
		talkAi.setRoom_idx(room_idx);
		talkAi.setTalk(response);
		talkAi.setUsername("AI-Tutor");
		talkRepository.save(talkAi);
		
		Room room = roomRepository.getById(room_idx);
		System.out.println(room);
		if(room.getTitle() == null || room.getTitle().isEmpty()) {
				Room setRoom = new Room();
				setRoom.setRoom_idx(room.getRoom_idx());
				setRoom.setUsername(room.getUsername());
				setRoom.setTitle(transcription);
				setRoom.setOpened_at(room.getOpened_at());
				roomRepository.save(setRoom);
		}
	}

}
