//
//  APIProvider.swift
//  Housekeeping
//
//  Created by Muhammad Azher on 17/04/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation
import ObjectMapper

class APIProvider {
    
    
    func getSevenDaysForecast(with params : [String : Any], completion: @escaping (WeatherData) -> Void, failure: @escaping (_ error: Error) -> Void) {
        
        
        let api = API(method: .get, endPoint: MyEndPoint.getSeventDaysRecord, isAuthorized: false,parameters: params)
        networkManager.requestObject(api, mapperType: WeatherData.self) { (result) in
            switch result {
            case .success(let weatherData):
                if weatherData.daily == nil {
                    let error = NSError.init(errorMessage: "Unable to get data.")
                    failure(error as NSError)
                }
                completion(weatherData)
                break
            case .failure(let error):
                failure(error)
                break
            }
        }
    }
    
    
    
}




