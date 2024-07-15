//
//  ApiLogger.swift
//  week9
//
//  Created by 이상엽 on 6/3/24.
//

import Foundation
import Alamofire



final class ApiLogger: EventMonitor {
    let queue = DispatchQueue(label: "OAuth_alamofire_tutorial_Apilogger")

    // Event called when any type of Request is resumed.
    func requestDidResume(_ request: Request) {
        print("ApiLogger - Resuming: \(request)")
    }

    // Event called whenever a DataRequest has parsed a response.
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        debugPrint("ApiLogger - Finished: \(response)")
    }
}
