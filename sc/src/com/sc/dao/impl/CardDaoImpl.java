package com.sc.dao.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;

import com.sc.dao.CardDao;
import com.sc.dao.dto.CardDto;
import com.sc.dao.dto.DelCardDto;
import com.sc.dao.rm.CardRM;
import com.sc.util.ApplicationContextProvider;
import com.sc.util.SCQueryConstants;
import com.sc.vo.CardVO;
import com.sc.vo.DelCardVo;

public class CardDaoImpl implements CardDao{

	private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

	
	@Override
	public CardVO getCardList(String cardType) {
		// TODO Auto-generated method stub
		CardVO cardVO = new CardVO();
		List<CardDto> cardList = (List<CardDto>) this.jdbcTemplate.query(SCQueryConstants.QRY_CARD_LST_BY_TYPE, new Object[] {cardType},new CardRM());
		cardVO.setCardList(cardList);
		return cardVO;
	}
	
	
	public CardVO getCardListForAdmin(){
		CardVO cardVO = new CardVO();
		List<CardDto> cardList = (List<CardDto>) this.jdbcTemplate.query(SCQueryConstants.QRY_CARD_LST_FOR_ADMIN,new CardRM());
		cardVO.setCardList(cardList);
		return cardVO;
		
	}
	
	
	public void deleteCards(DelCardVo delCardVo){
		
		List<com.sc.vo.DelCardVo.DelCardDto> dto = delCardVo.getChkBoxSelArray();
		for(com.sc.vo.DelCardVo.DelCardDto obj : dto){
			System.out.println(obj.getCardname()+"----------"+obj.getPtype());
			this.jdbcTemplate.update(SCQueryConstants.QRY_DELETE_LST_FOR_ADMIN,new Object[]{obj.getCardname(),obj.getPtype()});
		}
	}

}
