//
//  AuthRouter.swift
//  week9
//
//  Created by 이상엽 on 6/3/24.
//

import Foundation
import Alamofire

// 인증 라우터
// 회원가입 , 로그인, 토큰갱신

//enum AuthRouter: URLRequestConvertible{
//    case register(name: String, email: String, password: String)
//    case login(email: String, password: String)
//    case tokenRefresh
//    
//    var baseURL: URL {
//        return URL(string: ApiClient.BASE_URL)!
//    }
//    
//    var endPoint: String{
//        switch self {
//        case .register:
//            return "user/register"
//        case .login:
//            return "user/login"
//        }
//    }
//}
