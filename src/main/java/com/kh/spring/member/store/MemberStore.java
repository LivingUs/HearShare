package com.kh.spring.member.store;

import java.util.ArrayList;

import com.kh.spring.member.domain.Invite;
import com.kh.spring.member.domain.Member;

public interface MemberStore {
	
	public int joinMember(Member member);
	public Member selectOneMember(Member member);
	public int idRecheck(String memberId);
	public Member loginMember(Member member);
	public ArrayList<Member> listMember();
	public int updateMember(Member member);
	public int insertInvite(Invite invite);
	public int codeCheck(Invite invite);
	
}
