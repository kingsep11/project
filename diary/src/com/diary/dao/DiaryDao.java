package com.diary.dao;

import java.util.List;

import com.diary.dao.dto.DiaryDto;
import com.diary.service.vo.DiaryVO;

public interface DiaryDao {

	DiaryVO getDiaryList(String prodType,String subcat);
	List<DiaryDto> getDiaryDetail(String diaryId);
}
