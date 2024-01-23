package kr.spring.service;

import java.time.LocalDateTime;
import java.util.List;

import kr.spring.entity.Member;
import kr.spring.entity.Subscription;

public interface SubscriptionService {
    void saveSubscriptionData(Subscription subscription, Member username);

	void freeSubscription(Member username, LocalDateTime joined_at);

	Subscription getSubscriptionByUsername(String username);
}
