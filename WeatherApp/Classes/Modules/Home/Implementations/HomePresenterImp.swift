//
//  HomePresenterImp.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 06/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation
import AlamofireImage

class HomePresenterImp: HomePresenter {
    
    var view: HomeViewController?
    
    var interactor: HomeInteractorImp?
    
    var router: HomeRouterImp?
    
    
    private var weatherReportList = [Daily]()
    
    func populateData(with weatherReportList : [Daily]) {
        
        self.weatherReportList = weatherReportList
        view?.reloadData()
    }
    
    
    func refreshWithCurrentLocation() {
        interactor?.startTrackingUserLocation()
    }
    
    
    
    
    func updateHomeScreenContent(with data : Daily) {
        
        var currentTemperature = ""
        var currentDate = ""
        var temperatureRange = ""
        
        
        if let temperature = data.temp {
            temperatureRange = convertKelvinToCelcius(with: temperature.max) + "°" + "  |   " + convertKelvinToCelcius(with: temperature.min) + "°"
            
            currentTemperature = convertKelvinToCelcius(with: temperature.day) + "°C"
            
            
            if let unixDate = data.dt {
                
                let date = Date.init(timeIntervalSince1970: TimeInterval(unixDate))
                
                currentDate = date.stringFromDate("EEE dd MMM") ?? ""
                
            }
        }
        downloadImageForHomeScreen(with: data)
        view?.updateHomeScreenContent(with: currentTemperature, currentDate: currentDate, temperatureRange: temperatureRange)
        

        
    }
    
    
    func downloadImageForHomeScreen(with data : Daily) {
        
        
        if let weatherList = data.weather, weatherList.count != 0 {
            let urlStr = "http://openweathermap.org/img/wn/\(weatherList[0].icon!)@4x.png"
            if let url = URL(string: urlStr) {
                
                let downloader = ImageDownloader()
                let urlRequest = URLRequest(url: url)

                downloader.download(urlRequest) { [weak self] response in
                    guard let weakSelf = self else { return }

                    if case .success(let image) = response.result {
                        weakSelf.view?.updateWeatherImage(with: image)
                    }
                }
            }
        }
        
    }
    
    
}



extension HomePresenterImp : TablePresenter {
    
    func numberOfRowsInSection(section: Int) -> Int {
        return weatherReportList.count
    }
    
    
    func getTableData<T>(row: Int, section: Int) -> T? {
        
        return weatherReportList[row] as? T
        
    }
    
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func didSelectRow(row: Int, section: Int) {
        
        if let data = interactor?.getHomeScreenContent(at: row) {
            updateHomeScreenContent(with: data)
        }
        
        
    }
    
    
    func updateCityName(with name : String) {
        view?.updateCityName(with: name)
    }
    
    
}
