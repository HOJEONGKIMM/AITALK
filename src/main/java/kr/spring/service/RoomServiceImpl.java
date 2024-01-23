package kr.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.spring.entity.Room;
import kr.spring.repository.RoomRepository;
@Service
public class RoomServiceImpl implements RoomService{

	@Autowired
	private RoomRepository roomRepository;
	
	@Override
	public List<Room> getRoom(String urername) {
		
		List<Room> room = roomRepository.getByUsername(urername);
		
		return room;
	}

	@Override
	public void createRoom(String username) {
		Room room = new Room();
		room.setUsername(username);
		roomRepository.save(room);
	}
	
}
