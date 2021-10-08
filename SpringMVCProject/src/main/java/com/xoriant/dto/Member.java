package com.xoriant.dto;

public class Member {

	private int memberId;
	private String memberName;
	private String memberAddress;
	private String memberType;
	private String memberPassword;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	public Member(int memberId, String memberName, String memberAddress, String memberType, String memberPassword) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberAddress = memberAddress;
		this.memberType = memberType;
		this.memberPassword = memberPassword;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberName=" + memberName + ", memberAddress=" + memberAddress
				+ ", memberType=" + memberType + ", memberPassword=" + memberPassword + "]";
	}
	
	
}
