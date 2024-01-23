package kr.spring.service;

import java.util.List;

import kr.spring.entity.Room;

public interface RoomService {

	List<Room> getRoom(String urername);

	void createRoom(String username);

}
