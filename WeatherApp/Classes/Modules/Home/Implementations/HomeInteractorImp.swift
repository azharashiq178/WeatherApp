//
//  HomeInteractorImp.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 06/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation
import CoreLocation


class HomeInteractorImp: HomeInteractor {

    var presenter: HomePresenterImp?
    
    fileprivate lazy var scheduleLocationManager = ScheduledLocationManager()
    
    
    init() {
        startTrackingUserLocation()
    }
    
    func startTrackingUserLocation() {
        
        scheduleLocationManager.getUserLocationWithInterval(interval: 30)
        scheduleLocationManager.delegate = self
    }
    
    
}





extension HomeInteractorImp: ScheduledLocationManagerDelegate {
    
    func scheduledLocationManage(_ manager: ScheduledLocationManager, didUpdateLocation newLocation: CLLocation) {
        
    }
    
    
    func scheduledLocationManage(_ manager: ScheduledLocationManager, didFailWithError error: Error) {
        
        QL1(error.localizedDescription)
    }
}

