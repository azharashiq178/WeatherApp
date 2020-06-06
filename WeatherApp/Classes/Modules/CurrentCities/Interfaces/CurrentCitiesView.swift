//
//  CurrentCitiesView.swift
//  WeatherApp
//
//  Created by Muhammad Azher on 06/06/2020.
//  Copyright © 2020 None. All rights reserved.
//

import Foundation

protocol CurrentCitiesView: BaseView {
    
    var presenter: CurrentCitiesPresenterImp? { get set }
    
}





protocol GooglePlacesProtocol {
    func didFinishDisplaying(with place : GMSPlace)
    func didFinishWithError(with error : Error)
}
