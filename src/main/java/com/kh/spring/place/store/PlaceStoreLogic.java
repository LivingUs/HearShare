package com.kh.spring.place.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.place.domain.Mlike;
import com.kh.spring.place.domain.Mreview;
import com.kh.spring.place.domain.Place;

@Repository
public class PlaceStoreLogic implements PlaceStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Place> placeList() {
		return (ArrayList)sqlSession.selectList("placeMapper.placeList");
	}

	@Override
	public Place placedetail(int pNo) {
		return sqlSession.selectOne("placeMapper.placedetail", pNo);
	}

	@Override
	public ArrayList<Place> placeplaytop5() {
		return (ArrayList)sqlSession.selectList("placeMapper.placeplaytop5");
	}

	@Override
	public ArrayList<Place> placeeattop5() {
		return (ArrayList)sqlSession.selectList("placeMapper.placeeattop5");
	}

	@Override
	public int addReview(Mreview review) {
		return sqlSession.insert("placeMapper.addReview", review);
	}

	@Override
	public ArrayList<Mreview> reviewList(int pNo) {
		return (ArrayList)sqlSession.selectList("placeMapper.reviewList", pNo);
	}

	@Override
	public int ReviewDelete(int mrNo) {
		return sqlSession.delete("placeMapper.ReviewDelete", mrNo);
	}

	@Override
	public int addmLike(Mlike mLike) {
		return sqlSession.insert("placeMapper.addmLike", mLike);
	}

	@Override
	public int updateYmLike(Mlike mLike) {
		return sqlSession.update("placeMapper.updateYmLike", mLike);
	}

	@Override
	public int updateNmLike(Mlike mLike) {
		return sqlSession.update("placeMapper.updateNmLike", mLike);
	}

	@Override
	public Mlike selectmLike(Mlike mLike) {
		return sqlSession.selectOne("placeMapper.selectmLike", mLike);
	}

	@Override
	public ArrayList<Place> likeList(Place place) {
		return (ArrayList)sqlSession.selectList("placeMapper.likeList", place);
	}
}
