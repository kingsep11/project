package com.diary.service.vo;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import com.diary.dao.dto.DiaryDto;
@XmlRootElement
public class DiaryVO {

	List<DiaryDto> diaryList = new ArrayList<DiaryDto>();

	public List<DiaryDto> getDiaryList() {
		return diaryList;
	}

	public void setDiaryList(List<DiaryDto> diaryList) {
		this.diaryList = diaryList;
	}
	
	
	
}
