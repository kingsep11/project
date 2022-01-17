package com.diary.dao;

import com.diary.dao.dto.OrderDto;

public interface OrderDao {

	OrderDto saveOrder(OrderDto dto);
	OrderDto confirmOrder(String orderId);
}
