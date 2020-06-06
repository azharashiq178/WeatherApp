//
//  LocalStorageManager.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 07/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import UIKit

class LocalStorageManager: NSObject {

    
    static var shared = LocalStorageManager()
    
    
    func getStoredCities() -> [PlaceEntity] {
        if let object = userDefaults.object(forKey: storedCitiesKey) as? Data {
            
            if let array = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(object) as? [PlaceEntity] {
                
                return array
                
            }
            
        }
        return [PlaceEntity]()
    }
    
    func insertCityInDefaults(with place : PlaceEntity) {
        
        var storedArr = getStoredCities()
        storedArr.append(place)
        
        
        let archivedData = try! NSKeyedArchiver.archivedData(withRootObject: storedArr, requiringSecureCoding: false)
        userDefaults.set(archivedData, forKey: storedCitiesKey)
        
        
    }
    
}
