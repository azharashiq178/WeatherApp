//
//  HomeView.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 06/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation

protocol HomeView: BaseView {
    
    var presenter: HomePresenterImp? { get set }
    
    func reloadData()
    
    func updateCityName(with name : String)
    
    func updateHomeScreenContent(with currentTemperature : String, currentDate : String, temperatureRange : String)
    
    func updateWeatherImage(with image : UIImage)
}
