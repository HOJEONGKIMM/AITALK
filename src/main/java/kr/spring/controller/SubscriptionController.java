package kr.spring.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.entity.Member;
import kr.spring.entity.Subscription;
import kr.spring.service.SubscriptionService;

@Controller
@RequestMapping("/subscription/*")
public class SubscriptionController {
    
    @Autowired
    private SubscriptionService subscriptionService;

    @PostMapping("/saveInfo")
    @ResponseBody
    public void saveSubscriptionInfo(@RequestBody Subscription jsonData, @RequestHeader("username") Member username) {
        // HTTP 헤더에서 username 값을 받음
        System.out.println("Controller username: " + username);
        System.out.println("Controller jsonData: " + jsonData);

        // jsonData 객체와 username 값을 처리
        subscriptionService.saveSubscriptionData(jsonData, username);
        
    }
    
    @RequestMapping("/free")
    public String freeSubscription(@ModelAttribute("username") Member username) {
    	subscriptionService.freeSubscription(username, username.getJoined_at());
    	return "redirect:/";
    }
    
}
