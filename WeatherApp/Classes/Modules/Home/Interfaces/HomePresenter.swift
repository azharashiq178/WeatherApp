//
//  HomePresenter.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 06/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation
protocol HomePresenter {
    
    var view: HomeViewController? { get set }
    var interactor: HomeInteractorImp? { get set }
    var router: HomeRouterImp? { get set }
 
    func populateData(with weatherReportList : [Daily])
    func refreshWithCurrentLocation()
    func updateHomeScreenContent(with data : Daily)
    func downloadImageForHomeScreen(with data : Daily)
    
    func showCurrentCitiesScreen()
}
