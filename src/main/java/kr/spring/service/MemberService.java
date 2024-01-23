package kr.spring.service;

import java.util.List;

import javax.validation.Valid;

import kr.spring.entity.Member;

public interface MemberService {

	public Member join(Member member);

	public Member idCheck(String username);

	public List<Member> checkMobile(String fullname, String mobile, String username);

	public List<Member> checkEmail(String fullname, String email, String username);

	public void pwUpdate(String username, String password1);

	public List<Member> idCheckMobile(String fullname, String phone);

	public List<Member> idCheckEmail(String fullname, String email);
	
	public void updateLanguage(String username, String language);

	public Member findLang(String username);

	public Member view_Info(String username);

	public void update(Member member);

	public boolean checkMemberPassword(String inputPassword, String username);

}
