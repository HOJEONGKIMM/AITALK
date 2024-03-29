package kr.spring.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration // 환경설정파일 설정
public class SecurityConfiguration {
	
	@Autowired
	private UserDetailsServiceImpl userService;

	@Bean
	public static PasswordEncoder passwordEncoder() { // 비밀번호 인코딩 기능
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		
		http.csrf().disable(); // CSRF인증 토큰 비활성화
		
		http.authorizeHttpRequests() // 사용자의 요청을 핸들링
			.antMatchers("/", "member/**").permitAll()
			// "/", "member" 하위에 모든 접근을 허용하겠다.
			.antMatchers("/board/**").permitAll()
			// board로 접근하는 모든 경우는 인증된(로그인한)사용자만 허용한다.
			.and() // 추가
			.formLogin()// 별도의 로그인 폼을 사용하겠다.
			.usernameParameter("username")
			.passwordParameter("password")
			.loginPage("/member/login") // 로그인 페이지는  /member안에 login에서 하겠다.
			//.successForwardUrl("/")
			.defaultSuccessUrl("/") // 로그인 성공시 board list로 이동하겠다.
			.and() // 추가
			.logout() // Spring Security에서 제공하는 기본 로그아웃을 사용하겠다.
			.logoutUrl("/member/logout") // 로그아웃 실행하고 싶다면 member/logout으로 요청하겠다.
			.logoutSuccessUrl("/"); // 로그아웃하고 /로 이동하겠다.
		
		http.userDetailsService(userService);
		
		return http.build();
	}
}
