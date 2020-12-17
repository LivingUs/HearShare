package com.kh.spring.place.store;

import java.util.ArrayList;

import com.kh.spring.place.domain.Mreview;
import com.kh.spring.place.domain.Place;

public interface PlaceStore {

	public ArrayList<Place> placeList();
	public Place placedetail(int pNo);
	public ArrayList<Place> placeplaytop5();
	public ArrayList<Place> placeeattop5();
	public int addReview(Mreview review);
	public ArrayList<Mreview> reviewList(int pNo);
	public int ReviewDelete(int mrNo);
}
