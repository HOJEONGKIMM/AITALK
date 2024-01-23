package kr.spring.service;


import java.util.List;
import java.util.Optional;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.spring.entity.Member;
import kr.spring.repository.MemberRepository;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public Member join(Member member) {
		Optional<Member> omember = memberRepository.findById(member.getUsername());
		
		if(omember.isPresent()) {
			// 값이 존재하는 경우
			System.out.println("있음");
			return member;
		}else {
			String encPw = member.getPassword();
			member.setPassword(passwordEncoder.encode(encPw));
			System.out.println("없음");
			memberRepository.save(member);
			return null;
		}
		
	}

	@Override
	public Member idCheck(String username) {
		// TODO Auto-generated method stub
		Optional<Member> omember = memberRepository.findById(username);
		if(omember.isPresent()) {
			return omember.get();
		}else {
			return null;
		}
	}

	@Override
	public List<Member> checkMobile(String fullname, String mobile, String username) {
		List<Member> members = memberRepository.existsByMobile(fullname, mobile, username);
		if(members == null) {
			return null;
		}else {
			return members;
		}
	}

	@Override
	public List<Member> checkEmail(String fullname, String email, String username) {
		List<Member> members = memberRepository.existsByEmail(fullname, email, username);
		if(members == null) {
			return null;
		}else {
			return members;
		}
	}

	@Override
	public void pwUpdate(String username, String password1) {
		
		Optional<Member> omember = memberRepository.findById(username);
		
		if(omember.isPresent()) {
			Member member = omember.get();
			member.setPassword(passwordEncoder.encode(password1));
			memberRepository.save(member);
		} else {
			throw new EntityNotFoundException("사용자를 찾을 수 없습니다.");
		}
		
	}

	@Override
	public List<Member> idCheckMobile(String fullname, String phone) {
		List<Member> members = memberRepository.existsIdByPhone(fullname, phone);
		
		return members;
	}

	@Override
	public List<Member> idCheckEmail(String fullname, String email) {
		List<Member> members = memberRepository.existsIdByEmail(fullname, email);
		
		return members;
	}
	
	@Override
	public void updateLanguage(String username, String language) {
		
		Optional<Member> omember = memberRepository.findById(username);
        if(omember.isPresent()) {
            Member member = omember.get();
            member.setLanguage(language);
            memberRepository.save(member);
        } else {
            // 사용자가 존재하지 않는 경우 처리 로직
            // 예외 처리나 로그를 남길 수 있습니다.
            System.out.println("User not found for language update");
        }
	}

	@Override
	public Member findLang(String username) {
		
		Optional<Member> omember = memberRepository.findById(username);
		Member member = omember.get();
		return member;
	}

	@Override
	public Member view_Info(String username) {
		Optional<Member> omember = memberRepository.findById(username);
		Member member = omember.get();
		
		return member;
	}

	@Override
	public void update(Member member) {
		Optional<Member> omember = memberRepository.findById(member.getUsername());
		Member members = omember.get();
		member.setPassword(members.getPassword());
		memberRepository.save(member);
	}

	@Override
	public boolean checkMemberPassword(String inputPassword, String username) {
		Optional<Member> omember = memberRepository.findById(username);
		Member member = omember.get();
		
		boolean isMatch = passwordEncoder.matches(inputPassword, member.getPassword());
		return isMatch;
	}
	
}
