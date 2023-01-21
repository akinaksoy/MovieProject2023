//
//  MovieManager.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 21.01.2023.
//

import Foundation

struct MovieManager {
    static var shared = MovieManager()
    var movies : Movie?
    
    func getImageList() -> [String] {
        var images = [String]()
        if let movies = movies, let movieList = movies.results {
            
            for item in movieList {
                if let posterPath = item.posterPath {
                    images.append("\(NetworkConstants.imageUrl)\(posterPath)")
                }
            }
        }
        return images
    }
    
    
}
