//
//  BaseInterceptor.swift
//  week9
//
//  Created by 이상엽 on 6/3/24.
//

import Foundation
import Alamofire

class BaseInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        
        var request = urlRequest
        
        //헤더 부분 넣어주기
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Accept")
        
        completion(.success(request))
    }
}
