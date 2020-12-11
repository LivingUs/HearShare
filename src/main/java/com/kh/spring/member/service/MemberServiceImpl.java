package com.kh.spring.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int idRecheck(String memberId) {
		return mStore.idRecheck(memberId);
	}

	@Override
	public Member loginMember(Member member) {
		return mStore.loginMember(member);
	}

	@Override
	public int updateMember(Member member) {
		return 0;
	}

	@Override
	public int deleteMember(String memberId) {
		return 0;
	}

}
