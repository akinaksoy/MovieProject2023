//
//  ApiManager.swift
//  MovieApp2023
//
//  Created by Akın Aksoy on 20.01.2023.
//

import Foundation
import Alamofire
class ApiManager {
    
    class func ApiRequest(_ url: URL,
                          method: HTTPMethod,
                          encoding: ParameterEncoding = URLEncoding.default,
                          completion: @escaping (AFDataResponse<Data?>) -> Void) {
        
        AF.request(url,
                   method: method,
                   parameters: nil,
                   encoding: encoding,
                   headers: nil,
                   interceptor: nil).response { (responseData) in
            
            completion(responseData)
        }
    }
}
