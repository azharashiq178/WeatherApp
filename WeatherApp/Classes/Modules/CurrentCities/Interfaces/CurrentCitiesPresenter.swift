//
//  CurrentCitiesPresenter.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 06/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation

protocol CurrentCitiesPresenter {
    
    var view: CurrentCitiesViewController? { get set }
    var interactor: CurrentCitiesInteractorImp? { get set }
    var router: CurrentCitiesRouterImp? { get set }
 
}
