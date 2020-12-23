package com.kh.spring.member.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.domain.Invite;
import com.kh.spring.member.domain.Member;
import com.kh.spring.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberStore mStore;
	
	@Override
	public int joinMember(Member member) {
		return mStore.joinMember(member);
	}
	
	@Override
	public Member selectOneMember(Member member) {
		return mStore.selectOneMember(member);
	}

	@Override
	public int idRecheck(String memberId) {
		return mStore.idRecheck(memberId);
	}

	@Override
	public Member loginMember(Member member) {
		return mStore.loginMember(member);
	}
	
	@Override
	public ArrayList<Member> listMember() {
		return mStore.listMember();
	}

	@Override
	public int updateMember(Member member) {
		return mStore.updateMember(member);
	}


	@Override
	public int insertInvite(Invite invite) {
		return mStore.insertInvite(invite);
	}

	@Override
	public int codeCheck(Invite invite) {
		return mStore.codeCheck(invite);
	}

}
