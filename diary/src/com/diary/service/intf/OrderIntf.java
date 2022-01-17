package com.diary.service.intf;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;

import com.diary.dao.dto.OrderDto;

@Path("/webservice")
public interface OrderIntf {

	@POST
	@Produces("application/json")
	@Path("saveorder")
	OrderDto saveOrder(String jsonStr);

	@GET
	@Produces("application/json")
	@Path("confirmorder")
	OrderDto confirmOrder(String orderId);
}
