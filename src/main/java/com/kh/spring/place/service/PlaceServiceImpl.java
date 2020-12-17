package com.kh.spring.place.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.place.domain.Mreview;
import com.kh.spring.place.domain.Place;
import com.kh.spring.place.store.PlaceStore;

@Service
public class PlaceServiceImpl implements PlaceService{

	@Autowired
	private PlaceStore pStore;
	
	@Override
	public ArrayList<Place> placeList() {
		return pStore.placeList();
	}

	@Override
	public Place placedetail(int pNo) {
		return pStore.placedetail(pNo);
	}

	@Override
	public ArrayList<Place> placeplaytop5() {
		return pStore.placeplaytop5();
	}

	@Override
	public ArrayList<Place> placeeattop5() {
		return pStore.placeeattop5();
	}

	@Override
	public int addReview(Mreview review) {
		return pStore.addReview(review);
	}

	@Override
	public ArrayList<Mreview> reviewList(int pNo) {
		return pStore.reviewList(pNo);
	}

	@Override
	public int ReviewDelete(int mrNo) {
		return pStore.ReviewDelete(mrNo);
	}
}
