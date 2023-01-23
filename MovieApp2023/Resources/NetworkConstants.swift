//
//  NetworkConstants.swift
//  MovieApp2023
//
//  Created by Huawei PC on 20.01.2023.
//

import Foundation


struct NetworkConstants {
    
    static let baseUrl = "https://api.themoviedb.org/3/movie/"
    static let apiKey = "?api_key=4e9def48a480fb4637caf940fa06f212"
    static let imageUrl = "https://image.tmdb.org/t/p/w500"
    
    static let youtubeUrl = "https://youtube.googleapis.com/youtube/v3/search?q="
    static let youtubeAPI = "&key=AIzaSyA73SwgcbIKRDEJKoMeV-JiQOO1leNUL7I"
    
    enum Categories : String{
        case now_playing = "now_playing"
    }
    
    
}



