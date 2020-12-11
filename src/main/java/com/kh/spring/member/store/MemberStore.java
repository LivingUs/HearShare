package com.kh.spring.member.store;

import com.kh.spring.member.domain.Member;

public interface MemberStore {
	
	public int joinMember(Member member);
	public int idRecheck(String memberId);
	public Member loginMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(String memberId);
	
}
