package com.xoriant.dao;

import java.sql.Date;
import java.util.List;

import com.xoriant.dto.Transaction;

public interface TransactionDao {

	public void issueBookTransaction(Transaction transaction);
	public void returnBookTransaction(Transaction transaction);
	public List<Transaction> getMemberTransactions(int memberId);
	
}
