package com.diary.service.impl;

import java.util.List;

import com.diary.dao.DiaryDao;
import com.diary.dao.dto.DiaryDto;
import com.diary.service.intf.DiaryIntf;
import com.diary.service.vo.DiaryVO;
import com.diary.util.ApplicationContextProvider;

public class DiaryImpl implements DiaryIntf{

	@Override
	public String sayHello() {
		// TODO Auto-generated method stub
		return "this is say hello service";
	}

	@Override
	public DiaryVO getdiarylist(String prodType, String subcat) {
		ApplicationContextProvider appContext = new ApplicationContextProvider();
		DiaryDao diaryDao = (DiaryDao)appContext.getApplicationContext().getBean("diaryDao");
		return diaryDao.getDiaryList(prodType, subcat);
	}
	
	public List<DiaryDto> getDiaryDetail(String diaryId){
		ApplicationContextProvider appContext = new ApplicationContextProvider();
		DiaryDao diaryDao = (DiaryDao)appContext.getApplicationContext().getBean("diaryDao");
		return diaryDao.getDiaryDetail(diaryId);
	}

}
