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
        BaseService.responseService(.now_playing, method: .get) { movie,_ in
            self.nowPlayingMovies = movie
            let imageList = MovieManager.shared.getImageList()
            self.viewController?.updateImages(imageList)
            print(imageList)
        }
    }
    
    
}
