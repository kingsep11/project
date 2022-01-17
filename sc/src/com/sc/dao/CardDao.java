package com.sc.dao;

import com.sc.vo.CardVO;
import com.sc.vo.DelCardVo;

public interface CardDao {

	CardVO getCardList(String cardType);
	CardVO getCardListForAdmin();
	void deleteCards(DelCardVo delCardVo);
}
