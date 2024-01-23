package kr.spring.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.spring.entity.Subscription;
import kr.spring.service.SubscriptionService;

@ControllerAdvice
public class GlobalControllerAdvice {
	
	@Autowired
	private SubscriptionService subscriptionService;
	
	@ModelAttribute("username")
    public String addUsernameToModel() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated() && !(authentication.getPrincipal() instanceof String)) {
            // UserDetails를 사용하는 경우에는 다음과 같이 캐스팅할 수 있습니다.
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            return userDetails.getUsername();
        }
        return null; // 사용자가 로그인하지 않았거나 Anonymous 사용자인 경우
    }
	
	@ModelAttribute("sub")
    public Subscription getSubscriptions() {
        String username = addUsernameToModel();
        if (username != null) {
            // SubscriptionService에서 로그인된 사용자의 username에 해당하는 구독 정보 리스트를 가져옵니다.
            return subscriptionService.getSubscriptionByUsername(username);
        }
        return null; // 사용자가 로그인하지 않았거나 구독 정보가 없을 경우
    }
}
