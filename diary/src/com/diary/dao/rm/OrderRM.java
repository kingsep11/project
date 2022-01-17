package com.diary.dao.rm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.diary.dao.dto.OrderDto;

public class OrderRM  implements RowMapper{

	@Override
	public Object mapRow(ResultSet rs, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		OrderDto dto = new OrderDto();
		dto.setOrderId(rs.getInt(1));
		dto.setOrderNumber(rs.getString(2));
		dto.setProductId(rs.getInt(3));
		dto.setPaymentStatus(rs.getString(4));
		dto.setPaymentStatus(rs.getString(5));
		dto.setOrderDate(rs.getDate(6));
		dto.setExpDelDate(rs.getDate(7));
		return dto;
	}

}
