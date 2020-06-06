//
//  HomeInteractor.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 06/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation
import CoreLocation

protocol HomeInteractor {
    
    var presenter: HomePresenterImp? { get set }
    
    
    func startTrackingUserLocation()
    func getHomeScreenContent(at index : Int) -> Daily
    func updateHomeScreenContent(with data : Daily)
    func fetchWeatherForecastDataForSevenDays(with location : CLLocation)
    
}
