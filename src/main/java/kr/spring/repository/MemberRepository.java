package kr.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import kr.spring.entity.Member;

public interface MemberRepository extends JpaRepository<Member, String>{
	
	@Query("SELECT m FROM Member m WHERE m.fullname = :fullname AND m.phone = :phone AND m.username = :username")
	List<Member> existsByMobile(@Param("fullname") String fullname, @Param("phone") String phone, @Param("username") String username);
	
	@Query("SELECT m FROM Member m WHERE m.fullname = :fullname AND m.email = :email AND m.username = :username")
	List<Member> existsByEmail(@Param("fullname") String fullname, @Param("email") String email, @Param("username") String username);

	@Query("SELECT m FROM Member m Where m.fullname = :fullname AND m.phone = :phone")
	List<Member> existsIdByPhone(@Param("fullname") String fullname, @Param("phone") String phone);
	 
	@Query("SELECT m FROM Member m Where m.fullname = :fullname AND m.email = :email")
	List<Member> existsIdByEmail(@Param("fullname") String fullname, @Param("email") String email);
}
