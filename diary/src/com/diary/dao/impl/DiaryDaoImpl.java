package com.diary.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.diary.dao.DiaryDao;
import com.diary.dao.dto.DiaryDto;
import com.diary.dao.rm.ProductListRM;
import com.diary.dao.rm.ProductRM;
import com.diary.service.vo.DiaryVO;

public class DiaryDaoImpl implements DiaryDao{

	private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

	@Override
	public DiaryVO getDiaryList(String prodType, String subcat) {
		DiaryVO diaryVO = new DiaryVO();
		final String GET_PRD_LST_QRY = "select a.diary_id,a.diary_code,a.diary_title,a.diary_price,b.file_name from master_diary a, "
				+ " diary_images b where a.diary_id = b.diary_id and b.primary_image ='Y' and a.product_type=? and a.sub_catagory=?";
		// TODO Auto-generated method stub
		List<DiaryDto> productList = (List<DiaryDto>)this.jdbcTemplate.query(GET_PRD_LST_QRY, new Object[]{prodType,subcat}, new ProductListRM());
		diaryVO.setDiaryList(productList);
		return diaryVO;
	}
	
	
	public List<DiaryDto> getDiaryDetail(String diaryId){
		final String GET_PRD_BY_ID = "select a.diary_id,a.diary_code,a.diary_title,a.diary_desc,a.diary_price,b.file_name from master_diary a, diary_images b where a.diary_id = b.diary_id and a.diary_id=?";
		List<DiaryDto> diaryDto = new ArrayList<DiaryDto>();
		diaryDto = (List<DiaryDto>)this.jdbcTemplate.query(GET_PRD_BY_ID, new Object[]{diaryId}, new ProductRM());
		return diaryDto;
	}

}
