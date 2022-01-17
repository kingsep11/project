package com.sc.util;

public class SCQueryConstants {

	public static final String QRY_CARD_LST_BY_TYPE = "select name,price,ptype from cards where ptype=?";
	public static final String QRY_CARD_LST_FOR_ADMIN = "select a.name,a.price,GROUP_CONCAT(a.ptype SEPARATOR ', ') as ptype from cards a GROUP BY a.name";
	public static final String QRY_DELETE_LST_FOR_ADMIN = "delete from cards where name = ? and ptype= ?";
}
