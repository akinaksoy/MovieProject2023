//
//  Youtube.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 23.01.2023.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items : [VideoElement]
}

struct VideoElement : Codable {
    let id: IdVideoElement
}

struct IdVideoElement : Codable {
    let kind: String
    let videoId : String
}
