package com.xoriant.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Component;

import com.xoriant.dto.Book;
import com.xoriant.dto.Transaction;

@Component("transactionDao")
public class TransactionDaoImpl implements TransactionDao{

	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public DataSource getDataSource() {
		return dataSource;
	}

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	
	@Override
	public void issueBookTransaction(Transaction transaction) {
		// TODO Auto-generated method stub
		String query = "insert into transactions(MemberId,AccessionNumber,DueDate) values(?,?,?)";

		jdbcTemplate.update(query,transaction.getMemberId(),transaction.getAccessionNumber(),transaction.getDueDate());			
		
		System.out.println("Transaction Created!");

	}

	
	@Override
	public void returnBookTransaction(Transaction transaction) {
		// TODO Auto-generated method stub
		String query = "update transactions SET ReturnDate= ? , FineAmount = ? , Status = ?  WHERE MemberId = ? and AccessionNumber = ?";
	
		jdbcTemplate.update(query,transaction.getReturnDate(),transaction.getFineAmount(),
				transaction.getTransactionStatus(),transaction.getMemberId(),transaction.getAccessionNumber());			
		
		System.out.println("Transaction Updated!");

	}

	@Override
	public List<Transaction> getMemberTransactions(int memberId) {
		
		String sql = "select * from transactions where MemberId = "+String.valueOf(memberId);
		
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Transaction>>() {
			public List<Transaction> extractData(ResultSet rs) throws SQLException, DataAccessException 
			{
				List<Transaction> memberTransactions = new ArrayList<Transaction>();
				while(rs.next()) {
					Transaction transaction = new Transaction();
					
					transaction.setMemberId(rs.getInt(2));
					transaction.setAccessionNumber(rs.getString(3));
					transaction.setIssueDate(rs.getDate(4));
					transaction.setDueDate(rs.getDate(5));
					transaction.setReturnDate(rs.getDate(6));
					transaction.setFineAmount(rs.getInt(7));
					transaction.setTransactionStatus(rs.getString(8));

					memberTransactions.add(transaction);
				}
				
				return memberTransactions;
			}
		});
	}


}
