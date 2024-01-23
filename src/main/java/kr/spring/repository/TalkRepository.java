package kr.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import kr.spring.entity.Talk;

@Repository
public interface TalkRepository  extends JpaRepository<Talk, Long>{

	@Query("SELECT t FROM Talk t WHERE room_idx = :room_idx")
	List<Talk> getByRoomIdx(@Param("room_idx") Long room_idx);

}
