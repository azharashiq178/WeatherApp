//
//  NetworkManager.swift
//  FanTazTech
//
//  Created by Fahid Attique on 12/01/2018.
//  Copyright © 2018 Expertinsol. All rights reserved.
//

import Foundation


let networkManager = NetworkManager.shared

class NetworkManager: APIRoutable {

    var sessionManager: APISessionManager = APISessionManager()
    static let shared = NetworkManager()
    private init() {}
}
