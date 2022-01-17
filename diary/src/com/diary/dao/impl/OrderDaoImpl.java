package com.diary.dao.impl;

import java.util.Calendar;
import java.util.Date;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.diary.dao.OrderDao;
import com.diary.dao.dto.OrderDto;
import com.diary.dao.rm.OrderRM;

public class OrderDaoImpl implements OrderDao{

	private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

	@Override
	public OrderDto saveOrder(OrderDto dto) {
		System.out.println("save order....");
		String SAVE_ORDER_QRY = "insert into order_master(order_number,diary_id,order_status,payment_status,order_date,exp_delivery_date) values(?,?,?,?,?,?)";
		
		Date date = new Date(); // wherever you get this from
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, 10); // add 10 days
		 
		Date date1 = cal.getTime();
		this.jdbcTemplate.update(SAVE_ORDER_QRY, new Object[]{dto.getOrderNumber(),dto.getProductId(),dto.getOrderStatus(),dto.getPaymentStatus(),date,date1});
		
		String CURRENT_SAVED_ORDER = "select * from order_master where order_number = ?";
		OrderDto savedOrderDto = (OrderDto) this.jdbcTemplate.queryForObject(CURRENT_SAVED_ORDER, new Object[]{dto.getOrderNumber()},new OrderRM());
		
		String SAVE_SHIPPING_QRY = "insert into order_delivery_det (order_id,cust_address) values(?,?)";
		this.jdbcTemplate.update(SAVE_SHIPPING_QRY, new Object[]{savedOrderDto.getOrderId(),dto.getCustAddress()});
		
		return savedOrderDto;
	}
	
	
	
	public OrderDto confirmOrder(String orderId) {
		System.out.println("save order....");
		String CONFIRM_ORDER_QRY = "update order_master set order_status='Confirm',payment_status='Confirm' where order_number =?";
		
		Date date = new Date(); // wherever you get this from
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, 10); // add 10 days
		 
		Date date1 = cal.getTime();
		this.jdbcTemplate.update(CONFIRM_ORDER_QRY, new Object[]{orderId});
		
		String CURRENT_SAVED_ORDER = "select * from order_master where order_number = ?";
		OrderDto savedOrderDto = (OrderDto) this.jdbcTemplate.queryForObject(CURRENT_SAVED_ORDER, new Object[]{orderId},new OrderRM());
		
		/*String SAVE_SHIPPING_QRY = "insert into order_delivery_det (order_id,cust_address) values(?,?)";
		this.jdbcTemplate.update(SAVE_SHIPPING_QRY, new Object[]{savedOrderDto.getOrderId(),dto.getCustAddress()});
*/		
		return savedOrderDto;
	}
	

}
