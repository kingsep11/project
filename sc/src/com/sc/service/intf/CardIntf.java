package com.sc.service.intf;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import com.sc.vo.CardVO;


@Path("/webservice")
public interface CardIntf {

	@GET
	@Path("sayhello")
	String sayHello();
	
	@GET
	@Produces("application/json")
	@Path("getCardList")
	CardVO getCardList(@QueryParam("cardType") String cardType);
	
	
	@GET
	@Produces("application/json")
	@Path("getCardListForAdmin")
	CardVO getCardListForAdmin();
	
	@POST
	@Consumes("application/json")
	@Path("deletecards")
	void deleteCards(String jsonStr);
	
}
