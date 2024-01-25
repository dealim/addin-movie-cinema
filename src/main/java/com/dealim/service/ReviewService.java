package com.dealim.service;

import com.dealim.domain.Review;
import com.dealim.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ReviewService {
    @Autowired
    ReviewRepository reviewRepository;
    public Review reviewInsert(Review review) {
        return reviewRepository.save(review);
    }

    /*public List<Review> selectReviewByMovieNo(Long movieId) {

        return reviewRepository.findAllByMovieNo(movieId);
    }*/

    public Page<Review> selectReviewListByMovieNo(Long movieId, Pageable pageable) {
        return reviewRepository.findAllByMovieId(movieId, pageable);
    }
}
