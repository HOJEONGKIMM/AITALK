package kr.spring.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.entity.Member;
import kr.spring.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	// 회원가입
	@PostMapping("/join")
	public String join(Member member, Model model, RedirectAttributes redirectAttributes) {

		Member members = memberService.join(member);

		if (members != null) {
			// 회원가입 실패
			model.addAttribute("member", member);
			
			return null;
		} else {
			// 회원가입성공
			redirectAttributes.addFlashAttribute("username", member.getUsername());
			return "redirect:/subscription/free";
		}

	}

	// 로그인 페이지 이동
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	

	// 회원가입 페이지 이동
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}

	// 아이디 찾기 페이지 이동
	@GetMapping("/findId")
	public String findId() {
		return "member/findId";
	}

	// 비밀번호 찾기 페이지 이동
	@GetMapping("/findPw")
	public String findPw() {
		return "member/findPw";
	}
	
	// 수정 페이지 이동
	@GetMapping("/modify")
	public String modifyInfo() {
		return "member/modify";
	}

	// 아이디 찾기 기능
	@PostMapping("/checkId")
	public @ResponseBody boolean checkId(@RequestParam("username") String username) {

		Member member = memberService.idCheck(username);
		if (member == null) {
			return false; // 아이디가 없음
		} else {
			return true; // 아이디가 있음
		}
	}
	
	// 휴대폰으로 찾기 기능
	@PostMapping("/mobile")
	public @ResponseBody boolean mobileCheck(@RequestParam("fullname") String fullname, @RequestParam("phone") String phone, @RequestParam("username") String username) {
		
		List<Member> members = memberService.checkMobile(fullname, phone, username);
		if(members.isEmpty()) {
			return false; // 아이디가 없음
		}else {
			return true; // 아이디가 있음
		}
	}
	
	// 이메일으로 찾기 기능
	@PostMapping("/email")
	public @ResponseBody boolean emailCheck(@RequestParam("fullname") String fullname, @RequestParam("email") String email, @RequestParam("username") String username) {
		
		List<Member> members = memberService.checkEmail(fullname, email, username);
		if(members.isEmpty()) {
			return false; // 아이디가 없음
		}else {
			return true; // 아이디가 있음
		}
	}
	
	// 비밀번호 바꾸기
	@PostMapping("/changePw")
	public @ResponseBody boolean pwChange(@RequestParam("username") String username, @RequestParam("password1") String password1, @RequestParam("password2") String password2) {
		if(password1.equals(password2)) {
			memberService.pwUpdate(username ,password1);
			return true;
		}else {
			return false;
		}
	}
	
	// 휴대폰으로 확인
	@PostMapping("/mobileId")
	public @ResponseBody List<Member> idMobile(@RequestParam("fullname") String fullname, @RequestParam("phone") String phone) {
		List<Member> members = memberService.idCheckMobile(fullname, phone);
		return members;
	}
	
	// 이메일로 확인
	@PostMapping("/emailId")
	public @ResponseBody List<Member> idEmail(@RequestParam("fullname") String fullname, @RequestParam("email") String email) {
		List<Member> members = memberService.idCheckEmail(fullname, email);
		return members;
	}
	
	// 언어 바꾸기
	@PostMapping("/changeLanguage")
    public @ResponseBody Map<String, Object> changeLanguage(
            @RequestParam("username") String username,
            @RequestParam("language") String language,
            Model model) {
        
        Map<String, Object> result = new HashMap<>();
        try {
            memberService.updateLanguage(username, language);
            result.put("status", "success");
            result.put("message", "Language updated successfully");
        } catch (Exception e) {
            result.put("status", "fail");
            result.put("message", "Language update failed");
        }
        
        return result;
    }
	
	// 언어 변경
	@GetMapping("/find_lang")
	public @ResponseBody Map<String, Object> lang_find(@RequestParam("username") String username){
		Member member = memberService.findLang(username);

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("username", member.getUsername());
		map.put("password", member.getPassword());
		map.put("fullname", member.getFullname());
		map.put("age", member.getAge());
		map.put("email", member.getEmail());
		map.put("gender", member.getGender());
		map.put("phone", member.getPhone());
		map.put("addr", member.getAddr());
		map.put("language", member.getLanguage());
		map.put("joined_at", member.getJoined_at().toString());
		map.put("role", member.getRole().toString());
		
		return map;
	}
	
	// 정보보기
	@PostMapping("/viewInfo")
	public @ResponseBody Map<String, Object> infoView(@RequestParam("username") String username){
		Member member = memberService.view_Info(username);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("username", member.getUsername());
		map.put("password", member.getPassword());
		map.put("fullname", member.getFullname());
		map.put("age", member.getAge());
		map.put("email", member.getEmail());
		map.put("gender", member.getGender());
		map.put("phone", member.getPhone());
		map.put("addr", member.getAddr());
		map.put("language", member.getLanguage());
		map.put("joined_at", member.getJoined_at().toString());
		map.put("role", member.getRole().toString());
		
		return map;
	}
	
	// 정보 수정하기
	@PostMapping("/modify")
	public String modify(Member member) {
		memberService.update(member);
		return "redirect:/";
	}
	
	// 구독 페이지 이동
	@GetMapping("/subscription")
	public String subscription() {
		return "subscription/subscription";
	}
	
	@PostMapping("/passwordcheck")
    public @ResponseBody boolean passwordcheck(@RequestParam String inputPassword, @RequestParam String username) {
		boolean passwordcheck = memberService.checkMemberPassword(inputPassword, username);
		System.out.println(passwordcheck+" passwordcheck");
		return passwordcheck;
    }
}
