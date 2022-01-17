package com.diary.dao.rm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.diary.dao.dto.DiaryDto;

public class ProductRM  implements RowMapper{

	@Override
	public Object mapRow(ResultSet rs, int arg1) throws SQLException {
		DiaryDto diaryDto = new DiaryDto();
		diaryDto.setDiaryId(rs.getInt(1));
		diaryDto.setDiaryCode(rs.getString(2));
		diaryDto.setDiaryTitle(rs.getString(3));
		diaryDto.setDiaryDesc(rs.getString(4));
		diaryDto.setDiaryPrice(rs.getString(5));
		diaryDto.setFileName(rs.getString(6));
		return diaryDto;
	}

}
