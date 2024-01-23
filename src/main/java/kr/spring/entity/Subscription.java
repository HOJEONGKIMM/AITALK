package kr.spring.entity;

import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;

import org.hibernate.annotations.UpdateTimestamp;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString
public class Subscription {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long subscription_idx;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "username", referencedColumnName = "username", nullable = false)
	@ToString.Exclude
	private Member username;

	private String merchantUid;

	private String productName;

	private Long amount;

	private Long installment;

	private String cardApplyNum;

	private String payMethod;

	@Column(columnDefinition = "datetime")
	private LocalDateTime started_at;

	@Column(columnDefinition = "datetime")
	private LocalDateTime expired_at;

	@PrePersist
	public void prePersist() {
		if (started_at == null) {
			started_at = LocalDateTime.now();
		}

		// productName에 따라 expired_at을 계산
		expired_at = calculateExpirationDate();
	}

	private LocalDateTime calculateExpirationDate() {
		// productName에 따라 적절한 만료 날짜를 계산하여 반환
		// 예: 7일, 1개월, 12개월 등을 계산하여 LocalDateTime으로 반환
		// 이 예제에서는 단순히 7일을 추가한 예시를 보여줍니다.
		if ("7일 무료 서비스".equals(productName)) {
			return started_at.plusDays(7);
		} else if ("1개월 구독 서비스".equals(productName)) {
			return started_at.plusMonths(1);
		} else if ("12개월 구독 서비스".equals(productName)) {
			return started_at.plusMonths(12);
		}
		// 다른 경우에 대한 로직 추가
		return started_at; // 적절한 만료 날짜를 계산할 수 없는 경우
	}
}
