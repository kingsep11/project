package com.diary.service.impl;

import com.diary.dao.DiaryDao;
import com.diary.dao.OrderDao;
import com.diary.dao.dto.OrderDto;
import com.diary.service.intf.OrderIntf;
import com.diary.util.ApplicationContextProvider;
import com.google.gson.Gson;

public class OrderImpl implements OrderIntf{

	@Override
	public OrderDto saveOrder(String jsonStr) {
		
		Gson gson = new Gson();
		OrderDto dto = gson.fromJson(jsonStr, OrderDto.class);
		ApplicationContextProvider appContext = new ApplicationContextProvider();
		OrderDao orderDao = (OrderDao)appContext.getApplicationContext().getBean("orderDao");
		return orderDao.saveOrder(dto);
	}
	
	public OrderDto confirmOrder(String orderd){
		ApplicationContextProvider appContext = new ApplicationContextProvider();
		OrderDao orderDao = (OrderDao)appContext.getApplicationContext().getBean("orderDao");
		return orderDao.confirmOrder(orderd);
	}

}
