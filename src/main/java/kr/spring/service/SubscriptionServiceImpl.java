package kr.spring.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.entity.Member;
import kr.spring.entity.Subscription;
import kr.spring.repository.MemberRepository;
import kr.spring.repository.SubscriptionRepository;

@Service
public class SubscriptionServiceImpl implements SubscriptionService {

    @Autowired
    private SubscriptionRepository subscriptionRepository;
    
    @Autowired
    private MemberRepository memberRepository;

    @Override
    @Transactional
    public void saveSubscriptionData(Subscription subscription, Member member) {
        // Subscription 객체를 사용하여 데이터베이스에 저장하는 로직을 구현
        // JPA를 사용하는 경우 다음과 같이 저장할 수 있습니다.
    	System.out.println(subscription + "serviceImpl");
    	System.out.println(member + "serviceImpl");
    	
    	subscription.setUsername(member);
    	
        subscriptionRepository.save(subscription);
    }

	@Override
	public void freeSubscription(Member username, LocalDateTime joined_at) {
		Subscription subscription = new Subscription();
		subscription.setUsername(username);
		subscription.setStarted_at(joined_at);
		subscription.setProductName("7일 무료 서비스");
		
		subscriptionRepository.save(subscription);
	}

	@Override
	public Subscription getSubscriptionByUsername(String username) {
		
		Optional<Member> omember = memberRepository.findById(username);
		Member member = omember.get();
		
		List<Subscription> subscription = subscriptionRepository.findLatestByUserName(member, PageRequest.of(0, 1));

		Subscription latestSubscription = null;
		if (!subscription.isEmpty()) {
		    latestSubscription = subscription.get(0);
		}
		
		return latestSubscription;
	}
}
