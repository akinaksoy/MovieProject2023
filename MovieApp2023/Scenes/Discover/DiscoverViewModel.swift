//
//  DiscoverViewModel.swift
//  MovieApp2023
//
//  Created by Huawei PC on 20.01.2023.
//

import Foundation
import UIKit


class DiscoverViewModel {
    
    var nowPlayingMovies : Movie? {
        didSet {
            MovieManager.shared.movies = nowPlayingMovies
        }
    }
    var upcomingMovies : [Result]?
    var viewController : DiscoverViewController?
    
    init(viewController : DiscoverViewController) {
        self.viewController = viewController
    }
    
    internal func fetchNowPlayingMovieList() {
        MovieService.responseService(.now_playing, method: .get) { movie,_ in
            self.nowPlayingMovies = movie
            let imageList = MovieManager.shared.getImageList()
            self.viewController?.updateImages(imageList)
            print(imageList)
        }
    }
    
    internal func fetchYoutubeTrailer(index : Int) {
        var movieDetail : MovieDetailModel?
        if let movie = MovieManager.shared.movies?.results?[index], let movieTitle = movie.originalTitle{
            var videoElement : VideoElement?
            YoutubeService.responseService(movieTitle, method: .get) { videoResponse, error in
                if let videoResponse = videoResponse {
                    videoElement = videoResponse.items[0]
                }
                guard let videoElement = videoElement else {return}

                movieDetail = MovieDetailModel(title: movieTitle,
                                                    youtubeView: videoElement,
                                                    overview: movie.overview,
                                                    voteAverage: movie.voteAverage,
                                                    adult: movie.adult,
                                                    relaseDate: movie.releaseDate)
                if let movieDetail = movieDetail {
                    self.viewController?.navigateToMovieDetail(movieDetail: movieDetail)
                }
            }
            
        }
    }
    
}
