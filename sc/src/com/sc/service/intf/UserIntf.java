package com.sc.service.intf;

import javax.jws.WebService;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import com.sc.dao.dto.UserDto;
@Path("/webservice")
public interface UserIntf {

	@POST
	@Consumes("application/json")
	@Produces("application/json")
	@Path("dologin")
	UserDto doLogin(String jsonStr);
	

}
