package com.sc.vo;

import java.util.ArrayList;
import java.util.List;


public class DelCardVo {

	List<DelCardDto> chkBoxSelArray ;

	public List<DelCardDto> getChkBoxSelArray() {
		return chkBoxSelArray;
	}

	public void setChkBoxSelArray(List<DelCardDto> chkBoxSelArray) {
		this.chkBoxSelArray = chkBoxSelArray;
	}
	
	public class DelCardDto {

		private String cardname;
		private String ptype;
		
		public String getCardname() {
			return cardname;
		}
		public void setCardname(String cardname) {
			this.cardname = cardname;
		}
		public String getPtype() {
			return ptype;
		}
		public void setPtype(String ptype) {
			this.ptype = ptype;
		}
		
		
	}

	
	
	
}
