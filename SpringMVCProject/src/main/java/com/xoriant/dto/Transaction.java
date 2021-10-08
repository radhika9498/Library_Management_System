package com.xoriant.dto;

import java.sql.Date;

public class Transaction {

	private int transactionId;
	private int memberId;
	private String accessionNumber;
	private String transactionStatus;
	private int fineAmount;
	
	private Date issueDate;
	private Date dueDate;
	private Date returnDate;
	
	

	public Transaction(int memberId, String accessionNumber, Date dueDate) {
		super();
		this.memberId = memberId;
		this.accessionNumber = accessionNumber;
		this.dueDate = dueDate;
	}
	public Transaction() {
		// TODO Auto-generated constructor stub
	}
	public int getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getAccessionNumber() {
		return accessionNumber;
	}
	public void setAccessionNumber(String accessionNumber) {
		this.accessionNumber = accessionNumber;
	}
	public String getTransactionStatus() {
		return transactionStatus;
	}
	public void setTransactionStatus(String transactionStatus) {
		this.transactionStatus = transactionStatus;
	}
	public int getFineAmount() {
		return fineAmount;
	}
	public void setFineAmount(int fineAmount) {
		this.fineAmount = fineAmount;
	}
	public Date getIssueDate() {
		return issueDate;
	}
	public void setIssueDate(Date issueDate) {
		this.issueDate = issueDate;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	@Override
	public String toString() {
		return "Transaction [transactionId=" + transactionId + ", memberId=" + memberId + ", accessionNumber="
				+ accessionNumber + ", transactionStatus=" + transactionStatus + ", fineAmount=" + fineAmount
				+ ", issueDate=" + issueDate + ", dueDate=" + dueDate + ", returnDate=" + returnDate + "]";
	}
	
}
