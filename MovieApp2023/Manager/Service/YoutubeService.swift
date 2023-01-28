//
//  YoutubeService.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 23.01.2023.
//

import Foundation
import Alamofire

public class YoutubeService {
    
    class func responseService(_ query: String,
                               method: HTTPMethod,
                               encoding: ParameterEncoding = URLEncoding.default,
                               completion: @escaping (YoutubeSearchResponse?,String?) -> Void) {
        let baseURL = NetworkConstants.youtubeUrl
        let apiKey = NetworkConstants.youtubeAPI
        guard let querySpacing = query.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {return}
        let urlString = baseURL+querySpacing+apiKey
        guard let url = URL(string: urlString) else {
            completion(nil, "Server Error")
            return
        }
        
        ApiManager.ApiRequest(url, method: method, encoding: encoding) { responseData in
            
            if let statusCode = responseData.response?.statusCode {
                switch statusCode {
                case 200...299:
                    if let response = responseData.data {
                        let movie = try? JSONDecoder().decode(YoutubeSearchResponse.self, from: response)
                        completion(movie, nil)
                    }
                default:
                    completion(nil, responseData.error?.errorDescription)
                }
            }
        }
    }
}
