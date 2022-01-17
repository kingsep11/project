package com.sc.service.impl;

import com.sc.util.ApplicationContextProvider;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sc.dao.CardDao;
import com.sc.dao.dto.DelCardDto;
import com.sc.service.intf.CardIntf;
import com.sc.vo.CardVO;
import com.sc.vo.DelCardVo;

public class CardImpl implements CardIntf{

	@Override
	public String sayHello() {
		// TODO Auto-generated method stub
				return "this is say hello service";
	}

	@Override
	public CardVO getCardList(String cardType) {
		ApplicationContextProvider appContext = new ApplicationContextProvider();
		CardDao cardDao = (CardDao)appContext.getApplicationContext().getBean("cardDao");
		return cardDao.getCardList(cardType);
	}
	
	public CardVO getCardListForAdmin(){
		ApplicationContextProvider appContext = new ApplicationContextProvider();
		CardDao cardDao = (CardDao)appContext.getApplicationContext().getBean("cardDao");
		return cardDao.getCardListForAdmin();
	}
	
	public void deleteCards(String jsonStr){
		ApplicationContextProvider appContext = new ApplicationContextProvider();
		CardDao cardDao = (CardDao)appContext.getApplicationContext().getBean("cardDao");
		try
		{
			System.out.println(jsonStr);
			Gson gson = new Gson();
			DelCardVo dto = gson.fromJson(jsonStr, DelCardVo.class);
			cardDao.deleteCards(dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
