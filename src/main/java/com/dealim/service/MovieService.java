package com.dealim.service;

import com.dealim.domain.Movie;
import com.dealim.domain.Theater;
import com.dealim.repository.MovieRepository;
import com.dealim.repository.MovieTheaterRepository;
import com.dealim.repository.TheaterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Optional;

@Service
public class MovieService {

    @Autowired
    private MovieRepository movieRepository;
    @Autowired
    private MovieTheaterRepository movieTheaterRepository;
    @Autowired
    private TheaterRepository theaterRepository;

    public Optional<Movie> selectMovieDetailById(Long movieId) {
        return movieRepository.findById(movieId);
    }

    public Page<Movie> movieList(Pageable pageable) {
        return  movieRepository.findAll(pageable);
    }


    public Page<Movie> findMoviesByKeyword(String searchKeyword, Pageable pageable) {
        return movieRepository.findByMvTitleIgnoreCase(searchKeyword, pageable);

    }

    public Page<Movie> findMoviesByGenre(String mvGenre, Pageable pageable) {
        return movieRepository.findByMvGenre(mvGenre, pageable);

    }

    //movieHomeController 비즈니스 로직
    public void getMovieHome(Pageable pageable, String searchKeyword, String category, Model model) {
        Page<Movie> movieList;

        //사용자 요청에따라서 목록 조회해오는
        if (category != null && !category.trim().isEmpty()) {
            movieList = findMoviesByGenre(category, pageable);
        } else if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
            movieList = findMoviesByKeyword(searchKeyword, pageable);
        } else {
            movieList = movieList(pageable);
        }

        int nowPage = movieList.getPageable().getPageNumber();
        int totalPages = movieList.getTotalPages();
        int pageGroupSize = 5;
        int currentPageGroup = nowPage / pageGroupSize;
        int startPage = currentPageGroup * pageGroupSize;
        int endPage = (totalPages > 0) ? Math.min(startPage + pageGroupSize - 1, totalPages - 1) : 0;

        model.addAttribute("movieList", movieList);
        model.addAttribute("nowPage", nowPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("searchKeyword", searchKeyword);
        model.addAttribute("selectedCategory", category);
    }

    //영화 상세보기 비즈니스 로직
    public void getShowDetail(Long movieId, Model model) {

        Optional<Movie> movie = selectMovieDetailById(movieId);

        model.addAttribute("movie", movie.orElse(null));
        if (movie.isPresent()) {
            Float popularityValue = movie.get().getMvPopularity();

            // 인기도 점수가 null인 경우 0.0으로 설정
            if (popularityValue == null) {
                popularityValue = 0.0f;
            }

            // DecimalFormat을 사용하여 소수점 없이 포맷
            DecimalFormat df = new DecimalFormat("0");
            String formattedPopularity = df.format(popularityValue);

            // 최종 결과 문자열 생성
            String finalPopularity = formattedPopularity;
            model.addAttribute("movieRating", finalPopularity);
        } else {
            model.addAttribute("movieRating", null);
        }

    }

    public List<Theater> getTheaterListByMovieId(Long movieId) {
        List<Long> theaterIdList = movieTheaterRepository.findTheaterIdByMovieId(movieId);
        List<Theater> theaterList = theaterRepository.findByTheaterIdIn(theaterIdList);
        return theaterList;
    }
}