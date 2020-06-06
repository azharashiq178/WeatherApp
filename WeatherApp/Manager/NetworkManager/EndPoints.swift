//
//  EndPoints.swift
//  Housekeeping
//
//  Created by Muhammad Azher on 17/04/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation



enum MyEndPoint: URLDirectable {
    
    case getSeventDaysRecord
    
    
    
    func urlString() -> String {
        
        var endpoint = ""
        
        switch (self) {
            
        case.getSeventDaysRecord:
            endpoint = "onecall"
            
            
        }
        
        return "https://api.openweathermap.org/data/2.5/" + endpoint
    }
}
