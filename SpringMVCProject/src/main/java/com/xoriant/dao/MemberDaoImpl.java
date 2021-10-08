package com.xoriant.dao;

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
import com.xoriant.dto.Member;

@Component("memberDao")
public class MemberDaoImpl implements MemberDao {

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
	public void addMember(Member member) {
		String query = "insert into members(Name,Address,Type,Password) values(?,?,?,?)";
		
		jdbcTemplate.update(query,member.getMemberName(),member.getMemberAddress(),member.getMemberType(),member.getMemberPassword());
		System.out.println("Record Inserted!");

	}

	@Override
	public void updateMemberAddress(int memberId, String address) {
		String query = "update members set Address =? where MemberId=?";
		jdbcTemplate.update(query,address,memberId);					
		System.out.println("Record Updated!");

	}

	@Override
	public void deleteMember(int memberId) {
		String query = "delete from members where MemberId =?";
		jdbcTemplate.update(query,memberId);					
		System.out.println("Record Deleted!");
		
	}

	@Override
	public List<Member> getAllMembers() {
		String sql = "select * from members";
	

		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Member>>() {
			public List<Member> extractData(ResultSet rs) throws SQLException, DataAccessException 
			{
				List<Member> members = new ArrayList<Member>();
				while(rs.next()) {
					Member member = new Member();
					member.setMemberId(rs.getInt(1));
					member.setMemberName(rs.getString(2));
					member.setMemberAddress(rs.getString(3));
					member.setMemberType(rs.getString(4));
					member.setMemberPassword(rs.getString(5));
					
					members.add(member);
				}
				
				return members;
			}
		});
	}

	@Override
	public Member getMemberDetails(int memberId) {
		// TODO Auto-generated method stub
		String sql = "select * from members where MemberId = "+String.valueOf(memberId);
		
		return jdbcTemplate.query(sql, new ResultSetExtractor<Member>() {
			public Member extractData(ResultSet rs) throws SQLException, DataAccessException 
			{
				Member member = new Member();
				while(rs.next()) {
					member.setMemberId(rs.getInt(1));
					member.setMemberName(rs.getString(2));
					member.setMemberAddress(rs.getString(3));
					member.setMemberType(rs.getString(4));
					member.setMemberPassword(rs.getString(5));
				}
				return member;
			}
		});
	}

}
