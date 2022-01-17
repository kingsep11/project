package com.sc.dao.rm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.sc.dao.dto.CardDto;

public class CardRM implements RowMapper<CardDto>{

	@Override
	public CardDto mapRow(ResultSet rs, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		rs.setFetchSize(1000);
		CardDto dto = new CardDto();
		dto.setName(rs.getString(1));
		dto.setPrice(rs.getString(2));
		dto.setType(rs.getString(3));
		return dto;
	}

}
