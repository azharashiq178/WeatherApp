//
//  APISessionManager.swift
//  FANetworkLayer
//
//  Created by fahid.attique on 10/01/2020.
//  Copyright © 2020 fahid.attique. All rights reserved.
//

import Foundation
import Alamofire


public class APISessionManager: Session {
    
    
    public override func request<Parameters>(_ convertible: URLConvertible, method: HTTPMethod = .get, parameters: Parameters? = nil, encoder: ParameterEncoder = URLEncodedFormParameterEncoder.default, headers: HTTPHeaders? = nil, interceptor: RequestInterceptor? = nil, requestModifier: Session.RequestModifier? = nil) -> DataRequest where Parameters : Encodable {
        
        let request = super.request(convertible)
        request.responseString { (responseString) in
            if let url = try? convertible.asURL() { devLog("\n💚💚\n\(url)\n💚💚\n") }
            devLog("❤️❤️❤️\(responseString)\n❤️❤️❤️\n")
        }
        return request
        
    }
}
