package com.ap.dao;

import java.util.List;

import com.ap.entity.Words;



public interface WordsDao {
	//查询所有产品信息
	public List<Words> getAllWords();
	public boolean delWordsById(int wordsid);
	public void addWords(Words w);//插入记录 
	public void addWordsRet(String ret,int wordsId);
}
