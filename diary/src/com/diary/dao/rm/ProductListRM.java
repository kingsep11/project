package com.diary.dao.rm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.diary.dao.dto.DiaryDto;

public class ProductListRM  implements RowMapper{

	@Override
	public Object mapRow(ResultSet rs, int arg1) throws SQLException {
		DiaryDto diaryDto = new DiaryDto();
		diaryDto.setDiaryId(rs.getInt(1));
		diaryDto.setDiaryCode(rs.getString(2));
		diaryDto.setDiaryTitle(rs.getString(3));
		diaryDto.setDiaryPrice(rs.getString(4));
		diaryDto.setFileName(rs.getString(5));
		return diaryDto;
	}

}
