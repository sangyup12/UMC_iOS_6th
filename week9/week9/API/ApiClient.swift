//
//  ApiClient.swift
//  week9
//
//  Created by 이상엽 on 6/3/24.
//

import Foundation
import Alamofire
import Moya

// API호출 클라이언트
final class ApiClient{
    
    static let shared = ApiClient()
    
    static let BASE_URL = "https://phplaravel-574671-2229990.cloudwaysapps.com/api/"
    
    let inerceptors = Interceptor(interceptors: [
        BaseInterceptor() //application/json
    ])
    
    let monitors = [ApiLogger()] as [EventMonitor]
    
    var session: Session
    
    init() {
        print("ApiClient - init() called")
        session = Session(interceptor: inerceptors, eventMonitors: monitors)
    }
    
}
