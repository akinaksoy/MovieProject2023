//
//  DiscoverViewModel.swift
//  MovieApp2023
//
//  Created by Huawei PC on 20.01.2023.
//

import Foundation
import UIKit


class DiscoverViewModel {
    
    var nowPlayingMovies : [Result]?
    var upcomingMovies : [Result]?
    var viewController : DiscoverViewController?
    
    init(viewController : DiscoverViewController) {
        self.viewController = viewController
    }
    
    internal func fetchNowPlayingMovieList() {
        BaseService.responseService(.now_playing, method: .get) { movie,_ in
            self.upcomingMovies = movie?.results
            self.viewController?.reloadData()
        }
    }
    
    
}
