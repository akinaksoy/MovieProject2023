//
//  BaseService.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 20.01.2023.
//

import Foundation
import Alamofire

public class BaseService {
    
    class func responseService(_ url: URL,
                               method: HTTPMethod,
                               encoding: ParameterEncoding = URLEncoding.default,
                               completion: @escaping (Data?,Error?) -> Void) {
        
        ApiManager.ApiRequest(url, method: method, encoding: encoding) { responseData in
            
            if let statusCode = responseData.response?.statusCode {
                switch statusCode {
                case 200...299:
                    if let response = responseData.data {
                        completion(response, nil)
                    }
                default:
                    completion(nil, responseData.error)
                }
            }
        }
    }
}

