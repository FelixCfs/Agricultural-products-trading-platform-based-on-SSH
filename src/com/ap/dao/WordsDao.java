package com.ap.dao;

import java.util.List;

import com.ap.entity.Words;



public interface WordsDao {
	//��ѯ���в�Ʒ��Ϣ
	public List<Words> getAllWords();
	public boolean delWordsById(int wordsid);
	public void addWords(Words w);//�����¼ 
	public void addWordsRet(String ret,int wordsId);
}
