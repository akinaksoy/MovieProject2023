//
//  BaseService.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 20.01.2023.
//

import Foundation
import Alamofire

public class MovieService {
    
    class func responseService(_ type: NetworkConstants.Categories,
                               method: HTTPMethod,
                               encoding: ParameterEncoding = URLEncoding.default,
                               completion: @escaping (Movie?,String?) -> Void) {
        let baseURL = NetworkConstants.baseUrl
        let apiKey = NetworkConstants.apiKey
        let categoryType = type.rawValue
        guard let url = URL(string: baseURL+categoryType+apiKey) else {
            completion(nil, "Server Error")
            return
        }
        
        ApiManager.ApiRequest(url, method: method, encoding: encoding) { responseData in
            
            if let statusCode = responseData.response?.statusCode {
                switch statusCode {
                case 200...299:
                    if let response = responseData.data {
                        let movie = try? JSONDecoder().decode(Movie.self, from: response)
                        completion(movie, nil)
                    }
                default:
                    completion(nil, responseData.error?.errorDescription)
                }
            }
        }
    }
}

