package com.xoriant.dao;

import java.util.List;

import com.xoriant.dto.*;

public interface MemberDao {
	public void addMember(Member member);
	public void updateMemberAddress(int memberId,String address );
	public void deleteMember(int memberId);
	public List<Member> getAllMembers();
	public Member getMemberDetails(int memberId);
}
