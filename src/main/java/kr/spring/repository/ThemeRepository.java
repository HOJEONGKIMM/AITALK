package kr.spring.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.spring.entity.Theme;

@Repository
public interface ThemeRepository extends JpaRepository<Theme, Long> {
	
    
}