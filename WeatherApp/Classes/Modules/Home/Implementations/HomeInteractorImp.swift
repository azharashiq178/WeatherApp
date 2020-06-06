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
    
    var weatherData : WeatherData?
    
    var nextWeekWeatherList = [Daily]()
    private var timeToRefetchLocationInMinutes = UInt(60 * 30)
    
    fileprivate lazy var scheduleLocationManager = ScheduledLocationManager()
    
    
    init() {
        startTrackingUserLocation()
    }
    
    
    
    func getHomeScreenContent(at index : Int) -> Daily {
        return nextWeekWeatherList[index]
    }
    
    
    
    func updateHomeScreenContent(with data : Daily) {
        presenter?.updateHomeScreenContent(with: data)
    }
    
    
    func startTrackingUserLocation() {
        scheduleLocationManager.stopGettingUserLocation()
        timeToRefetchLocationInMinutes = UInt(1)
        
        scheduleLocationManager.getUserLocationWithInterval(interval: timeToRefetchLocationInMinutes)
        scheduleLocationManager.delegate = self
    }
    
    
    
    func fetchWeatherForecastDataForSevenDays(with location : CLLocation) {
        
        let coordinates = location.coordinate
        
        let params : [String : Any] = ["lat" : coordinates.latitude, "lon" : coordinates.longitude, "appid": weatherApiKey]
        
        APIProvider().getSevenDaysForecast(with: params, completion: {[weak self](data) in
            
            guard let weakSelf = self else { return }
            weakSelf.weatherData = data
            
            if let nextSevenDaysList = data.daily {
                weakSelf.nextWeekWeatherList = nextSevenDaysList
                weakSelf.presenter?.populateData(with: nextSevenDaysList)
                let data = weakSelf.getHomeScreenContent(at: 0)
                weakSelf.updateHomeScreenContent(with: data)
            }
            
            
        }) { (error) in
            Utility.showAlert("", message: error.localizedDescription)
        }
    }
    
    
}





extension HomeInteractorImp: ScheduledLocationManagerDelegate {
    
    func scheduledLocationManage(_ manager: ScheduledLocationManager, didUpdateLocation newLocation: CLLocation) {
        
        timeToRefetchLocationInMinutes = UInt(60 * 30)
        
        scheduleLocationManager.stopGettingUserLocation()
        
        scheduleLocationManager.getUserLocationWithInterval(interval: timeToRefetchLocationInMinutes)
        
        fetchWeatherForecastDataForSevenDays(with: newLocation)
        
        newLocation.fetchCityAndCountry { [weak self] (cityName, countryName, error) in
            guard let weakSelf = self else { return }
            if error == nil {
                weakSelf.presenter?.updateCityName(with: cityName ?? "")
            }
        }
        
    }
    
    
    func scheduledLocationManage(_ manager: ScheduledLocationManager, didFailWithError error: Error) {
        
        QL1(error.localizedDescription)
    }
}








extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}
