package kr.spring.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import kr.spring.entity.Member;
import kr.spring.entity.Subscription;

@Repository
public interface SubscriptionRepository extends JpaRepository<Subscription, Long>{
	
	@Query("SELECT s FROM Subscription s WHERE s.username = :username ORDER BY s.expired_at DESC")
	List<Subscription> findLatestByUserName(Member username, Pageable pageable);
}
