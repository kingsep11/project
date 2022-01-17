package com.diary.service.intf;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import com.diary.dao.dto.DiaryDto;
import com.diary.service.vo.DiaryVO;

@Path("/webservice")
public interface DiaryIntf {

	@GET
	@Path("sayhello")
	String sayHello();
	
	@GET
	@Produces("application/json")
	@Path("getdiarylist")
	DiaryVO getdiarylist(@QueryParam("producttype") String producttype,@QueryParam("subcat") String subcat);
	
	@GET
	@Produces("application/json")
	@Path("getDiaryDetail")
	List<DiaryDto> getDiaryDetail(@QueryParam("diaryId") String diaryId);
	
}
