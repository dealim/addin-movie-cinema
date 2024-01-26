package com.dealim.controller;

import com.dealim.domain.Movie;
import com.dealim.service.MovieService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DecimalFormat;
import java.util.Optional;

@Controller
@Slf4j
public class MovieController {

    @Autowired
    MovieService movieService;

    @RequestMapping("/movieHome")
    public String movieHome(Model model,
                        @PageableDefault(page=0, size=8, sort="movieId", direction= Sort.Direction.DESC) Pageable pageable,
                            @RequestParam(value = "searchKeyword", required = false) String searchKeyword) {
      Page<Movie> movieList = null;

        if(searchKeyword == null) {
          movieList = movieService.movieList(pageable);
        }

        int nowPage = movieList.getPageable().getPageNumber();
        int pageGroupSize = 5;  // 한 페이지 그룹에서 보여줄 페이지 수
        int totalPageGroups = (int)Math.ceil((double)movieList .getTotalPages() / pageGroupSize);    // 전체 페이지 그룹 수
        int currentPageGroup = (nowPage -1) / pageGroupSize;    // 현재 페이지가 속한 페이지 그룹
        int startPage = currentPageGroup * pageGroupSize + 1; // 현재 페이지
        int endPage = Math.min(startPage + pageGroupSize - 1, movieList.getTotalPages()); // 현재 페이지 그룹의 마지막 페이지


        model.addAttribute("movieList", movieList);
        model.addAttribute("nowPage", nowPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);



        return "movie/movieHome";
    }

    @GetMapping("/showDetail")
    public String showDetail(@RequestParam("movieId") Long movieId, Model model) {
           Optional <Movie> movie = movieService.selectMovieDetailById(movieId);

           if(movie.isPresent()) {
               model.addAttribute("movie", movie.get());
           } else {
               model.addAttribute("movie", null);
           }

        //영화 평점 start
        Float popularityValue = movie.get().getMvPopularity();
        Float minPopularity = 0.0f;
        Float maxPopularity = 10.0f;
        Float minRating = 0.0f;
        Float maxRating = 5.0f;

        if (popularityValue == null) {
            popularityValue = 0.0f;
        }
        Float rating = ((popularityValue - minPopularity) / (maxPopularity - minPopularity)) * (maxRating - minRating) + minRating;

        DecimalFormat df = new DecimalFormat("0.0");
        String formattedRating = df.format(rating);

        String finalRating = formattedRating + "/100";

        model.addAttribute("movieRating", finalRating);
        //영화 평점  end



        return "movie/detail";
    }

    @GetMapping("/movieSeats")
    public String movieSeats(@RequestParam("movieId") Long movieId, Model model) {

        Optional <Movie> movie = movieService.selectMovieDetailById(movieId);

        if(movie.isPresent()) {
            model.addAttribute("movie", movie.get());
        } else {
            model.addAttribute("movie", null);
        }
        return "movie/movieSeats";
    }

    @GetMapping("/moviesList")
    @ResponseBody
    public ResponseEntity<Page<Movie>> getMovies(
            @PageableDefault(page = 0, size = 8, sort = "movieId", direction = Sort.Direction.DESC) Pageable pageable,
            @RequestParam(value = "searchKeyword", required = false) String searchKeyword) {

        Page<Movie> movieList;
        if (searchKeyword != null && !searchKeyword.trim().isEmpty()) {
            movieList = movieService.findMoviesByKeyword(searchKeyword, pageable);
        } else {
            movieList = movieService.movieList(pageable);
        }
        return ResponseEntity.ok(movieList);
    }

    @GetMapping("/ticketing")
    public String ticketing ((@RequestParam("movieId") Long movieId, Model model) {
        Movie ticketingMovie = movieService.selectMovieDetailById(movieId).orElseThrow(()-> new RuntimeException("해당 id를 가진 영화가 없습니다"));
        model.asMap().forEach((key, value) -> log.info(key +": "+value));
        return "movie/ticketing";
    }

    // @ExceptionHandler or @ControllerAdvice를 통해 오류 처리할것

}
