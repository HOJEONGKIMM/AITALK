package kr.spring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@EnableScheduling
@SpringBootApplication
public class ProjAitalkApplication extends SpringBootServletInitializer {
	
	@Override
	protected SpringApplicationBuilder configure(
		SpringApplicationBuilder application) {
		return application.sources(ProjAitalkApplication.class);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(ProjAitalkApplication.class, args);
	}

}
