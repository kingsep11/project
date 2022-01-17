package com.sc.vo;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import com.sc.dao.dto.CardDto;
@XmlRootElement
public class CardVO {

	List<CardDto> cardList ;

	public List<CardDto> getCardList() {
		return cardList;
	}

	public void setCardList(List<CardDto> cardList) {
		this.cardList = cardList;
	}
	
	
}
